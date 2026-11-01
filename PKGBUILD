# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-pester-4
_module=Pester
pkgver=4.10.1
pkgrel=1
pkgdesc="Test and mock framework for PowerShell, Pester (version 4)"
# Gherkin.dll is compiled to a ReadyToRun image for the architecture
arch=(x86_64 aarch64)
url='https://github.com/pester/Pester'
license=(Apache-2.0)
_dotnetsdkver="10.0"
depends=(
  powershell
)
makedepends=(
  "dotnet-build-deps-$_dotnetsdkver"
  dotnet-gherkin-5
)
# hostname, which the tests of the test result files compare the machine name with
checkdepends=(inetutils)
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
  '0e1d6cc06c5ba0fcb465d3560d15dc63372e612be3c398cac09f225a40c6a8032781733e1aeda503ea64da97c9b9470fc5554bca2f6254ae45b9d0b3cf8d37a9'
  'b15da74ebe8f4e77ef43138d79be28f9adc4ad09ed4b796c3198a54a2583928b4b756c1626ef2fcf63adff07eb3566435bfb28ac3911b7538aa89c165ed610ab')
b2sums=('7533a4ed44964bcb3878e8a968c86cce9eb6e77a663bf08dee0acbc4ad66d144e76153a5865e008747bb24cfd43f82b6ec5b49748773f6e4109f2a81bcc4dfb8'
  '995a7fb46b41713c7c391de75d01fbdab414c03193e27a5abc773460b4212932fe84d14080f3cdb83d3fb17356b504aac794271d1d12eb50f00142526d1b4536'
  '8ee8bc3bbe9a512f1b49c65d0d9a33412deef83ad1ca3145c9edd59097f49034befa7bd5756520375ef1f074011cb33897daefd60017459fb5fe04973f8988c6'
  '1c6d0dd9a35c57922f1ee7d746785106cb16666106b806a787c80e2a9e18c3523a241e68b6c0d964ff8378ef1c41a4875bb3ecb3366a21ff0e54b833c4e7d8a4'
  '70d2e695a116fb5d4fecf52bf79f16f4c6c7db64c0244ce04b5de0a185f1ef7c77b5c71f892199f7e531936b8d51f619ac5469cbfc8a31089d5a6861ec7beed5')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # RID of the .NET SDK, the build host crossgen2 runs on: arch-x64 for the source-built .NET of Arch,
  # linux-arm64 for Microsoft's build
  _host_rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
  _runtimever=$(dotnet --list-runtimes | grep -F "NETCore.App $_dotnetsdkver" | sed -E "s/[[:alnum:]\.]+ ([[:digit:]\.]+) .*/\1/")
  # The architecture and RID Gherkin.dll is compiled for follow the package architecture ($CARCH), like
  # powershell's: the host's RID on a native build, Microsoft's portable linux-<arch> one from nuget.org
  # on a cross build (an x86_64 host building for aarch64), which has no source-built .NET for the target
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
  cd "Pester-$pkgver" || exit
  # The Gherkin parser comes from dotnet-gherkin-5 instead of the prebuilt one. The one for Windows
  # PowerShell (legacy) isn't needed, as PowerShell loads the one for .NET (core).
  rm -r lib/Gherkin/core lib/Gherkin/legacy vendor
  mkdir lib/Gherkin/core
  bsdtar -xOf "/usr/share/nuget/packages/Gherkin.5.1.0.nupkg" lib/netstandard2.0/Gherkin.dll \
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
  # The crossgen2 of the .NET runtime, which the SDK gets for a project published with ReadyToRun: from
  # the source-built artifacts with dotnet-build-deps-10.0 (see crossgen2-pack.targets), Microsoft's
  # build from nuget.org with dotnet-build-deps-10.0-bin. A cross build has the runtime pack of the
  # target from nuget.org, the artifacts only have the host's.
  mkdir -p crossgen2 nuget-local
  local _artifacts _packs=("Microsoft.NETCore.App.Crossgen2.$_host_rid.*.nupkg")
  if [[ "$_rid" == "$_host_rid" ]]; then
    _packs+=("Microsoft.NETCore.App.Runtime.$_rid.*.nupkg")
  fi
  for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
    [[ -f "$_artifacts" ]] || continue
    bsdtar -xf "$_artifacts" -C nuget-local "${_packs[@]}"
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
  # provides Newtonsoft.Json. A cross build compiles against the runtime pack of the target, which has
  # System.Private.CoreLib in native/.
  local _runtime=("/usr/share/dotnet/shared/Microsoft.NETCore.App/$_runtimever/*.dll")
  if [[ "$_rid" != "$_host_rid" ]]; then
    _runtime=("$NUGET_PACKAGES/microsoft.netcore.app.runtime.$_rid/$_runtimever/runtimes/$_rid/"{lib/"net$_dotnetsdkver",native}/'*.dll')
  fi
  local _reference _references=()
  for _reference in "${_runtime[@]}" '/usr/lib/powershell-7/*.dll'; do
    _references+=(-r "$_reference")
  done
  "$NUGET_PACKAGES/microsoft.netcore.app.crossgen2.$_host_rid/$_runtimever/tools/crossgen2" "Pester-$pkgver/lib/Gherkin/core/Gherkin.dll" --out Gherkin.dll \
    --targetos linux --targetarch "$_arch" -O "${_references[@]}"
  mv Gherkin.dll "Pester-$pkgver/lib/Gherkin/core/Gherkin.dll"
}

check() {
  _dotnet_env
  # Gherkin.dll of a cross build ($CARCH differs from the build host) is for another architecture, run
  # the tests natively on the target instead
  if [[ "$_rid" != "$_host_rid" ]]; then
    echo 'powershell-pester-4: skipping the tests on a cross build; run them natively on the target' >&2
    return 0
  fi
  # A temp folder of their own, so files with fixed names that another user's build left in /tmp
  # can't get in the way. It stays in /tmp rather than $srcdir, as .NET's named pipes are sockets in
  # it, whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"
  # With the user's PowerShell data in $srcdir
  HOME="$srcdir/home" pwsh -NoProfile -NonInteractive -File "$srcdir/invoke-tests.ps1" -Path "$srcdir/Pester-$pkgver"
  rm -rf "${_test_tmp:?}"
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
  cd "Pester-$pkgver" || exit
  # The files of the PowerShell Gallery package (buildPSGalleryPackage.ps1), without the tests
  # (cleanUpBeforeBuild.ps1)
  local _destdir="$pkgdir/usr/share/powershell/Modules/$_module/$pkgver"
  install -dm755 "$_destdir"
  cp -r --no-preserve=ownership Pester.ps?1 nunit_schema_2.5.xsd junit_schema_4.xsd \
    bin Functions Dependencies Snippets en-US lib "$_destdir/"
  find "$_destdir" -name '*.Tests.ps1' -delete
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  _check_prebuilt "$srcdir/nuget"
}
