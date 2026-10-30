# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-pester-4
_module=Pester
pkgver=4.10.2beta1
pkgrel=1
pkgdesc="Test and mock framework for PowerShell, Pester (version 4)"
# Gherkin.dll is compiled to a ReadyToRun image for the architecture
arch=('x86_64' 'aarch64')
url='https://github.com/pester/Pester'
license=('Apache-2.0')
_dotnetsdkver="10.0"
depends=(
  powershell
)
makedepends=(
  dotnet-gherkin-5
  dotnet-sdk-"$_dotnetsdkver"
)
makedepends_x86_64=(
  dotnet-source-built-artifacts-"$_dotnetsdkver"
)
# Pester 5 isn't compatible with tests written for Pester 4, like PowerShell's own, which ask for
# version 4 (Save-Module -Name Pester -MaximumVersion 4.99 in build.psm1).
# The latest commit of the 4.x branch, which only gets security fixes now. It has fixes that were
# never released since 4.10.1 and versions the module as 4.10.2-beta1.
_commit="fe25ff3ffa96734d23f6d4b8d2933431b146006e"
source=("Pester-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "crossgen2-pack.targets"
  "invoke-tests.ps1")
sha512sums=('4220951f1721f547319fd3de64c52b721f6166b181d4333f0298b5cd13342efb43783734edde55ebddbbb0cdcf7459981d90745b17c8f58ac68dbe797f1a1b4b'
            '340bfd8bcb4548a6b70954d1d17b5c402c47285979c3f2eae27ff8d3fd0547b54ddf934f41e4a777825a8cc9fc674589760b2f701db11a10c7e17f0af2cf3981'
            '3a77144c1cc4913a4daeedd785ced6a96a6642c8b41c5f8481dbdb42540ab1a970ad0850de0bed0b000ddcb7e6ed07c2e307c67d4f766528588685e71e7864b7')
b2sums=('a7ece0e081f30526a1e2d674da520deb4c64f5a8e222b61b9c706ee766f53025c8736c22cdb14108159b4e62264793af9ba48b7c74adc51defcb09afee56aa97'
        '3493eecfb50819af971399abe1e62782ccf28500559d222822bddb91ddac6bf191d7e20abf01dfbcb99f7c51df9356061c8f1687a10700228e7d1f77308e873b'
        'f5837db9d212e30aecf4d4a630d691acdd7cb05be9a68e97287516e0e860b2302ef482e1c5b7b9edd66689e98b057ec328c4ef2d8cd5ba7cddb2734c04661bfa')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # RID of the .NET SDK: arch-x64 for the source-built .NET of Arch, linux-arm64 for Microsoft's build
  _rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
  _runtimever=$(dotnet --list-runtimes | grep -F "NETCore.App $_dotnetsdkver" | sed -E "s/[[:alnum:]\.]+ ([[:digit:]\.]+) .*/\1/")
}

prepare() {
  cd "Pester-$_commit" || exit
  # The Gherkin parser comes from dotnet-gherkin-5 instead of the prebuilt one. The one for Windows
  # PowerShell (legacy) isn't needed, as PowerShell loads the one for .NET (core).
  rm -r lib/Gherkin/core lib/Gherkin/legacy vendor
  mkdir lib/Gherkin/core
  bsdtar -xOf "/usr/share/dotnet/nuget-packages/Gherkin.5.1.0.nupkg" lib/netstandard2.0/Gherkin.dll \
    >lib/Gherkin/core/Gherkin.dll
}

build() {
  _dotnet_env
  # The crossgen2 of the .NET runtime, from the source-built artifacts where they're available, which
  # the SDK gets for a project published with ReadyToRun (see crossgen2-pack.targets)
  mkdir -p crossgen2 nuget-local
  local _artifacts
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "Microsoft.NETCore.App.Crossgen2.$_rid.*.nupkg" \
      "Microsoft.NETCore.App.Runtime.$_rid.*.nupkg"
  done
  cd crossgen2 || exit
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
  cat >crossgen2.csproj <<EOF
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net$_dotnetsdkver</TargetFramework>
    <RuntimeIdentifier>$_rid</RuntimeIdentifier>
    <SelfContained>false</SelfContained>
    <PublishReadyToRun>true</PublishReadyToRun>
    <DisableTransitiveFrameworkReferenceDownloads>true</DisableTransitiveFrameworkReferenceDownloads>
  </PropertyGroup>
</Project>
EOF
  dotnet restore -p:CustomAfterMicrosoftCommonTargets="$srcdir/crossgen2-pack.targets"
  cd "$srcdir" || exit

  # Like powershell's Invoke-ReadyToRunCompiler: against the .NET runtime and PowerShell, which
  # provides Newtonsoft.Json
  local _arch
  case "$CARCH" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
  esac
  "$NUGET_PACKAGES/microsoft.netcore.app.crossgen2.$_rid/$_runtimever/tools/crossgen2" "Pester-$_commit/lib/Gherkin/core/Gherkin.dll" --out Gherkin.dll \
    --targetos linux --targetarch "$_arch" -O \
    -r "/usr/share/dotnet/shared/Microsoft.NETCore.App/$_runtimever/*.dll" -r '/usr/lib/powershell-7/*.dll'
  mv Gherkin.dll "Pester-$_commit/lib/Gherkin/core/Gherkin.dll"
}

check() {
  # With the user's PowerShell data in $srcdir
  HOME="$srcdir/home" pwsh -NoProfile -NonInteractive -File "$srcdir/invoke-tests.ps1" -Path "$srcdir/Pester-$_commit"
}

package() {
  cd "Pester-$_commit" || exit
  # The files of the PowerShell Gallery package (buildPSGalleryPackage.ps1), without the tests
  # (cleanUpBeforeBuild.ps1)
  local _destdir="$pkgdir/usr/share/powershell/Modules/$_module/${pkgver%%[a-z]*}"
  install -dm755 "$_destdir"
  cp -r --no-preserve=ownership Pester.ps?1 nunit_schema_2.5.xsd junit_schema_4.xsd \
    bin Functions Dependencies Snippets en-US lib "$_destdir/"
  find "$_destdir" -name '*.Tests.ps1' -delete
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
