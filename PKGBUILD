# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Rikarnto Bariampa <richard1996ba@gmail.com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>
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
# check() therefore runs the tests with a HOME and XDG folders of their
# own in $srcdir. System-wide state like modules in
# /usr/local/share/powershell/Modules can still affect them, so building
# in a clean chroot (e.g. with pkgctl build) remains the safest option.
#######################################################################

pkgname=powershell
pkgver=7.6.9
pkgrel=18
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=('x86_64' 'aarch64')
url='https://microsoft.com/PowerShell'
license=('MIT')
options=('!debug')
_dotnetsdkver="10.0"
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
# Microsoft.PowerShell.MarkdownRender 7.2.1: last commit of its repository
_markdownrendercommit="c216c18b1fb275aec0a3e84094bd0e1a4c5da685"
# The module the tests use from the PowerShell Gallery (test/tools/Modules/PSGalleryTestModules.csproj),
# SelfSignedCertificate 0.0.4: last commit of the archived repository, which fixes the validity
# period for time zones (DateTimeOffset) after the release
_selfsignedcertificatecommit="5f720d3d5b28c2cb2e9b33296cfd802ec6f1a668"
_psresourcegetver="1.2.0"
_psreadlinever="2.4.5"
depends=(
  dotnet-runtime-"$_dotnetsdkver"
  glibc
  libgcc
  libstdc++
  # xdg-utils are indirectly needed for System.Diagnostics.Process() with
  # ProcessStartInfo.UseShellExecute (see src/System/Diagnostics/Process.Linux.cs of the dotnet runtime)
  # PowerShell relies on this for its invoke logic, c.f. src/System.Management.Automation/namespaces/FileSystemProvider.cs
  xdg-utils
)
backup=('etc/powershell.config.json')
optdepends=('openssh: PowerShell Remoting over ssh'
  'xclip: Clipboard functionality'
  'powershell-dsc: PowerShell Desired State Configuration v3 support'
  'powershell-editor-services: Language server and debug adapter for PowerShell editor support'
  'powershell-mmi: Microsoft.Management.Infrastructure for modules built against PowerShell with it, e.g. PSScriptAnalyzer from the PowerShell Gallery')
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  # Libraries built from source, see _nuget_feeds()
  dotnet-azure-core
  dotnet-azure-identity
  dotnet-jsonschema-net-7
  dotnet-markdig
  dotnet-microsoft-identity-client
  dotnet-newtonsoft-json
  dotnet-powershellstandard-library
  dotnet-roslyn
  dotnet-source-build-reference-packages # The reference packages the modules compile against, see nuget-modules.config
  dotnet-system-clientmodel
  dotnet-system-data-sqlclient
  dotnet-system-io-ports-native
  dotnet-wcf
  cmake
  gtest
  git
  rsync
  ruby-ronn-ng
)
# Arch Linux ARM has no .NET packages, there it's Microsoft's build from the AUR (dotnet-core-bin)
# and the runtime packs come from nuget.org
makedepends_x86_64=(dotnet-source-built-artifacts-"$_dotnetsdkver")
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
  powershell-pester-4 # The test framework, build.psm1 asks for Pester 4
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
  "git+https://github.com/PowerShell/MarkdownRender.git#commit=$_markdownrendercommit"
  "git+https://github.com/PowerShell/ThreadJob.git#commit=$_threadjobcommit"
  "git+https://github.com/rjmholt/SelfSignedCertificate.git#commit=$_selfsignedcertificatecommit"
  "psmodulepath-combined-paths.patch"
  "mmi-optional.patch"
  "system-drawing-windows-only.patch"
  "oneget-user-temp-folder.patch"
  "oneget-net10.patch"
  "psresourceget-net10.patch"
  "nuget-modules.config"
  "powershell-modules.psm1"
  "build-modules.ps1"
  "crossgen2-pack.targets"
  "update-help.ps1"
  "psresourceget-test.ps1"
  "invoke-pester.ps1"
  "update-pwsh-deps.ps1"
  "update-pwsh-deps"
  "powershell-deps.hook")
