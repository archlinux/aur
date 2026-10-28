# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Rikarnto Bariampa <richard1996ba@gmail.com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

#######################################################################
# WARNING ABOUT check()
#
# The tests that come with PowerShell are being run by upstream in
# their CI and aren't really for testing a built PowerShell by users.
# Their CI agents have no persistent homes, so they can pollute their
# environment freely and their environment is also consistent.
#
# A significant number of tests don't use -NoProfile when calling pwsh,
# which can cause tests to fail if any form of profile is being loaded.
# Other tests have side effects or try to install test modules to the
# CurrentUser scope.
#
# While they can work in a normal build, I would strongly recommend to
# build PowerShell in a clean chroot (e.g. with pkgctl build) to prevent
# such issues and keep the home of the user building the package clean.
#######################################################################

pkgname=powershell
pkgver=7.6.9
pkgrel=2
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=('x86_64')
url='https://microsoft.com/PowerShell'
license=('MIT')
options=('!debug')
_dotnetsdkver="10.0"
# RID of the source-built .NET, whose packs come with dotnet-source-built-artifacts
_rid="arch-x64"
# PowerShell-Native has no tag for the version PowerShell uses (700.0.2), it was published from this commit
_psnativecommit="f24d5494b373de20ec3e3d2fdc7c3fc98af1f9f1"
# The modules PowerShell bundles (src/Modules/PSGalleryModules.csproj) are built from source as well.
# Upstream didn't tag most of their releases, so these are the commits used:
# - PowerShellGet 2.2.5: last commit (2.2.5.1) of the archived PowerShellGetv2 repository
_psgetcommit="3b38eec8742d6b6f26cf0f010e0dd95691ed5ade"
# - PackageManagement 1.4.8.1: release commit, later ones drop .NET Core support
_onegetcommit="923260b2f2cbc5b66d90ef2e31f240b9d8579a74"
# - Microsoft.PowerShell.Archive 1.2.6: release commit on the servicing branch
_archivecommit="87428e309898a728fb0287eab31b5cd214ceb9ba"
# - Microsoft.PowerShell.ThreadJob 2.2.0: release commit
_threadjobcommit="21d19c867ef05d22fe70aa39e45ab0c479a930e0"
# - Microsoft.PowerShell.Pager 1.0.0, a dependency of PSReadLine: last commit of the archived repository
_pagercommit="965675f549dfa074eb02a47ca6d6e07d0ee7771f"
_psresourcegetver="1.2.0"
_psreadlinever="2.4.5"
depends=(
  dotnet-runtime-"$_dotnetsdkver"
  libgcc
  # xdg-utils are indirectly needed for System.Diagnostics.Process() with
  # ProcessStartInfo.UseShellExecute (see src/System/Diagnostics/Process.Linux.cs of the dotnet runtime)
  # PowerShell relies on this for its invoke logic, c.f. src/System.Management.Automation/namespaces/FileSystemProvider.cs
  xdg-utils
)
backup=('etc/powershell.config.json')
optdepends=('openssh: PowerShell Remoting over ssh'
  'xclip: Clipboard functionality'
  'powershell-dsc: PowerShell Desired State Configuration v3 support'
  'powershell-editor-services: Language server and debug adapter for PowerShell editor support')
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-source-built-artifacts-"$_dotnetsdkver"
  cmake
  gtest
  git
  rsync
  ruby-ronn
)
checkdepends=(
  # ASP.NET is needed for test/tools/WebListener
  aspnet-targeting-pack-"$_dotnetsdkver"
  aspnet-runtime-"$_dotnetsdkver"
  bash          # Needed for various tests, e.g. test/powershell/Language/Scripting/NativeExecution/NativeLinuxCommands.Tests.ps1
  expect        # Needed for test/powershell/Host/Read-Host.Tests.ps1
  glibc-locales # Ensures generated en-US locale is present. Tests need to be run in that locale and we can't call locale-gen from a PKGBUILD.
  grep          # Used widely in tests
  inetutils     # Needed for test/powershell/Modules/Microsoft.Powershell.Host/Start-Transcript.Tests.ps1
  iputils       # Needed for ping, which is used in a lot of places
  lttng-ust2.12 # Used for CoreCLR tracing, adds to reproducibility here
  openssh       # Needed for test/powershell/engine/Remoting/SSHRemotingCmdlets.Tests.ps1
  procps-ng     # Needed for test/powershell/Language/Scripting/NativeExecution/NativeCommandProcessor.Tests.ps1
  xclip         # Needed for test/powershell/Modules/Microsoft.PowerShell.Management/Clipboard.Tests.ps1
)
install=powershell.install

