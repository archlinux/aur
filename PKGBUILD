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
  dotnet-build-deps-"$_dotnetsdkver"
  git
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
# No .nvchecker.toml: the repository is archived, so it can't change anymore.
_commit="cf32fc695b32c2eae848b693395c09222fe1d2ae"
source=("git+$url.git#commit=$_commit"
  "crossgen2-pack.targets"
  "check-assembly.ps1")
sha512sums=('51abd78f1d72f8c12bc8ee39bd311fa5fc3f1696d45ba25c4ba654103359a986c01e487783059b64ec0f6bf48386077fb4c2dd60a22fca076330acf5e17cd8f5'
  '0e1d6cc06c5ba0fcb465d3560d15dc63372e612be3c398cac09f225a40c6a8032781733e1aeda503ea64da97c9b9470fc5554bca2f6254ae45b9d0b3cf8d37a9'
  '2fe10d7b7a687eb8d80280086b33953b12b377e66d0f937e18d0967692a95fb3463480a788d700765dce640f60e8564348184e120a4e0ed45a4dceb8c9e8a12b')
b2sums=('826bc5cd8b212060820ad4eb800de18986ee4fb776e693049cd7e11e88234bccb28e360006a026ac0239b26a13727cdeefedcf30c8201265cf735504330257d1'
  '1c6d0dd9a35c57922f1ee7d746785106cb16666106b806a787c80e2a9e18c3523a241e68b6c0d964ff8378ef1c41a4875bb3ecb3366a21ff0e54b833c4e7d8a4'
  'a25a1f97ac5fd6974bc6806430b65e98113ea1d752aa83c0e31502218fafbe64cb026e4a74436889ad6b33085f35afe7ae0b71a3be0c38b99fda811ee64ca23d')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # RID of the .NET SDK, the build host crossgen2 runs on: arch-x64 for the source-built .NET of Arch,
  # linux-arm64 for Microsoft's build
  _host_rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
  # The RID the assembly is compiled for follows the package architecture ($CARCH), like powershell's:
  # the host's on a native build, Microsoft's portable linux-<arch> one from nuget.org on a cross build
  # (an x86_64 host building for aarch64), which has no source-built .NET for the target
  local _arch
  case "$CARCH" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
  esac
  if [[ "$_host_rid" == *-"$_arch" ]]; then
    _rid="$_host_rid"
  else
    _rid="linux-$_arch"
  fi
}

prepare() {
  _dotnet_env
  # The runtime and crossgen2 packs for ReadyToRun come from the .NET dotnet-build-deps-10.0
  # chooses: the source-built artifacts with dotnet-build-deps-10.0 (see crossgen2-pack.targets),
  # Microsoft's build from nuget.org with dotnet-build-deps-10.0-bin. A cross build has the runtime pack
  # of the target from nuget.org, the artifacts only have the host's.
  mkdir -p nuget-local
  local _artifacts _packs=("Microsoft.NETCore.App.Crossgen2.$_host_rid.*.nupkg")
  if [[ "$_rid" == "$_host_rid" ]]; then
    _packs+=("Microsoft.NETCore.App.Runtime.$_rid.*.nupkg")
  fi
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_packs[@]}"
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
  _dotnet_env
  # The assembly of a cross build ($CARCH differs from the build host) is for another architecture,
  # check it natively on the target instead
  if [[ "$_rid" != "$_host_rid" ]]; then
    echo 'powershell-mmi: skipping the check on a cross build; run it natively on the target' >&2
    return 0
  fi
  # The tests need the OMI server and client library (test.sh), so the assembly is only checked to
  # load with the identity and API PowerShell and modules expect
  HOME="$srcdir/home" pwsh -NoProfile -NonInteractive -File "$srcdir/check-assembly.ps1" \
    -Path "$srcdir/publish/Microsoft.Management.Infrastructure.dll"
}

# Fails if a binary in $pkgdir, also inside the .nupkg files there, is identical to one of the packages
# restored from a remote feed like nuget.org into $1, so no prebuilt binary slips in instead of one built
# from source
_check_prebuilt() {
  local _extracted="$srcdir/check-prebuilt" _metadata _file _hash _found=0
  local _binaries=(-type f '(' -name '*.dll' -o -name '*.exe' -o -name '*.so' -o -name '*.so.*' -o -name '*.dylib' ')')
  local -A _prebuilt=()
  while IFS= read -r -d '' _metadata; do
    grep -qE '"source": *"https?://' "$_metadata" || continue
    while IFS= read -r -d '' _file; do
      _prebuilt[$(sha256sum <"$_file")]="${_file#"$1"/}"
    done < <(find "${_metadata%/*}" "${_binaries[@]}" -print0)
  done < <(find "$1" -name .nupkg.metadata -print0)

  rm -rf "$_extracted"
  mkdir -p "$_extracted"
  while IFS= read -r -d '' _file; do
    mkdir -p "$_extracted/${_file#"$pkgdir"/}"
    bsdtar -xf "$_file" -C "$_extracted/${_file#"$pkgdir"/}"
  done < <(find "$pkgdir" -type f -name '*.nupkg' -print0)
  while IFS= read -r -d '' _file; do
    _hash=$(sha256sum <"$_file")
    if [[ -v "_prebuilt[$_hash]" ]]; then
      echo "Prebuilt binary: ${_file#"$_extracted"/} is ${_prebuilt[$_hash]}" >&2
      _found=1
    fi
  done < <(find "$pkgdir" "$_extracted" "${_binaries[@]}" -print0)
  rm -rf "$_extracted"
  return "$_found"
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

  _check_prebuilt "$srcdir/nuget"
}