sha512sums=('4b0cc568a858d1c8fa38a6fc8a48e7c3d7c00bdb182f8c1905d11ed73d44e4111dd784255b61790322ba17e912edb3942b77df752eacb39f062128647418a502'
            '673e931ea136511fa2c638035334a7ea1800aafb1d4100d94cf0adf1086888f765a3d92f9f294060c5f088eab4d4c12c2d70cc5dc5a4ec4f56b80f26d16cc644'
            '326b55c2eff49b21b427812c394afd000ef3e5b4da86dca087fb897e39e423be3b5c105e087f79da5dc39b0b268a9c0876f198ab67b845f31ee765caa4694aac'
            'c9efa8a5c497dad6dfb773c17f01e004f65e842bac4612c5842563efe0d07fff5d64a1729c8436e4bcdb5f4cac24202168855fded3c31e1cff764303718883c3'
            'SKIP'
            '54d081330468a9629f5aa8166defef423cd923f5a53065a4657ab15c691946f0c04c398525a99bdc3652a4d1bbf0965f4575e814216f3ae16e83d08127eeaadb'
            '6c3004608cc1d2089712e8400001a4557c0de8e1e7e755184cd3e683e6b2ba497f373c1f77cd3a52d2fcd2045ee089957095d54fb899e02bf7185cbe8ad17ccd'
            '4b4ac87e70c04e4d85ac4b772024c3cf5aec574259654bc9f58f9d06cccacfd84d68415de87e5804f7beb33ae8679b47d58221a014c7b55e960eba93e70cfaae'
            '177593575d59629bb9f8020a52205c9617170b3212033ab21787d8739ac3af3d283b706ee607f29d6473415cee9ed5a8d23a4d53e90d52360a72f796f9b1bda8'
            'f5527cf012bd495bc54107e446448b12895d78c0f1653ec29b9dc1110d028cdc36feef7dbc281ae70aae14b735156024ccaac3f3049f7cf4a7555116eaf3eef6'
            '50088e4e83b25a8211f35d29e844f69d1a03598d347d82179fb1228cabd6a1f158db5e23c6d9ce91a91cf2721f8e36e9572e30ee71e2e2c731181ae31678eb42'
            'c0d1d0ec47a8b0ed4d6e2a09a7040ba6244ceb615c76be21a42950cb8ac28a410811541ccdcf8eefff0c993a70d16ab5cb539d15168703c0f75598f02caa4e4c'
            '79e554984a743d8ced1789a7103ed684e3af37a3b415820fb7da5e51f5f513d5131eb813b0e9b5dbeace9cb06558a548212fa503600d16c301fcc53cb483e423'
            '6dca6f3e167dc2404615a2e5f7b150fc9a5434bd78945cd3faaa3d647b73ca9699c403d111098a2229f9568cdc2809c4a5b55045fc80a30da5acf8e2bf92db9e'
            'a805ef8f83ac366a2519e9c30efdb0842d9bede92f30686826fcfaf2904c395c0c4128b35a122c43dfd4c07231eea8b78807026bb3034f213736450bab0e65fb'
            '08a87bb665198854dc4e805f35760bca536177800ae448518c5edd63d314d6d909d53ae52f37c6cca523c9b6c4de9b0b7f952a2313a58eb5d8718ee96b818f39'
            'd778770716591c573c8526a647eaafb4788338e2cc076b2c05d1e450cc8068f3cd101d4f415fd631b127344998038e7656ad454de14c6f442c19513250ff92f3'
            '7f0df1c1eadfc39f7075cf6de7b1d2b99959042b2a3ee1cc0158ead26128ae8086463c563178b22c325c965352d5d756d2b02abf1137ad91b116fd753aeed8b6'
            '7753cb1b8d4b865ac3b08f4d17a9f848c138e14539fc6b4b377900f6be2714f74964f34e215184c900348cd7fa54e0f71238d63fa3ccb11b605ff5fc744b0708'
            '6f71c4733bc60224e17b0ac213717fe7a6f6c7ce248ed1af48c67fedf20beb3129debde682131335478cad3a18943c2bfd6977483c0147cfa5da756015bad3e3'
            'b61fe0c4421f82fdd4f13f92ea7e623412a3fc677bbac8abacdcbdf7d7e7e39fae6b839970e8287c6b1cb4162cc38c4acc2fe13072a822c643dc976fdf9882bd'
            '340bfd8bcb4548a6b70954d1d17b5c402c47285979c3f2eae27ff8d3fd0547b54ddf934f41e4a777825a8cc9fc674589760b2f701db11a10c7e17f0af2cf3981'
            '0e04d0b5323e634bcd4ff00535241cf0bb29d5de3771e4820f469ed42f6a7f1bbf7159ecacfcbb8f4b8512fe995ec89bea16ae4a3116ef9342c59d0791ab8cca'
            '647b8486bbb67395fd195d9d09cd248ad5eb811b594efc0dd3e12559c378ee879cdec0a8dde39a154dd818b3ce668e68d129b7a6bff2650e73a3a3390c76820b'
            'eec686855a3a215d947e2f3f40708c3fb3d005df0e8eba2e963f062f3b4f381cd1b0fbd2f4296dd52a84e965c37382edf85db13db6130b9fb96a5980830b2b79'
            '501e304575a23c12d2e8466de14b51d1b4d25d72a64c633ea9170a6d64ef65df38fb542e1f42c6ffdaa5a55dbbfbca2327ff5c81b77cc6019fda717dbef68351'
            '60fb8c07223a2662a362e03e70b9fb4d60b5ee9ea7eb995a6d9957b6989e34c3101c9750fcad65fa9c063bdba3e8ac2f4e52d95b16edabccf392cb567d8f0513'
            '1afffe7e4797188f0ac2378f6032db5d0ffdeca12d5804250b62e0a946a65e7dab7a7d6c9674dedeebfb3e0501360b549e4d333841d0da6662c266b4589bdba0')