source=("git+https://github.com/PowerShell/PowerShell.git#tag=v$pkgver"
  "git+https://github.com/PowerShell/PowerShell-Native.git#commit=$_psnativecommit"
  "git+https://github.com/PowerShell/PowerShellGetv2.git#commit=$_psgetcommit"
  "git+https://github.com/OneGet/oneget.git#commit=$_onegetcommit"
  "git+https://github.com/OneGet/NuGetProvider.git"
  "git+https://github.com/PowerShell/PSResourceGet.git#tag=v$_psresourcegetver"
  "git+https://github.com/PowerShell/Microsoft.PowerShell.Archive.git#commit=$_archivecommit"
  "git+https://github.com/PowerShell/PSReadLine.git#tag=v$_psreadlinever"
  "git+https://github.com/PowerShell/Pager.git#commit=$_pagercommit"
  "git+https://github.com/PowerShell/ThreadJob.git#commit=$_threadjobcommit"
  "psmodulepath-combined-paths.patch"
  "cim-windows-only.patch"
  "oneget-user-temp-folder.patch"
  "nuget-modules.config"
  "powershell-modules.psm1"
  "build-modules.ps1"
  "update-help.ps1"
  "invoke-pester.ps1")
sha512sums=('4b0cc568a858d1c8fa38a6fc8a48e7c3d7c00bdb182f8c1905d11ed73d44e4111dd784255b61790322ba17e912edb3942b77df752eacb39f062128647418a502'
            '673e931ea136511fa2c638035334a7ea1800aafb1d4100d94cf0adf1086888f765a3d92f9f294060c5f088eab4d4c12c2d70cc5dc5a4ec4f56b80f26d16cc644'
            '326b55c2eff49b21b427812c394afd000ef3e5b4da86dca087fb897e39e423be3b5c105e087f79da5dc39b0b268a9c0876f198ab67b845f31ee765caa4694aac'
            'c9efa8a5c497dad6dfb773c17f01e004f65e842bac4612c5842563efe0d07fff5d64a1729c8436e4bcdb5f4cac24202168855fded3c31e1cff764303718883c3'
            'SKIP'
            '54d081330468a9629f5aa8166defef423cd923f5a53065a4657ab15c691946f0c04c398525a99bdc3652a4d1bbf0965f4575e814216f3ae16e83d08127eeaadb'
            '6c3004608cc1d2089712e8400001a4557c0de8e1e7e755184cd3e683e6b2ba497f373c1f77cd3a52d2fcd2045ee089957095d54fb899e02bf7185cbe8ad17ccd'
            '4b4ac87e70c04e4d85ac4b772024c3cf5aec574259654bc9f58f9d06cccacfd84d68415de87e5804f7beb33ae8679b47d58221a014c7b55e960eba93e70cfaae'
            '177593575d59629bb9f8020a52205c9617170b3212033ab21787d8739ac3af3d283b706ee607f29d6473415cee9ed5a8d23a4d53e90d52360a72f796f9b1bda8'
            '50088e4e83b25a8211f35d29e844f69d1a03598d347d82179fb1228cabd6a1f158db5e23c6d9ce91a91cf2721f8e36e9572e30ee71e2e2c731181ae31678eb42'
            '79e554984a743d8ced1789a7103ed684e3af37a3b415820fb7da5e51f5f513d5131eb813b0e9b5dbeace9cb06558a548212fa503600d16c301fcc53cb483e423'
            '96ce607ab0c3d5a8d1670913d09ebc5575cad958fc427641b9d2c9e6982997c6659c6f20d9c0df1ebae57c77bc9efcf43fff39753a9821efad5b0dd35f190999'
            '08a87bb665198854dc4e805f35760bca536177800ae448518c5edd63d314d6d909d53ae52f37c6cca523c9b6c4de9b0b7f952a2313a58eb5d8718ee96b818f39'
            '2a183bbbdbc42f55328f462bed4fce0752291395ae91c263e11e921c312f94d0c99b2180fce1e4f98e9e33af68fe83d8138217abe4a995fc7a52f442f20b7422'
            'c980d27b69778a0fc398ae6993cc44de42d1e85322ab0d63cd4e6611276f1ff7ae427013a7c63201a7320d56fda6eea0b8e53b2628572562ade832441e9667a1'
            '8957d27f6ffb10f237522e547d570526e81f8ef06bbce377890db5f68e1e62d1c0afbc90ebfd2c9b34b9ff122e6a4aff67353a6a2a81772d1983130068259e03'
            '4560d42b8232c7770d11a2fba6a86b378f592e0d8ea196271b863c40e93c9dd3fd4b9c0b12ecfed994a571297a281ff0c1c6380ee4f9edf9039abfce2e59aeb3'
            '355d5bdb418cf2f9b7f19c9a4433fc350aca62e707669b9cb2b6661d9a12828e60158b8f58a8600e9566c09750f0c47c4144ec20af8681c8aba87a8718f227f5')
