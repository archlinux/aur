# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-pester-4
_module=Pester
pkgver=4.10.1
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
# version 4 (Save-Module -Name Pester -MaximumVersion 4.99 in build.psm1). That's the latest stable
# release, 4.10.1, as Save-Module skips prereleases like 4.10.2-beta1.
source=("Pester-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "pester-failure-lines-core.patch"
  "pester-tests-new-timespan.patch"
  "crossgen2-pack.targets"
  "invoke-tests.ps1")
sha512sums=('1ca27ad9507547b04a9a6cb51bced6533312acff8a117ea10ac8843f2c25becda30b91c0c5e75693aa7870619238dfae3c86820e4ac04243cc42f7da8b0c37ca'
            '2139d7b806908ac6eff5af89545a7d5cbf8df2a5dc00704b6f61bc3fc475622e68bd8d37b9e9ba1e67b3b72734344059bbf8993361f4f405718df386f9db35c6'
            '543cf3242522b2b9a30245776d26d75a0b2722a6ccef98c1c13f2e57f3769c57e8c597784011ee861ede5a8d76b2fddd31bb15d91c544c0f6b33d46487f02fff'
            '340bfd8bcb4548a6b70954d1d17b5c402c47285979c3f2eae27ff8d3fd0547b54ddf934f41e4a777825a8cc9fc674589760b2f701db11a10c7e17f0af2cf3981'
            'f6cba5ee39c6cba9e860d8faeab2544ec489253a7b3bae6eab1bc64cddb8656b918d209e5902569b2708089e273875dd5994c59de4dd38440d79630bddbb7f9b')
b2sums=('7533a4ed44964bcb3878e8a968c86cce9eb6e77a663bf08dee0acbc4ad66d144e76153a5865e008747bb24cfd43f82b6ec5b49748773f6e4109f2a81bcc4dfb8'
        '995a7fb46b41713c7c391de75d01fbdab414c03193e27a5abc773460b4212932fe84d14080f3cdb83d3fb17356b504aac794271d1d12eb50f00142526d1b4536'
        '8ee8bc3bbe9a512f1b49c65d0d9a33412deef83ad1ca3145c9edd59097f49034befa7bd5756520375ef1f074011cb33897daefd60017459fb5fe04973f8988c6'
        '3493eecfb50819af971399abe1e62782ccf28500559d222822bddb91ddac6bf191d7e20abf01dfbcb99f7c51df9356061c8f1687a10700228e7d1f77308e873b'
        '79e70e2c384d96cf28db8af3cf584e6ecf6996873d0b85ee849d7eddb9ff0988ece73b6d1499eaf7e5728b15c16e3479d1e1ef386886b1e1e740aa5436cc53e0')

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
  cd "Pester-$pkgver" || exit
  # The Gherkin parser comes from dotnet-gherkin-5 instead of the prebuilt one. The one for Windows
  # PowerShell (legacy) isn't needed, as PowerShell loads the one for .NET (core).
  rm -r lib/Gherkin/core lib/Gherkin/legacy vendor
  mkdir lib/Gherkin/core
  bsdtar -xOf "/usr/share/dotnet/nuget-packages/Gherkin.5.1.0.nupkg" lib/netstandard2.0/Gherkin.dll \
    >lib/Gherkin/core/Gherkin.dll

  # The archive has CRLF line endings (.gitattributes), the patches from git LF
  sed -i 's/\r$//' Functions/Output.ps1 Functions/TestResults.Tests.ps1
  # Exception messages on PowerShell 7 include the parameter name, which the failure output shows on
  # a line of its own (upstream fix after 4.10.1, released in 4.10.2-beta1)
  patch -Np1 -i "$srcdir/pester-failure-lines-core.patch"
  # Tests: New-TimeSpan -mi is ambiguous on PowerShell 7 (-Milliseconds), upstream fix after 4.10.1
  patch -Np1 -i "$srcdir/pester-tests-new-timespan.patch"
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
  "$NUGET_PACKAGES/microsoft.netcore.app.crossgen2.$_rid/$_runtimever/tools/crossgen2" "Pester-$pkgver/lib/Gherkin/core/Gherkin.dll" --out Gherkin.dll \
    --targetos linux --targetarch "$_arch" -O \
    -r "/usr/share/dotnet/shared/Microsoft.NETCore.App/$_runtimever/*.dll" -r '/usr/lib/powershell-7/*.dll'
  mv Gherkin.dll "Pester-$pkgver/lib/Gherkin/core/Gherkin.dll"
}

check() {
  # With the user's PowerShell data in $srcdir
  HOME="$srcdir/home" pwsh -NoProfile -NonInteractive -File "$srcdir/invoke-tests.ps1" -Path "$srcdir/Pester-$pkgver"
}

package() {
  cd "Pester-$pkgver" || exit
  # The files of the PowerShell Gallery package (buildPSGalleryPackage.ps1), without the tests
  # (cleanUpBeforeBuild.ps1)
  local _destdir="$pkgdir/usr/share/powershell/Modules/$_module/$pkgver"
  install -dm755 "$_destdir"
  cp -r --no-preserve=ownership Pester.ps?1 nunit_schema_2.5.xsd junit_schema_4.xsd \
    bin Functions Dependencies Snippets en-US lib "$_destdir/"
  find "$_destdir" -name '*.Tests.ps1' -delete
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