b2sums=('4646e39fda817e26ca00dbad2fd93675d15be7f6877cb29856009fecdfe5adcab604ebeda63c026a4eb0f4ccdb8f43b2d7c84301c7d065220b05282332c59a4c'
        '225d5b6a94fed8a1bb9c6b57412e719bfe2c5cc2ce8730fcd3ecd3193df4a3d54e0d12052b08ace97e5099ca75c59d39510005baf70d2b99b9b08abd243c2731'
        'ce0b02fbdcb1b179f2b04cc230ac2c720563f33f09cb6787e706056638ea7c105cd4c35b4d8dc240cb08191107fe5d0053b9060705b9e4fb1da44e50763e0032'
        '79b0ef16583d5c36f30319c377f4f6f1bca8f05eadb2aac1df5544ca6db82c7bc978ad2c45e6aebf99813c059dd0e523b8093dbd47285cf0b4a85c0b6cf35f59'
        'SKIP'
        '48483be8ff69963d96ba4f15651943c3237f98edbf13fc899adcad725ed55e1cc01075fc27ece91a3c1cdc223f77995fe9769cc852db72637233854e2d3056ca'
        '55a484f6d835a08384349ed04649ab41730aa0619129b1aacf21431021b238810051885eec49d503627b75ee3864202e0aa4caaa0a3588692d5a9c8dffa19f42'
        'fd6b6f6044b8b9f2581a21f5cfb6c4e030ea895cbc8c0498925632f0d863cb272b9fc061134c14aece172d82a6f0a0f4f663ee4aa4169f6912b0c6e746af2eb4'
        '83ae40c17c7c8f2f201049f81def4081262077f90e703cc2e7dcbb52f777b4476053a87861d572f9b24da0977496f15e148b1130c14951854f5b9fb60d2c9962'
        '63222fc3995a2090c72804bcdb4f9389f0aea2d05c780698dae0648e53b512236e3c91c3bbe0777df9330c45bb40ab2cf080b4bf9403064f069657ee522ddec3'
        'c1320ee0c713c7230e4fa914aa7e8618f124ab26c1bb7acbd92eafff3f70676c1451d7367204062b86316e594e596c55d8d5dad36a99cd68eeba907a5d979170'
        '98633062c100df742f1a932f227d874a95f87ea061eece500bf0a925bbabd4aeafab74a60c21ec715522d9dfc959ffc28ca1a82d747355ed8a1e512bd05e4b50'
        'a689ff17cc325445e8bd974b83047594056f9c7b57dbae3cefd66738b9a8742307243e204e5860b799710887011ac32f3627b8700ec629b726813d95b5345d6a'
        'a35d008a212ec7001392be5d46658f338ba96abe8e4c79d0a85519ec6d6f52ace2f53a956fa9b9c1ea495f5ba4d1d84eeed9a47b4c4e6b7196c97df30ce3dc35'
        'c63abea627ba33ebbd2f651eff99363b69d306c6dc7f6f5124c6af8afbccd31689bdf72259f3ec31c0437190acb60da892d7a596ae554048e61bb5c91c821706'
        '3b1eeadb8ed1ec03de7f4675b7d3a36bb4f5174b3cc956c2c88c490b538ffc88624a69608e3391f0316024b915ed400d3ee33de63cba1ac8d351a125a2d93efa'
        'b1d5446a953a87aeaa6e58102c461b2c1bcd0b21da0333f44e08d1908f5f2568161043b3a14e25121fedf2a7da589f55ae9dbc3f24512488563ffa069947884f'
        '93382f5100b58b1cf763054c4a839546f4c7cc8a141cf11d34ddf3b01a7c7e6663630e5ad32df32f69ff84c1d50073ce6c43ef3e4a7a934bbe6b344156e5c54e'
        'db691d49fc99d2d844d4f9fc0af456565a5c8102340f5b9d001029f3d7b95a7762ab612ac45824b97961b26109549ff9527070c44838966c0c8bbc485bf0f3d0'
        '96044937ac7fe10134d938516a4da2cc69e71faaee3f84e58dc42a900a500e5de04989f5d762e8efaff9ac5e2c893e713176caafb8724f53bdc8a403a719bd76'
        'c62c280f86cb8f11b8f4f7c33ef6412c62c1d928b975908c2b8ee2d403f1a7720417f4514f8bdeecfb823fc7f259b38bfe99bddb1f76688608f061cc7ce40f1f'
        '3493eecfb50819af971399abe1e62782ccf28500559d222822bddb91ddac6bf191d7e20abf01dfbcb99f7c51df9356061c8f1687a10700228e7d1f77308e873b'
        '54df0df67181f7b2f49e02f5b9e57faf02446ab9eadc79c5e2aee8ec2bdb52f9e9d99971e311ba6a37682936bb6f8db265f92432410e2ec51a4df39df48374b7'
        'e69a43062d745f832b734821ca7679b1c4b67e455906d7d093227205e8607b5c6b637eb9f28a00eb0778b0f69cdd1aa471d416e8ae7bf0990a97a07824353956'
        'ea868e62c1f4fbe6734993b4b02b56ddeb0a17ed1d103e6704d7a60e25a30f722617016aed9aa20b1e8708045a6eb65faf9d1b40339d122166552cf0402249d8'
        'f46fcb1d242979be39dbd14c6e5dc8c04ede57ed2de52a74e56bf18ce3c6b5985351d70ec0e291ed3ccec1655ebee4da931c88680c7ef60dec4797d78f015833'
        'ba82d782e0aa5960800ad61c5070acff4fd4f6ee3d70423868839ff95f87209a090c65ca27004bd85146913f9f080b603b2989b8516d7e66e7a6f4a05d846d21'
        '3134c64cb38acb323df88be7634d95981c0c46d01d86912c1bb9d9c4ff3da42573299f365368d6d3fb8ebafdf0624203315ae90eb8da79ca33c736abca51f8e1')

