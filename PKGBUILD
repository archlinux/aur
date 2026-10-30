# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-mmi
pkgver=2.0.0preview1
pkgrel=1
pkgdesc="Microsoft.Management.Infrastructure (MMI) for PowerShell, built from its open source code"
# The assembly is compiled to a ReadyToRun image for the architecture
arch=('x86_64' 'aarch64')
url='https://github.com/PowerShell/MMI'
license=('MIT')
_dotnetsdkver="10.0"
depends=(
  powershell
)
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  git
)
makedepends_x86_64=(
  dotnet-source-built-artifacts-"$_dotnetsdkver"
)
checkdepends=(
  powershell
)
provides=("$pkgname-bin")
conflicts=("$pkgname-bin")
# PowerShell is built without MMI. It's only needed by modules built against PowerShell with it, e.g.
# PSScriptAnalyzer from the PowerShell Gallery. The last commit of the archived repository, the managed
# part of MMI for Linux and macOS, whose API matches Microsoft's Runtime.Unix package
# (powershell-mmi-bin). The OMI client library (libmi) it calls isn't included, Microsoft's packages of
# PowerShell for Linux don't have it either, so CIM operations fail with or without this package.
_commit="cf32fc695b32c2eae848b693395c09222fe1d2ae"
source=("git+$url.git#commit=$_commit"
  "crossgen2-pack.targets"
  "check-assembly.ps1")
sha512sums=('51abd78f1d72f8c12bc8ee39bd311fa5fc3f1696d45ba25c4ba654103359a986c01e487783059b64ec0f6bf48386077fb4c2dd60a22fca076330acf5e17cd8f5'
  '340bfd8bcb4548a6b70954d1d17b5c402c47285979c3f2eae27ff8d3fd0547b54ddf934f41e4a777825a8cc9fc674589760b2f701db11a10c7e17f0af2cf3981'
  '2fe10d7b7a687eb8d80280086b33953b12b377e66d0f937e18d0967692a95fb3463480a788d700765dce640f60e8564348184e120a4e0ed45a4dceb8c9e8a12b')
b2sums=('826bc5cd8b212060820ad4eb800de18986ee4fb776e693049cd7e11e88234bccb28e360006a026ac0239b26a13727cdeefedcf30c8201265cf735504330257d1'
  '3493eecfb50819af971399abe1e62782ccf28500559d222822bddb91ddac6bf191d7e20abf01dfbcb99f7c51df9356061c8f1687a10700228e7d1f77308e873b'
  'a25a1f97ac5fd6974bc6806430b65e98113ea1d752aa83c0e31502218fafbe64cb026e4a74436889ad6b33085f35afe7ae0b71a3be0c38b99fda811ee64ca23d')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # RID of the .NET SDK: arch-x64 for the source-built .NET of Arch, linux-arm64 for Microsoft's build
  _rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
}

prepare() {
  _dotnet_env
  # The runtime and crossgen2 packs for ReadyToRun come from the source-built .NET where it's
  # installed (see crossgen2-pack.targets), nuget.org otherwise
  mkdir -p nuget-local
  local _artifacts
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "Microsoft.NETCore.App.Crossgen2.$_rid.*.nupkg" \
      "Microsoft.NETCore.App.Runtime.$_rid.*.nupkg"
  done

  cd MMI || exit
  rm global.json
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
</configuration>
EOF
  # Built for the .NET PowerShell runs on instead of .NET Standard 2.0, so the packages it compiled
  # against (System.Security.SecureString and the like) are part of .NET. Unsigned like Microsoft's
  # build in the Runtime.Unix package, with its key the build would only be delay signed. The constants
  # of its Linux configuration apply to the Release one.
  sed -i -E \
    -e "s|<TargetFramework>netstandard2.0</TargetFramework>|<TargetFramework>net$_dotnetsdkver</TargetFramework>|" \
    -e '/<PackageReference /d' \
    -e '/<DelaySign>|<AssemblyOriginatorKeyFile>/d' \
    -e "s|<PropertyGroup Condition=\"'\\\$\(Configuration\)' == 'Linux' \">|<PropertyGroup>|" \
    src/Microsoft.Management.Infrastructure/Microsoft.Management.Infrastructure.csproj
}

build() {
  _dotnet_env
  cd MMI || exit
  # The analyzers of newer .NET versions aren't errors
  dotnet publish src/Microsoft.Management.Infrastructure --configuration Release \
    --runtime "$_rid" --no-self-contained --output "$srcdir/publish" \
    -p:TreatWarningsAsErrors=false -p:EnableNETAnalyzers=false \
    -p:PublishReadyToRun=true -p:CustomAfterMicrosoftCommonTargets="$srcdir/crossgen2-pack.targets" \
    -p:DisableTransitiveFrameworkReferenceDownloads=true \
    -p:SourceRevisionId="$_commit" -p:EnableSourceControlManagerQueries=false
}

check() {
  # The tests need the OMI server and client library (test.sh), so the assembly is only checked to
  # load with the identity and API PowerShell and modules expect
  HOME="$srcdir/home" pwsh -NoProfile -NonInteractive -File "$srcdir/check-assembly.ps1" \
    -Path "$srcdir/publish/Microsoft.Management.Infrastructure.dll"
}

package() {
  local _pshome=/usr/lib/powershell-7
  install -Dm644 "$srcdir/publish/Microsoft.Management.Infrastructure.dll" -t "$pkgdir$_pshome/"
  # Added to pwsh.deps.json by the powershell-deps hook of powershell, the .NET host only loads the
  # assemblies it lists
  install -dm755 "$pkgdir/usr/share/powershell/deps.d"
  cat >"$pkgdir/usr/share/powershell/deps.d/microsoft-management-infrastructure.json" <<EOF
{
  "targets": {
    ".NETCoreApp,Version=v$_dotnetsdkver": {
      "Microsoft.Management.Infrastructure/2.0.0": {
        "runtime": {
          "Microsoft.Management.Infrastructure.dll": {
            "assemblyVersion": "2.0.0.0",
            "fileVersion": "2.0.0.0"
          }
        }
      }
    }
  },
  "libraries": {
    "Microsoft.Management.Infrastructure/2.0.0": {
      "type": "project",
      "serviceable": false,
      "sha512": ""
    }
  }
}
EOF
  install -Dm644 MMI/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