b2sums=('4646e39fda817e26ca00dbad2fd93675d15be7f6877cb29856009fecdfe5adcab604ebeda63c026a4eb0f4ccdb8f43b2d7c84301c7d065220b05282332c59a4c'
        '225d5b6a94fed8a1bb9c6b57412e719bfe2c5cc2ce8730fcd3ecd3193df4a3d54e0d12052b08ace97e5099ca75c59d39510005baf70d2b99b9b08abd243c2731'
        'ce0b02fbdcb1b179f2b04cc230ac2c720563f33f09cb6787e706056638ea7c105cd4c35b4d8dc240cb08191107fe5d0053b9060705b9e4fb1da44e50763e0032'
        '79b0ef16583d5c36f30319c377f4f6f1bca8f05eadb2aac1df5544ca6db82c7bc978ad2c45e6aebf99813c059dd0e523b8093dbd47285cf0b4a85c0b6cf35f59'
        'SKIP'
        '48483be8ff69963d96ba4f15651943c3237f98edbf13fc899adcad725ed55e1cc01075fc27ece91a3c1cdc223f77995fe9769cc852db72637233854e2d3056ca'
        '55a484f6d835a08384349ed04649ab41730aa0619129b1aacf21431021b238810051885eec49d503627b75ee3864202e0aa4caaa0a3588692d5a9c8dffa19f42'
        'fd6b6f6044b8b9f2581a21f5cfb6c4e030ea895cbc8c0498925632f0d863cb272b9fc061134c14aece172d82a6f0a0f4f663ee4aa4169f6912b0c6e746af2eb4'
        '83ae40c17c7c8f2f201049f81def4081262077f90e703cc2e7dcbb52f777b4476053a87861d572f9b24da0977496f15e148b1130c14951854f5b9fb60d2c9962'
        'c1320ee0c713c7230e4fa914aa7e8618f124ab26c1bb7acbd92eafff3f70676c1451d7367204062b86316e594e596c55d8d5dad36a99cd68eeba907a5d979170'
        'a689ff17cc325445e8bd974b83047594056f9c7b57dbae3cefd66738b9a8742307243e204e5860b799710887011ac32f3627b8700ec629b726813d95b5345d6a'
        '8384011144b56696fbbf47a2c751cfbdbcb1f0de858da784c98128838fe86a3fd0affca03fc62377d8e2b3af3ba413c1c8cdcde5c89d73bb20a706c5796aefe4'
        '3b1eeadb8ed1ec03de7f4675b7d3a36bb4f5174b3cc956c2c88c490b538ffc88624a69608e3391f0316024b915ed400d3ee33de63cba1ac8d351a125a2d93efa'
        '8f501e2b35ebba03da6cdec49a2055640bba8a8fcedbdefc5c29b7c307217c4feeda08f20406cca3224a4f2761ca8cab786aaea63fdb0e8e9ac42e6745897490'
        '098c9546a4f6216794da81067b2e60e44c1a6f45fc249aee1764af61d867ae55c5a5931f2bb973a15d49920c3b3526a64eeecc15b9df2ceadc6b9c7e895593d6'
        '3c5ef9d88acdf18178731960b1bd49fee1dbcf32dec1d7bdbd91182c15dc068a8eecd637a94a2fe74f243e000740f7b3ede0bd78619d8bd058fa46367eb2ded7'
        'a6dd3599d2930dfa2ce3db725a428305196e5ef52c42dd88ac5d47f852f27e0ad6577f7ef6b7a12ff3a9548bcb31254a973dc2dccbfa222ee50816620cf32976'
        '84ab1ef0c546607fa509e4c71ab8528d5a6ff8b120a0dca14ccd7ec0ae39706cbb6c0e0cb65360dd14b74bb225b393c85d70d813602d1877efa4d720cc193374')