# Sets up the environment shared by prepare(), build() and check()
_dotnet_env() {
  _publish_path="$srcdir/PowerShell/bin/Release/net$_dotnetsdkver"
  export NUGET_PACKAGES="$srcdir/PowerShell/nuget"
  # Keep the .NET CLI state (e.g. the local tool cache) out of the builder's home
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1
  # Without Microsoft.Management.Infrastructure, see mmi-optional.patch in prepare(). MSBuild takes
  # environment variables as properties, so this applies to every build, test tools and tests included.
  export UseMmi=false
  # RID of the .NET SDK: arch-x64 for the source-built .NET of Arch, linux-arm64 for Microsoft's build
  _rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
}

# Prints the ID and version of a NuGet package ($1)
_nupkg_info() {
  local _nuspec
  _nuspec="$(bsdtar -xOf "$1" '*.nuspec')"
  printf '%s %s\n' \
    "$(sed -n -E 's|.*<id>([^<]+)</id>.*|\1|p' <<<"$_nuspec" | head -1)" \
    "$(sed -n -E 's|.*<version>([^<]+)</version>.*|\1|p' <<<"$_nuspec" | head -1)"
}

# Writes the nuget.config of the repository in the current folder. Packages are taken from:
# - dotnet-source-built-artifacts, the packages of the source-built .NET, so they exactly match the .NET
#   we're building and running with ($1 is its runtime version). This includes the runtime, apphost and
#   crossgen packs. Other packages from there that aren't versioned like the runtime can be given as
#   further arguments; references to them are set to the version there. Arch Linux ARM has no
#   source-built .NET.
# - /usr/share/dotnet/nuget-packages, libraries built from source by their own packages (dotnet-*).
#   References to them are set to the installed version with the same major version, or the newest
#   installed one if there's none, so a newer major version installed alongside doesn't break the build.
# - nuget.org for everything else
_nuget_feeds() {
  local _systemfeed=/usr/share/dotnet/nuget-packages
  local _systempackages=() _localpackages=() _nupkg _id _version _artifacts _csproj _reference
  local -A _systemversions=()
  for _nupkg in "$_systemfeed"/*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    read -r _id _version < <(_nupkg_info "$_nupkg")
    [[ -v "_systemversions[$_id]" ]] || _systempackages+=("$_id")
    _systemversions[$_id]+="$_version"$'\n'
  done
  for _id in "${_systempackages[@]}"; do
    while IFS=: read -r _csproj _reference; do
      _reference="${_reference##*Version=\"}"
      _reference="${_reference%\"}"
      _version=$(grep -E "^${_reference%%.*}\." <<<"${_systemversions[$_id]}" | sort -V | tail -1 || true)
      [[ -n "$_version" ]] || _version=$(grep . <<<"${_systemversions[$_id]}" | sort -V | tail -1)
      sed -i -E 's|(<PackageReference Include="'"${_id//./\\.}"'" Version=")[^"]*"|\1'"$_version"'"|' "$_csproj"
    done < <(grep -rHoE '<PackageReference Include="'"${_id//./\\.}"'" Version="[^"]+"' --include='*.csproj' .)
  done

  if [[ ! -d "$srcdir/nuget-local" ]]; then
    mkdir -p "$srcdir/nuget-local"
    for _artifacts in /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz; do
      [[ -f "$_artifacts" ]] || continue
      bsdtar -xf "$_artifacts" -C "$srcdir/nuget-local" '*.nupkg'
    done
  fi
  for _nupkg in "$srcdir"/nuget-local/*.nupkg; do
    [[ -f "$_nupkg" ]] || continue
    read -r _id _version < <(_nupkg_info "$_nupkg")
    [[ " ${_systempackages[*]} " == *" $_id "* ]] && continue
    if [[ "$_version" == "$1" ]]; then
      _localpackages+=("$_id")
    elif [[ " ${*:2} " == *" $_id "* ]]; then
      _localpackages+=("$_id")
      find . -type f -name "*.csproj" -exec sed -i -E \
        's|(<PackageReference Include="'"${_id//./\\.}"'" Version=")[^"]*"|\1'"$_version"'"|' {} +
    fi
  done

  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-built" value="$srcdir/nuget-local" />
    <add key="dotnet-packages" value="$_systemfeed" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
  <packageSourceMapping>
    <clear />
EOF
    if ((${#_localpackages[@]})); then
      echo '    <packageSource key="dotnet-source-built">'
      printf '      <package pattern="%s" />\n' "${_localpackages[@]}"
      echo '    </packageSource>'
    fi
    if ((${#_systempackages[@]})); then
      echo '    <packageSource key="dotnet-packages">'
      printf '      <package pattern="%s" />\n' "${_systempackages[@]}"
      echo '    </packageSource>'
    fi
    cat <<EOF
    <packageSource key="nuget.org">
      <package pattern="*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
EOF
  } >nuget.config
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
  # Upstream discussion: https://github.com/PowerShell/PowerShell/issues/15330
  patch -Np1 -i "$srcdir/oneget-user-temp-folder.patch"
  # Builds for .NET 10 instead of .NET Standard 2.0, see Build-PackageManagementModule
  patch -Np1 -i "$srcdir/oneget-net10.patch"

  cd "$srcdir"/PowerShell || exit

  # Fix startup crash when PSModulePath is already set and powershell.config.json
  # contains multiple paths, e.g. when starting pwsh from pwsh
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/20706
  # Fixed upstream in 7.7 by https://github.com/PowerShell/PowerShell/pull/26565, which isn't
  # backported to 7.6, so drop this patch with 7.7
  patch -Np1 -i "$srcdir/psmodulepath-combined-paths.patch"

  # CIM (Microsoft.Management.Infrastructure, MMI) is only usable on Windows and isn't open source,
  # although its NuGet package claims MIT:
  # - The PowerShell team says "MMI.dll is not Open Source (and no plans to be OSS)", see
  #   https://github.com/PowerShell/PowerShell/issues/8397. The repository the package links to,
  #   PowerShell/MMI, has been archived since 2024.
  # - Its Microsoft.Management.Infrastructure.Runtime.Win package comes under the Microsoft Software
  #   License Terms instead, which only allow using it with PowerShell and forbid redistributing it, see
  #   https://github.com/PowerShell/PowerShell/issues/28027 and #20798
  # So the patch makes it optional with a build property, UseMmi=false (see _dotnet_env), which leaves
  # out everything that needs it: CIM, the CIM type adapter and DSC's MOF support. Built normally,
  # nothing changes. ArgumentToConfigurationDataTransformationAttribute doesn't use CIM and scripts use it
  # to read .psd1 files, so it moves out of CimDSCParser.cs into its own file. A stub of DscClassCache
  # stays for modules built against PowerShell with MMI, e.g. PSScriptAnalyzer from the PowerShell
  # Gallery.
  patch -Np1 -i "$srcdir/mmi-optional.patch"

  # System.Drawing.Common only supports Windows since .NET 6, see
  # https://learn.microsoft.com/dotnet/core/compatibility/core-libraries/6.0/system-drawing-common-windows-only
  # (the switch to enable it elsewhere is gone since .NET 7). It's only used by Out-Printer, which is
  # only available on Windows, so don't ship it either. Microsoft.Windows.Compatibility would bring it
  # in as dependency, so it's pruned from the restores (PowerShell.Common.props, test/Test.Common.props).
  patch -Np1 -i "$srcdir/system-drawing-windows-only.patch"

  # We first determine the exact SDK and runtime versions for later usage
  local _sdkver _runtimever _runtimepath
  _sdkver=$(dotnet --list-sdks | grep -F "$_dotnetsdkver" | sed "s/ .*$//")
  _runtimever=$(dotnet --list-runtimes | grep -F "NETCore.App $_dotnetsdkver" | sed -E "s/[[:alnum:]\.]+ ([[:digit:]\.]+) .*/\1/")
  _runtimepath="/usr/share/dotnet/shared/Microsoft.NETCore.App/$_runtimever"

  # Update global.json to match with the current SDK
  # The old one has to go first, dotnet refuses to run with an SDK it doesn't know
  rm global.json
  dotnet new globaljson --sdk-version "$_sdkver"

  # Microsoft.PowerShell.MarkdownRender used to be part of this repository, until it moved into its own
  # and was used as package from nuget.org (#14090). It's put back and used as project again.
  local _markdownrender=src/Microsoft.PowerShell.MarkdownRender
  local _utility=src/Microsoft.PowerShell.Commands.Utility/Microsoft.PowerShell.Commands.Utility.csproj
  local _markdownrenderver
  _markdownrenderver=$(sed -n -E 's|.*<PackageReference Include="Microsoft.PowerShell.MarkdownRender" Version="([^"]+)".*|\1|p' "$_utility")
  cp -r "$srcdir/MarkdownRender/src" "$_markdownrender"
  sed -i -e 's|<DelaySign>true</DelaySign>|<PublicSign>true</PublicSign>|' \
    -e 's|<TargetFramework>|<Version>'"$_markdownrenderver"'</Version>\n    &|' \
    "$_markdownrender/Microsoft.PowerShell.MarkdownRender.csproj"
  sed -i -E 's|<PackageReference Include="Microsoft.PowerShell.MarkdownRender" Version="[^"]+" />|<ProjectReference Include="../Microsoft.PowerShell.MarkdownRender/Microsoft.PowerShell.MarkdownRender.csproj" />|' \
    "$_utility"

  ## Switch-PSNugetConfig(). Its PowerShell Gallery feeds for src/Modules and test/tools/Modules
  ## aren't needed, the modules are built from source.
  _nuget_feeds "$_runtimever"

  # Packages from the system feed may satisfy a dependency with a newer version than its minimum
  # (e.g. Json.More.Net 2.2.0 for JsonPointer.Net's >= 2.1.1), keep that a warning
  # shellcheck disable=SC2016
  sed -i 's|<TreatWarningsAsErrors>true</TreatWarningsAsErrors>|&\n    <WarningsNotAsErrors>$(WarningsNotAsErrors);NU1603</WarningsNotAsErrors>|' \
    PowerShell.Common.props test/Test.Common.props

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
      elif [[ "$_packname" =~ runtime\..* ]] && [[ ! "$_packname" == *"linux-${_rid#*-}"* ]]; then
        sed -i "/\"${_packname}\"/d" "$_csproj"
      fi
    done < <(grep PackageReference "$_csproj")
  done < <(find . -type f -name "*.csproj")

  # Align all references to .NET runtime packages (versioned like the runtime itself) with the
  # version of the .NET we're building with.
  # Other .NET packages like System.ServiceModel.* use build numbers as patch version (e.g. 10.0.652802).
  find . -type f -name "*.csproj" -exec sed -i -E \
    's|(<PackageReference Include="[^"]+" Version=")'"${_dotnetsdkver//./\\.}"'\.[0-9]{1,3}"|\1'"$_runtimever"'"|' {} +

  # Replicating build.psm1:Start-PSBuild()
  ## Restore-PSPackage()
  dotnet restore "src/TypeCatalogGen" --runtime "$_rid" -p:SDKToUse=Microsoft.NET.Sdk
  dotnet restore "src/ResGen" --runtime "$_rid" -p:SDKToUse=Microsoft.NET.Sdk

  # PSResourceGet only targets .NET Framework, so it came with the .NET Framework builds of its
  # dependencies, all prebuilt from nuget.org. It's built for .NET instead, against NuGet.Client 7 and
  # the other packages of the source-built .NET where they're available.
  cd "$srcdir"/PSResourceGet || exit
  patch -Np1 -i "$srcdir/psresourceget-net10.patch"
  _nuget_feeds "$_runtimever" \
    NuGet.Commands NuGet.Common NuGet.Configuration NuGet.Credentials NuGet.DependencyResolver.Core \
    NuGet.Frameworks NuGet.LibraryModel NuGet.Packaging NuGet.ProjectModel NuGet.Protocol NuGet.Versioning \
    Microsoft.IdentityModel.Abstractions
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
    # Use the source-built crossgen2 for ReadyToRun, see crossgen2-pack.targets
    "-p:CustomAfterMicrosoftCommonTargets=$srcdir/crossgen2-pack.targets"
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
  # Their assemblies are compiled to ReadyToRun with the crossgen2 the publish above used
  local _crossgen2=("$NUGET_PACKAGES/microsoft.netcore.app.crossgen2.$_rid"/*/tools/crossgen2)
  "$_publish_path"/pwsh -NoProfile -NonInteractive -File "$srcdir/build-modules.ps1" \
    -SourcePath "$srcdir" -OutputPath "$_publish_path/Modules" -Crossgen2Path "${_crossgen2[0]}"

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
  # Run the tests with a home of their own, so they neither see the profiles, modules and configs
  # of the user building the package, nor leave their own files behind in the user's home.
  # Some tests expect the config folder of PowerShell to exist already, and Get-ChildItem.Tests.ps1
  # expects the home to have visible content like any real home.
  # The timezone is fixed as well, some tests depend on it.
  rm -rf "$srcdir/test-home"
  export HOME="$srcdir/test-home"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_STATE_HOME="$HOME/.local/state"
  export TZ=UTC
  mkdir -p "$XDG_CONFIG_HOME/powershell" "$HOME/Documents"

  ctest --test-dir build-psl-native --output-on-failure

  _dotnet_env
  cd PowerShell || exit
  # The xUnit tests aren't run from the publish folder, so they need to find libpsl-native
  export LD_LIBRARY_PATH="$srcdir/PowerShell-Native/src/powershell-unix${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

  cd test/powershell || exit
  # In Pester 4.x, deleting tests is unfortunately the only fine grained option
  # to disable tests.

  # These tests use Pesters TestDrive in a way that it doesn't work on Linux
  # shellcheck disable=SC2016
  sed -i -e 's/TestDrive:/$TestDrive/g' \
    -e '/Push-Location $rootDir/iNew-Item -ItemType "Directory" -Path $TestDrive -Name TestDir -Force' \
    Modules/Microsoft.PowerShell.Management/FileSystemProviderExtended.Tests.ps1

  # TEMPORARY: Test-Json is broken on PowerShell 7.6.7+
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/28218
  # A fix seems to queued for the next release.
  rm Modules/Microsoft.PowerShell.Utility/Test-Json.Tests.ps1

  # Test is broken due to a logic error not considering timezone aliases
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27502
  rm Modules/Microsoft.PowerShell.Management/TimeZone.Tests.ps1

  # The tests delete help files from $PSHOME, and some only pass when run on their own, as tests
  # that ran earlier in the same session change which help content Get-Help finds
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/28274
  rm engine/Help/HelpSystem.Tests.ps1

  # Test requires DSCv3 being available
  # DSCv3 is not part of the PowerShell Core anymore and needs to be installed
  # See https://github.com/PowerShell/DSC and the `powershell-dsc` AUR package.
  rm dsc/dsc.profileresource.Tests.ps1

  # Test is extremely build dependent
  # For an fxdependent Release build, it has the wrong list of files
  # and it will be inconsistent. This only makes sense in the context of their CI.
  rm Host/Startup.Tests.ps1

  # Our build does not include telemetry, so the associated tests fail of course.
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

  # Some tests change $PSHOME, so they run with a copy of the publish folder package() installs
  local _test_pshome="$srcdir/test-pshome"
  rm -rf "$_test_pshome"
  cp -a "$_publish_path" "$_test_pshome"

  # Add the test tools and pwsh to path
  export PATH="$_test_pshome:$PWD/bin${PATH:+:${PATH}}"

  # The modules the tests use from the PowerShell Gallery (PSGalleryTestModules.csproj), from source
  cp -r "$srcdir/SelfSignedCertificate/SelfSignedCertificate" test/tools/Modules/

  # Some tests are locale dependent, so we need to ensure the en-US locale is being used.
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  # PSResourceGet is built for .NET here, which upstream doesn't test. Its own tests need the PowerShell
  # Gallery, so it gets a smoke test with a local repository instead.
  rm -rf "$srcdir/psresourceget-test"
  pwsh -NoProfile -NonInteractive -File "$srcdir/psresourceget-test.ps1" -WorkPath "$srcdir/psresourceget-test"

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

  # The .NET host only loads the assemblies pwsh.deps.json lists, so it's written by a pacman hook from
  # the one PowerShell is built with and fragments other packages install in deps.d, e.g. for
  # Microsoft.Management.Infrastructure, which PowerShell is built without (see prepare()).
  # The base stays in $PSHOME, as the host looks for the listed assemblies next to the deps.json.
  mv "$pkgdir/usr/lib/$pkgname-$_pkgnum/pwsh.deps.json" "$pkgdir/usr/lib/$pkgname-$_pkgnum/pwsh.base.deps.json"
  install -dm755 "$pkgdir/usr/share/powershell/deps.d"
  install -Dm644 -t "$pkgdir/usr/share/powershell" "$srcdir/update-pwsh-deps.ps1"
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" "$srcdir/powershell-deps.hook"
  install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" "$srcdir/update-pwsh-deps"
  sed -i "s|@PSHOME@|/usr/lib/$pkgname-$_pkgnum|g" "$pkgdir/usr/share/libalpm/scripts/update-pwsh-deps"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