# Sets up the environment shared by prepare(), build() and check()
_dotnet_env() {
  _publish_path="$srcdir/PowerShell/bin/Release/net$_dotnetsdkver"
  export NUGET_PACKAGES="$srcdir/PowerShell/nuget"
  # Keep the .NET CLI state (e.g. the local tool cache) out of the builder's home
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
}

prepare() {
  _dotnet_env

  # libpsl-native is built from source instead of using the prebuilt Microsoft.PowerShell.Native package
  cd "$srcdir"/PowerShell-Native/src/libpsl-native || exit
  # Arch already sets _FORTIFY_SOURCE=3 and we don't want new compiler warnings to break the build
  # -fpie is wrong for a shared library and breaks linking with LTO
  # The system googletest requires C++17
  sed -i -e 's/ -Werror//' -e 's/ -D_FORTIFY_SOURCE=2//' -e 's/ -fpie/ -fPIC/' -e 's/-std=c++11/-std=c++17/' CMakeLists.txt
  # Use the system googletest instead of the submodule
  sed -i -e 's/^add_subdirectory(googletest)$/find_package(GTest REQUIRED)/' \
    -e 's/psl-native gtest)/psl-native GTest::gtest)/' test/CMakeLists.txt

  # The NuGet provider of PackageManagement is a submodule
  cd "$srcdir"/oneget || exit
  git submodule init
  git config submodule.src/Microsoft.PackageManagement.NuGetProvider.url "$srcdir/NuGetProvider"
  git -c protocol.file.allow=always submodule update
  # On Unix, PackageManagement used /tmp/Microsoft.PackageManagement for all users,
  # making it unusable for everyone but the first user running it
  patch -Np1 -i "$srcdir/oneget-user-temp-folder.patch"

  cd "$srcdir"/PowerShell || exit

  # Fix startup crash when PSModulePath is already set and powershell.config.json
  # contains multiple paths, e.g. when starting pwsh from pwsh
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/20706
  patch -Np1 -i "$srcdir/psmodulepath-combined-paths.patch"

  # CIM (Microsoft.Management.Infrastructure) is closed source and only usable on Windows,
  # so put it behind #if !UNIX like upstream does for WMI and ADSI and don't ship it
  patch -Np1 -i "$srcdir/cim-windows-only.patch"

  # We first determine the exact SDK and runtime versions for later usage
  local _sdkver _runtimever _runtimepath
  _sdkver=$(dotnet --list-sdks | grep -F "$_dotnetsdkver" | sed "s/ .*$//")
  _runtimever=$(dotnet --list-runtimes | grep -F "NETCore.App $_dotnetsdkver" | sed -E "s/[[:alnum:]\.]+ ([[:digit:]\.]+) .*/\1/")
  _runtimepath="/usr/share/dotnet/shared/Microsoft.NETCore.App/$_runtimever"

  # Update global.json to match with the current SDK
  # The old one has to go first, dotnet refuses to run with an SDK it doesn't know
  rm global.json
  dotnet new globaljson --sdk-version "$_sdkver"

  ## Switch-PSNugetConfig()
  # Packages of the source-built .NET are taken from dotnet-source-built-artifacts, so that they exactly
  # match the .NET we're building and running with. This includes the runtime, apphost and crossgen packs.
  # Everything else comes from the public nuget.org feed.
  local _artifacts=(/usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz)
  mkdir -p "$srcdir/nuget-local"
  bsdtar -xf "${_artifacts[0]}" -C "$srcdir/nuget-local" '*.nupkg'
  local _localpackages=() _nupkg _nuspec _id _version
  for _nupkg in "$srcdir"/nuget-local/*.nupkg; do
    _nuspec="$(bsdtar -xOf "$_nupkg" '*.nuspec')"
    _id="$(sed -n -E 's|.*<id>([^<]+)</id>.*|\1|p' <<<"$_nuspec" | head -1)"
    _version="$(sed -n -E 's|.*<version>([^<]+)</version>.*|\1|p' <<<"$_nuspec" | head -1)"
    if [[ "$_version" == "$_runtimever" ]]; then
      _localpackages+=("$_id")
    fi
  done
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
  <packageSourceMapping>
    <clear />
    <packageSource key="dotnet-source-built">
$(printf '      <package pattern="%s" />\n' "${_localpackages[@]}")
    </packageSource>
    <packageSource key="nuget.org">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  sed -i -e 's|<add key="powershell".*$|<add key="psgallery" value="https://www.powershellgallery.com/api/v2/" />|g' \
    src/Modules/nuget.config \
    test/tools/Modules/nuget.config
  sed -i -e 's|</configuration>|  <packageSourceMapping>\n    <clear />\n  </packageSourceMapping>\n</configuration>|' \
    src/Modules/nuget.config \
    test/tools/Modules/nuget.config

  # There's no point to run analyzers in a PKGBUILD
  sed -i -e '/PackageReference/d' Analyzers.props

  # Remove Telemetry entirely from the code
  # The sed hack deletes any line calling ApplicationInsightsTelemetry call, as well as any using statements
  # for Microsoft.PowerShell.Telemetry. The calls have no side effects, so can simply be removed from the code.
  # Doing so allows us to exclude Telemetry.cs and Microsoft.ApplicationInsights from the build entirely
  find src -type f -name "*.cs" -exec sed -i -E \
    -e '/ApplicationInsightsTelemetry\.\w+\([^)]*$/,/\)/d' \
    -e '/ApplicationInsightsTelemetry/d' \
    -e '/Microsoft.PowerShell.Telemetry/d' {} \;
  sed -i -e '/Microsoft.ApplicationInsights/d' \
    -e 's|^</Project>|  <ItemGroup>\n    <Compile Remove="utils/Telemetry.cs" />\n  </ItemGroup>\n</Project>|' \
    src/System.Management.Automation/System.Management.Automation.csproj

  # libpsl-native is built from PowerShell-Native and put next to pwsh in build()
  sed -i -e '/"Microsoft.PowerShell.Native"/d' src/System.Management.Automation/System.Management.Automation.csproj

  # Next we convert quite a bit to framework refs
  # This doesn't change anything really about the binaries that are generated
  # but saves over a gigabyte of unnecessary NuGet downloads.
  local _csproj _packref _packname
  while read -r _csproj; do
    sed -i -E -e 's/netstandard2\.0/net'"$_dotnetsdkver"'/' \
      -e 's|(RuntimeIdentifiers>)[^<]*|\1'"$_rid"'|' "$_csproj"
    if [[ "$_csproj" == */PSVersionInfoGenerator.csproj ]]; then
      sed -i -e '/<PackageReference Include="System/d' "$_csproj"
    fi

    while read -r _packref; do
      [[ "$_packref" =~ Include=\"([^\"]+)\" ]] || continue
      _packname="${BASH_REMATCH[1]}"

      if [[ -f "${_runtimepath}/${_packname}.dll" ]]; then
        sed -i -E 's|.*"'"$_packname"'".*|<FrameworkReference Include="'"$_packname"'"/>|' "$_csproj"
      elif [[ "$_packname" =~ runtime\..* ]] && [[ ! "$_packname" == *"linux-x64"* ]]; then
        sed -i "/\"${_packname}\"/d" "$_csproj"
      fi
    done < <(grep PackageReference "$_csproj")
  done < <(find . -type f -name "*.csproj")

  dotnet new tool-manifest --force
  dotnet tool install dotnet-outdated-tool
  dotnet tool restore

  # Align all references to .NET runtime packages (versioned like the runtime itself) with the
  # version of the source-built .NET, and keep dotnet outdated from upgrading them again.
  # Other .NET packages like System.ServiceModel.* use build numbers as patch version (e.g. 10.0.652802).
  find . -type f -name "*.csproj" -exec sed -i -E \
    's|(<PackageReference Include="[^"]+" Version=")'"${_dotnetsdkver//./\\.}"'\.[0-9]{1,3}"|\1'"$_runtimever"'"|' {} +
  local _outdated_excludes=() _package
  while read -r _package; do
    _outdated_excludes+=(--exclude "$_package")
  done < <(grep -rhoE '<PackageReference Include="[^"]+" Version="'"${_runtimever//./\\.}"'"' --include='*.csproj' . |
    sed -E 's/.*Include="([^"]+)".*/\1/' | sort -u)
  dotnet outdated --upgrade --exclude "JsonSchema.Net" "${_outdated_excludes[@]}"
  dotnet outdated --upgrade --version-lock major --include "JsonSchema.Net"

  # Replicating build.psm1:Start-PSBuild()
  ## Restore-PSPackage()
  dotnet restore "src/TypeCatalogGen" --runtime "$_rid" -p:SDKToUse=Microsoft.NET.Sdk
  dotnet restore "src/ResGen" --runtime "$_rid" -p:SDKToUse=Microsoft.NET.Sdk
}

# Copies the packages referenced by a project ($1) from the NuGet cache into a module folder ($2)
_copymodules() {
  local _packref
  mkdir -p "$2"
  while read -r _packref; do
    [[ "$_packref" =~ Include=\"([^\"]+)\"\ +Version=\"([^\"]*)\" ]] || continue
    rsync -aq \
      -f '- *.nupkg' \
      -f '- *.nupkg.metadata' \
      -f '- *.nupkg.sha512' \
      -f '- *.nuspec' \
      -f '- System.Runtime.InteropServices.RuntimeInformation.dll' \
      -f '- fullclr' \
      "$NUGET_PACKAGES/${BASH_REMATCH[1],,}/${BASH_REMATCH[2]}/." "$2/${BASH_REMATCH[1]}/"
  done < <(grep PackageReference "$1")
}

build() {
  cmake -S PowerShell-Native/src/libpsl-native -B build-psl-native -DCMAKE_BUILD_TYPE=Release
  cmake --build build-psl-native

  _dotnet_env

  ## Start-ResGen()
  # ResGen runs much faster if built with optimisations
  cd "$srcdir"/PowerShell/src/ResGen || exit
  dotnet run \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r "$_rid"

  ## Start-TypeGen()
  local _inc_file="$srcdir/PowerShell/src/TypeCatalogGen/powershell_${_rid}.inc"
  cd "$srcdir"/PowerShell/src/Microsoft.PowerShell.SDK || exit
  dotnet build \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r "$_rid" \
    ./Microsoft.PowerShell.SDK.csproj \
    -t:_GetDependencies \
    -p:DesignTimeBuild=true \
    -p:_DependencyFile="$_inc_file"

  cd "$srcdir"/PowerShell/src/TypeCatalogGen || exit
  dotnet run \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r "$_rid" \
    ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs \
    "$_inc_file"

  local _build_arguments=(
    --configuration Release
    --framework "net$_dotnetsdkver"
    --runtime "$_rid"
    --no-self-contained
    -p:ReleaseTag="$pkgver"
    "-p:AppDeployment=FxDependentDeployment"
    "-p:SDKToUse=Microsoft.NET.Sdk"
    "-p:IsWindows=false"
    "-p:GenerateFullPaths=true"
    "-p:ErrorOnDuplicatePublishOutputFiles=false"
    "-p:UseAppHost=true"
    "-p:RunAnalyzersDuringBuild=false"
  )

  cd "$srcdir"/PowerShell/src/powershell-unix || exit
  dotnet publish "${_build_arguments[@]}" \
    --output "$_publish_path"

  # libpsl-native, built from PowerShell-Native
  install -Dm755 "$srcdir"/PowerShell-Native/src/powershell-unix/libpsl-native.so -t "$_publish_path"

  # Publish Reference Assemblies
  mkdir -p "$_publish_path/ref"
  grep 'Microsoft.NETCore.App' "$_inc_file" | sed 's/;$//' | xargs -d '\n' cp -t "$_publish_path/ref"

  ## Restore-PSModuleToBuild()
  # Instead of downloading the modules from the PowerShell Gallery, they're built from source
  # with the PowerShell we just built
  "$_publish_path"/pwsh -NoProfile -NonInteractive -File "$srcdir/build-modules.ps1" \
    -SourcePath "$srcdir" -OutputPath "$_publish_path/Modules"

  ## Build manpage
  # We have to build this, since the pregenerated file (that is also included in their official RPMs)
  # is outdated and especially missing all body content of the man page.
  # See https://github.com/PowerShell/PowerShell/issues/21086
  # The tags in the markdown don't have their < > escaped either, which causes breakage.
  cd "$srcdir"/PowerShell/assets/manpage || exit
  sed -i -e 's/>/\\>/g' -e 's/</\\</g' pwsh.1.ronn
  ronn -r "pwsh.1.ronn"

  # Install the help of the modules into the publish folder, see update-help.ps1
  "$_publish_path"/pwsh -NoProfile -NonInteractive -File "$srcdir/update-help.ps1"
}

check() {
  ctest --test-dir build-psl-native --output-on-failure

  _dotnet_env
  cd PowerShell || exit
  # The xUnit tests aren't run from the publish folder, so they need to find libpsl-native
  export LD_LIBRARY_PATH="$srcdir/PowerShell-Native/src/powershell-unix${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

  cd test/powershell || exit
  # In Pester 4.x, deleting tests is unfortunately the only fine grained option
  # to disable tests.

  # There's a bunch of tests that use $env:HOME to create or work with files
  # there as a temporary directory. We edit the tests to use the Pester TestDrive instead.
  # Start-Transcript.Tests.ps1 is excluded, since it looks for the result of
  # the Start-Transcript cmdlet at its default locations and needs $env:HOME for that.
  # shellcheck disable=SC2016
  grep -R -l -Z --include="*.Tests.ps1" --exclude="Start-Transcript.Tests.ps1" '$env:HOME' . |
    xargs -0 sed -i 's/$env:HOME/$TestDrive/g'

  # These tests use Pesters TestDrive in a way that it doesn't work on Linux
  # shellcheck disable=SC2016
  sed -i -e 's/TestDrive:/$TestDrive/g' \
    -e '/Push-Location $rootDir/iNew-Item -ItemType "Directory" -Path $TestDrive -Name TestDir -Force' \
    Modules/Microsoft.PowerShell.Management/FileSystemProviderExtended.Tests.ps1

  # TEMPORARY: Test-Json is broken on PowerShell 7.6.7+
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/28218
  # A fix seems to queued for the next release.
  rm Modules/Microsoft.PowerShell.Utility/Test-Json.Tests.ps1

  # Test contains a logic error
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27503
  rm Host/PSVersionTable.Tests.ps1

  # Test is broken on systems with UTC+2 or greater
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27500
  rm Modules/Microsoft.PowerShell.Utility/ConvertTo-Json.Tests.ps1

  # Test is broken due to a logic error not considering timezone aliases
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27502
  rm Modules/Microsoft.PowerShell.Management/TimeZone.Tests.ps1

  # Test requires DSCv3 being available
  # DSCv3 is not part of the PowerShell Core anymore and needs to be installed
  # See https://github.com/PowerShell/DSC
  rm dsc/dsc.profileresource.Tests.ps1

  # Test is extremely build dependent
  # For an fxdependent Release build, it has the wrong list of files
  # and it will be inconsistent. This only makes sense in the context of their CI.
  rm Host/Startup.Tests.ps1

  # This test relies on a dependency being loaded that wouldn't be on optimised Unix builds
  rm engine/Basic/TypeResolution.Tests.ps1

  # These tests ensure that no experimental features are enabled in a stable build.
  # Problem: They can be enabled via powershell.config.json or by invoking
  # Enable-ExperimentalFeature, which in turn will create that config.
  # If a user did so, these tests will break. Config files are by design not bypassable.
  rm engine/ExperimentalFeature/ExperimentalFeature.Basic.Tests.ps1
  rm engine/ExperimentalFeature/Get-ExperimentalFeature.Tests.ps1

  # Test is dependent on the locale of the system
  # Breaks if culture is Invariant Language (Invariant Country)
  # this happens if LANG=C.UTF-8, which is the default in chroot builds
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27532
  rm engine/Help/HelpSystem.Tests.ps1

  # Creates a new ~/.profile, and while it should normally move it back, there were reports of
  # this being broken. It's also a pretty questionable idea to do this in general outside of CI.
  rm Host/ConsoleHost.Tests.ps1

  # We disable telemetry by default, which the telemetry tests don't expect.
  rm engine/Basic/Telemetry.Tests.ps1

  cd ../.. || exit

  ## Restore-PSPester()
  dotnet publish \
    --configuration Release \
    --no-self-contained \
    --runtime "$_rid" \
    --framework "net$_dotnetsdkver" \
    test/tools/TestAlc

  local _project
  for _project in TestExe UnixSocket WebListener; do
    dotnet publish \
      --configuration Release \
      --no-self-contained \
      --runtime "$_rid" \
      --framework "net$_dotnetsdkver" \
      -p:AllowMissingPrunePackageData=true \
      --output "$PWD/bin" \
      test/tools/"$_project"
  done

  # Fix a NU1510 warning that would otherwise pop
  sed -i '/Microsoft.CSharp/d' test/tools/NamedPipeConnection/src/code/Microsoft.PowerShell.NamedPipeConnection.csproj
  dotnet publish \
    --configuration Release \
    --no-self-contained \
    --runtime "$_rid" \
    --framework "net$_dotnetsdkver" \
    --output test/tools/Modules/Microsoft.PowerShell.NamedPipeConnection \
    test/tools/NamedPipeConnection/src/code
  cp test/tools/NamedPipeConnection/src/Microsoft.PowerShell.NamedPipeConnection.psd1 \
    test/tools/Modules/Microsoft.PowerShell.NamedPipeConnection

  # Add the test tools and pwsh to path
  export PATH="$_publish_path:$PWD/bin${PATH:+:${PATH}}"

  # Restore the required modules for the tests
  dotnet restore test/tools/Modules/PSGalleryTestModules.csproj
  _copymodules "test/tools/Modules/PSGalleryTestModules.csproj" "$PWD/test/tools/Modules"

  # Some tests are locale dependent, so we need to ensure
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  # Not -NonInteractive, some tests rely on prompts
  pwsh -NoProfile -File "$srcdir/invoke-pester.ps1"

  ## Start-PSxUnit
  dotnet test -tl:on -c Release -f "net$_dotnetsdkver" -r "$_rid" --test-adapter-path:.
}

package() {
  _dotnet_env
  cd PowerShell || exit

  local _pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$pkgname-$_pkgnum"
  rsync -aqP \
    -f '- *.r2rmap' \
    -f '- *.pdb' \
    "$_publish_path/." "$pkgdir/usr/lib/$pkgname-$_pkgnum/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname-$_pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  # Install the man page
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "$srcdir/PowerShell/assets/manpage/pwsh.1"

  # The config adds /usr/share/powershell/Modules as a working module folder in addition
  # to the regular XDG-compliant /usr/local/share/powershell/Modules.
  # Arch Packages are not allowed to use /usr/local, so this adds a convenient location
  # to which PowerShell modules could be packaged and installed to.
  install -dm755 "$pkgdir/etc"
  cat >"$pkgdir/etc/powershell.config.json" <<EOF
{
  "PSModulePath": "/usr/local/share/powershell/Modules:/usr/share/powershell/Modules:/usr/lib/$pkgname-$_pkgnum/Modules"
}
EOF
  ln -s "/etc/powershell.config.json" "$pkgdir/usr/lib/$pkgname-$_pkgnum/powershell.config.json"

  install -dm755 "$pkgdir/usr/share/powershell/Modules"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
