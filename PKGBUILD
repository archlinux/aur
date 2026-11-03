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
pkgrel=23
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=(x86_64 aarch64)
url='https://microsoft.com/PowerShell'
license=(MIT)
options=(!debug)
_dotnetsdkver="10.0"
# PowerShell-Native has no tag for the version PowerShell uses (700.0.2), it was published from this commit
_psnativecommit="f24d5494b373de20ec3e3d2fdc7c3fc98af1f9f1"
# The modules PowerShell bundles (src/Modules/PSGalleryModules.csproj) are built from source as well.
# Most of their releases aren't tagged, so these are commits:
_psresourcegetver="1.2.0"
_psreadlinever="2.4.5"
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
# Microsoft.PowerShell.MarkdownRender 7.2.1, which Microsoft.PowerShell.Commands.Utility uses: last commit
# of its repository
_markdownrendercommit="c216c18b1fb275aec0a3e84094bd0e1a4c5da685"
# SelfSignedCertificate 0.0.4, a module the tests use (test/tools/Modules/PSGalleryTestModules.csproj):
# last commit of the archived repository, which fixes the validity period for time zones after the release
_selfsignedcertificatecommit="5f720d3d5b28c2cb2e9b33296cfd802ec6f1a668"
# Pester 4.10.1, which the tests are written for: the latest 4.x, which build.psm1 saves
_pesterver="4.10.1"
# The tests of PowerShell Standard 5.1.1 (dotnet-powershellstandard-library), which check the reference
# assembly the modules compile against with this PowerShell: release commit, upstream doesn't tag
_psstdcommit="b69d5e6a5107287a5981db515bae4d5631278f76"
depends=(
  "dotnet-runtime-$_dotnetsdkver"
  glibc
  libgcc
  libstdc++
  # xdg-utils are indirectly needed for System.Diagnostics.Process() with
  # ProcessStartInfo.UseShellExecute (see src/System/Diagnostics/Process.Linux.cs of the dotnet runtime)
  # PowerShell relies on this for its invoke logic, c.f. src/System.Management.Automation/namespaces/FileSystemProvider.cs
  xdg-utils
)
backup=(etc/powershell.config.json)
optdepends=('openssh: PowerShell Remoting over ssh'
  'wl-clipboard: Clipboard functionality on Wayland'
  'xclip: Clipboard functionality on X11, or on Wayland through Xwayland'
  'powershell-dsc: PowerShell Desired State Configuration v3 support'
  'powershell-editor-services: Language server and debug adapter for PowerShell editor support'
  'powershell-mmi: Microsoft.Management.Infrastructure for modules built against PowerShell with it, e.g. PSScriptAnalyzer from the PowerShell Gallery'
  'powershell-powershellget-v3: PowerShellGet v3, which runs Install-Module and friends on PSResourceGet instead of the bundled v2')
makedepends=(
  # The packages of .NET itself come from the .NET dotnet-build-deps-10.0 chooses: the source-built
  # .NET of Arch Linux, or Microsoft's build (dotnet-build-deps-10.0-bin, e.g. on Arch Linux ARM,
  # which has no .NET packages). The libraries come from powershell-build-deps, built from source,
  # or nuget.org (powershell-build-deps-bin). See _nuget_feeds() and _nuget_modules_config().
  "dotnet-build-deps-$_dotnetsdkver"
  powershell-build-deps
  cmake
  gtest
  git
  ruby-ronn-ng
)
checkdepends=(
  # ASP.NET is needed for test/tools/WebListener
  "aspnet-targeting-pack-$_dotnetsdkver"
  "aspnet-runtime-$_dotnetsdkver"
  bash          # Needed for various tests, e.g. test/powershell/Language/Scripting/NativeExecution/NativeLinuxCommands.Tests.ps1
  expect        # Needed for test/powershell/Host/Read-Host.Tests.ps1
  glibc-locales # Ensures generated en-US locale is present. Tests need to be run in that locale and we can't call locale-gen from a PKGBUILD.
  grep          # Used widely in tests
  groff         # Checks the generated man page
  inetutils     # Needed for test/powershell/Modules/Microsoft.Powershell.Host/Start-Transcript.Tests.ps1
  less          # Needed for test/powershell/engine/Help/HelpSystem.Tests.ps1, the help function pages with it
  iputils       # Needed for ping, which is used in a lot of places
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
  "git+https://github.com/PowerShell/MarkdownRender.git#commit=$_markdownrendercommit"
  "git+https://github.com/PowerShell/ThreadJob.git#commit=$_threadjobcommit"
  "git+https://github.com/rjmholt/SelfSignedCertificate.git#commit=$_selfsignedcertificatecommit"
  "Pester-$_pesterver.tar.gz::https://github.com/pester/Pester/archive/$_pesterver.tar.gz"
  "git+https://github.com/PowerShell/PowerShellStandard.git#commit=$_psstdcommit"
  "psmodulepath-combined-paths.patch"
  "mmi-optional.patch"
  "telemetry-optional.patch"
  "test-json-list-output.patch"
  "help-cache-reset.patch"
  "wayland-clipboard.patch"
  "system-drawing-windows-only.patch"
  "oneget-user-temp-folder.patch"
  "oneget-net10.patch"
  "psresourceget-net10.patch"
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
  '1ca27ad9507547b04a9a6cb51bced6533312acff8a117ea10ac8843f2c25becda30b91c0c5e75693aa7870619238dfae3c86820e4ac04243cc42f7da8b0c37ca'
  'e06ea3440792c4c7ad1cffa48cfff9f11434edc88344b200b1f4aa828d2fd0a81e5ff57f9b20f22838e74cec8997f23a88c559adc07ca355443b37e5fe3b447d'
  '79e554984a743d8ced1789a7103ed684e3af37a3b415820fb7da5e51f5f513d5131eb813b0e9b5dbeace9cb06558a548212fa503600d16c301fcc53cb483e423'
  'c510ec133160d0f8aafc3ac37e3db7a2854f7e0bb67d22a287fa5ffbf9f3e205ed2a73a04413cf7f412290062b814cdbefb8445991447454db1dc27e71d78ba9'
  '01cc421451dda2428b3a62fa6476c87bb00b79277098dd3f02ee0095da7fe706565a5c4e449dd4b43e5b5651bb929a685e74a139c0f30fa122fbfa36d79e734c'
  'cf70b41d0ee4b4282f38e9277b743b2749a0e728cb43123304f6218ee48a026e9bc26493ccb23b50991f453188a29559e6fea799a11c4701fe7719d8ec18e485'
  '50912ff845d107ca0b3b3401b8253289bb8ee00f06191e657a37b2e49dd48fa56b1cf1f1d7d63cf54b123e1d88e2fc9b7f13341fd5d9c0609ccc579a86057fef'
  '3f82a01dd2077f29e067cfa449f88172a7a78b4318d1fd0ffbe7f23043134b654dc574500353e57b2c508b9c044b63660bb1fa3156704c072b098855126cf556'
  'a805ef8f83ac366a2519e9c30efdb0842d9bede92f30686826fcfaf2904c395c0c4128b35a122c43dfd4c07231eea8b78807026bb3034f213736450bab0e65fb'
  '9a08f25fceaf92c01dc178d4e54f41342de24be4710c0c57decc4cb80cf8a73cf73301d4eb23a7815d953a7e6ac16b92f1da3604833f373d6ef6904ab7b0e1ac'
  'd778770716591c573c8526a647eaafb4788338e2cc076b2c05d1e450cc8068f3cd101d4f415fd631b127344998038e7656ad454de14c6f442c19513250ff92f3'
  '7f0df1c1eadfc39f7075cf6de7b1d2b99959042b2a3ee1cc0158ead26128ae8086463c563178b22c325c965352d5d756d2b02abf1137ad91b116fd753aeed8b6'
  '330a83bbd7bf6f6f7c048fabc506724fbce3a4abb2579b7ae1ef528eea194d9424ce7d6419fab28f7c7a3b46a1f2fc65fd7ecaefe3413fee31961b4a6f068ede'
  'f48a6fb7a90ce1af85f0e7587b0d38ec614e81ce58fe32534ec8c7eb3aef1b34d31d9fceb8935cc8f526e3ec12a5ea3c9d768497a52d3be4e9a12f51b717708a'
  '0e1d6cc06c5ba0fcb465d3560d15dc63372e612be3c398cac09f225a40c6a8032781733e1aeda503ea64da97c9b9470fc5554bca2f6254ae45b9d0b3cf8d37a9'
  '45bdb2ed53bf8e1efbab058af09756cc9bdfaac57e993372f5c44b5533f3344e0b22d824ee33489fbcdef20115f7ff9f7be75ede72d343573f5a5d4d98fcace1'
  '647b8486bbb67395fd195d9d09cd248ad5eb811b594efc0dd3e12559c378ee879cdec0a8dde39a154dd818b3ce668e68d129b7a6bff2650e73a3a3390c76820b'
  '1f4c1a2aeb19b0ed83142fb55e6ca938ecac3ec8f5a7095f85e000eef79729f48719ea83c04e8c2aafdbcbafa7faddd1b67555107e850094506346470b1c15c7'
  '501e304575a23c12d2e8466de14b51d1b4d25d72a64c633ea9170a6d64ef65df38fb542e1f42c6ffdaa5a55dbbfbca2327ff5c81b77cc6019fda717dbef68351'
  '1a6acc32f7cecbf0e32f540870cc1d19c5f6fa59a24334eab51c41245b6b039ae0b2f17ab644d9229291626a9887611e442815f916fd8fdd2193ab558762307b'
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
  '7533a4ed44964bcb3878e8a968c86cce9eb6e77a663bf08dee0acbc4ad66d144e76153a5865e008747bb24cfd43f82b6ec5b49748773f6e4109f2a81bcc4dfb8'
  '88d59ba95cf513d89e59dab0a1e7869c2dd7f28e8073160335689c5f685325be210039875504f992778a00fef531b6fc00d8b2744e6ff8b3ab5c4289e15433c1'
  'a689ff17cc325445e8bd974b83047594056f9c7b57dbae3cefd66738b9a8742307243e204e5860b799710887011ac32f3627b8700ec629b726813d95b5345d6a'
  'b742e9e0de7a0e4ce3e077f01481328ee8245aecc144aade29f284560668ac551415d7228b88bdc31e9c8d4fd970bb0b1b1467772bd17802a21dfc21d078c5e9'
  '8f3bf0c3fb85e458d24a4ae11b24cc8c881c4c579d4fead5248557ca1a65a91e40d291d2d457cf8a2187540ccbaf1e8495e616256da1d829245067cfb62ef6c5'
  'afc912b63c9211373fbcfeec519631c84dd034a48832de4e7973d788bbd7a7af08935de6da2cbd10031e8755d1f02ab4bd3ba62d3f382b0cb3a3d2a10a897cf4'
  'b44a43b3cb575264177a75e720b5ace94c1a79c2b1b9793885ff06e0b27dfae11f1d5397712eb58a14fe9cadb69c593eca0cd9fddbd9ad1432842347211bea67'
  '48a060b49e1f1e4266896c5fbfe12b57348bb2efafc82ca7fe8b77f397cd6b5806d03029d41da0bba626f56499a58c8125dc4d121e4cfbe24126ff406a1dd404'
  'c63abea627ba33ebbd2f651eff99363b69d306c6dc7f6f5124c6af8afbccd31689bdf72259f3ec31c0437190acb60da892d7a596ae554048e61bb5c91c821706'
  '07d61a4c195a13807f11655f479d71f8f3b668ed6cfd81f130caf879fa48f13dca4c98955826e6257fcc94acb2771250e622aa9523247a8012d8274a2a1de87b'
  'b1d5446a953a87aeaa6e58102c461b2c1bcd0b21da0333f44e08d1908f5f2568161043b3a14e25121fedf2a7da589f55ae9dbc3f24512488563ffa069947884f'
  '93382f5100b58b1cf763054c4a839546f4c7cc8a141cf11d34ddf3b01a7c7e6663630e5ad32df32f69ff84c1d50073ce6c43ef3e4a7a934bbe6b344156e5c54e'
  '82d9f12d92c5c08e634bfea36f8d3cafc5db4a3c13acd6b99242453855ffaa1df192dafea7facbbc972a32c8d2a1db876457a626359403e3d51c4ab8c3bccc81'
  '6e2f143d782bbe68b049586ba2639d3c466ebda80443ad7df05ccef4a569229a1d14b115c5209d5e0b859c49b816a21b6a24a2a83ed5530b9b0b82c86b20ba2c'
  '1c6d0dd9a35c57922f1ee7d746785106cb16666106b806a787c80e2a9e18c3523a241e68b6c0d964ff8378ef1c41a4875bb3ecb3366a21ff0e54b833c4e7d8a4'
  'bf5b456dcba9893b269fd0cff4d577aedb10c75d18000fb101e479c9b8851e0118ed3f55d9e004fc062cd3062474a8155d5aa0750213fada0b6ccfc1827d1153'
  'e69a43062d745f832b734821ca7679b1c4b67e455906d7d093227205e8607b5c6b637eb9f28a00eb0778b0f69cdd1aa471d416e8ae7bf0990a97a07824353956'
  '956db6619cedbdf41d36a8d28e35035c0414cd81a08bd077c0b9097c122e8d8870cbc7d30d43654e2575853a338169fd1042633ff45c92d0cf0ce100147125ea'
  'f46fcb1d242979be39dbd14c6e5dc8c04ede57ed2de52a74e56bf18ce3c6b5985351d70ec0e291ed3ccec1655ebee4da931c88680c7ef60dec4797d78f015833'
  'a235ac1c91dbe0ea0f0fc89189028250753c0a4104b2779f26b66fa8f239e5bd580b83ed5c8a5e0b0d9ee2afef42ce9c8f6d10ea2d206c0c3694b63e44e76838'
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
  # Without telemetry, see telemetry-optional.patch in prepare()
  export UseTelemetry=false
  # RID of the running .NET SDK: arch-x64 for the source-built .NET of Arch, linux-arm64 for Microsoft's
  # build. The code generators (ResGen, TypeCatalogGen) and crossgen2 run on it, the build host.
  _host_rid=$(dotnet --info | sed -n -E 's/^ *RID: *//p')
  # The architecture and RID PowerShell is built for. They follow the package architecture ($CARCH), so an
  # x86_64 host can cross-build for aarch64. A native build (the host's architecture is $CARCH) targets the
  # host RID: the source-built .NET of Arch on x86_64, Microsoft's build on Arch Linux ARM. A cross build
  # has no source-built .NET for the target, so its runtime and crossgen packs are Microsoft's portable
  # linux-<arch> ones from nuget.org, the same build Arch Linux ARM runs natively.
  case "$CARCH" in
    x86_64) _target_arch=x64 ;;
    aarch64) _target_arch=arm64 ;;
  esac
  if [[ "$_host_rid" == *-"$_target_arch" ]]; then
    _rid="$_host_rid"
  else
    _rid="linux-$_target_arch"
  fi
  # The RuntimeIdentifiers of the projects: the target RID, plus the host RID on a cross build so the code
  # generators still build and run on the host.
  if [[ "$_rid" == "$_host_rid" ]]; then
    _rids="$_rid"
  else
    _rids="$_host_rid;$_rid"
  fi
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
#   further arguments; references to them are set to the version there. Together with them, the
#   packages built from the same sources by their own packages, in /usr/share/nuget/dotnet-10.0/packages
#   (dotnet-system-io-ports-native). With dotnet-build-deps-10.0-bin (Microsoft's .NET, e.g. on Arch
#   Linux ARM), there are none, and they come from nuget.org.
# - /usr/share/nuget/packages, libraries built from source by their own packages (dotnet-*,
#   powershell-build-deps). References to them are set to the installed version with the same major
#   version, or the newest installed one if there's none, so a newer major version installed alongside
#   doesn't break the build. With powershell-build-deps-bin, the ones that aren't installed come from
#   nuget.org, in the versions upstream references.
# - nuget.org for everything else
_nuget_feeds() {
  local _systemfeed=/usr/share/nuget/packages
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
    for _nupkg in "/usr/share/nuget/dotnet-$_dotnetsdkver/packages"/*.nupkg; do
      [[ -f "$_nupkg" ]] || continue
      cp "$_nupkg" "$srcdir/nuget-local/"
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
EOF
    # NuGet fails on local feeds that don't exist, as the system feed may not with the -bin variants of
    # the build dependencies
    if ((${#_systempackages[@]})); then
      echo "    <add key=\"dotnet-packages\" value=\"$_systemfeed\" />"
    fi
    cat <<EOF
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

# Prints the package source mapping of the feed $1 for the package patterns $2...
_nuget_mapping() {
  echo "    <packageSource key=\"$1\">"
  shift
  printf '      <package pattern="%s" />\n' "$@"
  echo '    </packageSource>'
}

# Writes the nuget.config of the modules (build-modules.ps1) and of the tests of PowerShell Standard.
# They only compile against reference packages, which don't need to match the .NET runtime: PowerShell
# Standard (dotnet-powershellstandard-library, part of powershell-build-deps) and the reference packages
# of .NET's source build (dotnet-source-build-reference-packages, part of dotnet-build-deps-10.0),
# or the originals from nuget.org with the -bin variants.
_nuget_modules_config() {
  local _psstdpkg=(/usr/share/nuget/packages/PowerShellStandard.Library.*.nupkg)
  local _referencedir="/usr/share/nuget/dotnet-$_dotnetsdkver/reference-packages"
  local _psstdfeed=nuget.org _referencefeed=nuget.org
  local -A _urls=(
    ["dotnet-packages"]=/usr/share/nuget/packages
    ["dotnet-source-build-reference-packages"]="$_referencedir"
    ["nuget.org"]=https://api.nuget.org/v3/index.json
  )
  if [[ -f "${_psstdpkg[0]}" ]]; then _psstdfeed=dotnet-packages; fi
  if [[ -d "$_referencedir" ]]; then _referencefeed=dotnet-source-build-reference-packages; fi
  {
    cat <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
EOF
    printf '    <add key="%s" value="%s" />\n' "$_psstdfeed" "${_urls[$_psstdfeed]}"
    if [[ "$_referencefeed" != "$_psstdfeed" ]]; then
      printf '    <add key="%s" value="%s" />\n' "$_referencefeed" "${_urls[$_referencefeed]}"
    fi
    cat <<EOF
  </packageSources>
  <packageSourceMapping>
    <clear />
EOF
    if [[ "$_referencefeed" == "$_psstdfeed" ]]; then
      _nuget_mapping "$_psstdfeed" PowerShellStandard.Library NETStandard.Library Microsoft.NETCore.Platforms Microsoft.CSharp
    else
      _nuget_mapping "$_psstdfeed" PowerShellStandard.Library
      _nuget_mapping "$_referencefeed" NETStandard.Library Microsoft.NETCore.Platforms Microsoft.CSharp
    fi
    echo '  </packageSourceMapping>'
    echo '</configuration>'
  } >"$srcdir/nuget-modules.config"
}

prepare() {
  _dotnet_env

  # makepkg reuses $srcdir unless it's run with -C: it resets the files of the git checkouts, but keeps
  # untracked ones and the changes in submodules, e.g. the files the patches add, which fail to apply
  # again, and the NuGet packages restored by the last build, which NuGet uses whichever feed they came
  # from. Start from the same state as in a new $srcdir.
  local _checkout
  for _checkout in "$srcdir"/*/.git; do
    git -C "${_checkout%/.git}" clean -dffxq
  done
  git -C "$srcdir"/oneget submodule foreach --quiet 'git checkout --force --quiet && git clean -dffxq'
  rm -rf "$srcdir"/{nuget-local,dotnet-home,build-psl-native}

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
  # Builds for .NET 10 instead of .NET Standard 2.0, see Build-PackageManagementModule in
  # powershell-modules.psm1
  patch -Np1 -i "$srcdir/oneget-net10.patch"

  cd "$srcdir"/PowerShell || exit

  # Fix startup crash when PSModulePath is already set and powershell.config.json
  # contains multiple paths, e.g. when starting pwsh from pwsh
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/20706
  # Fixed upstream in 7.7 by https://github.com/PowerShell/PowerShell/pull/26565, which isn't
  # backported to 7.6, so drop this patch with 7.7
  patch -Np1 -i "$srcdir/psmodulepath-combined-paths.patch"

  # CIM (Microsoft.Management.Infrastructure, MMI) is only usable on Windows, and only free on Linux:
  # - On Windows, MMI 3.0 (Microsoft.Management.Infrastructure.Runtime.Win) isn't open source. The
  #   PowerShell team said "MMI.dll is not Open Source (and no plans to be OSS)" in
  #   https://github.com/PowerShell/PowerShell/issues/8397. The package comes under the Microsoft
  #   Software License Terms, although it links to an MIT project: they allow using it "solely for use
  #   with Microsoft PowerShell" and forbid distributing it or providing it as a hosted solution, see
  #   https://github.com/PowerShell/PowerShell/issues/28027 and #20798. NuGet restores it on every
  #   platform, so all source builds of PowerShell download it.
  # - On Linux and macOS, Microsoft.Management.Infrastructure.Runtime.Unix (MIT) has MMI 2.0, built
  #   from PowerShell/MMI. Its last change is from 2019, and the repository is archived. It needs the OMI
  #   client library (libmi), which PowerShell doesn't ship, so CIM fails on Linux anyway.
  # - Debian's request for packaging PowerShell (https://bugs.debian.org/834756) names MMI among the
  #   non-free parts that keep it out of Debian main since 2018.
  # So the patch makes it optional with a build property, UseMmi=false (see _dotnet_env), which leaves
  # out everything that needs it: CIM, the CIM type adapter and DSC's MOF support. Built normally,
  # nothing changes. ArgumentToConfigurationDataTransformationAttribute doesn't use CIM and scripts use it
  # to read .psd1 files, so it moves out of CimDSCParser.cs into its own file. A stub of DscClassCache
  # stays for modules built against PowerShell with MMI, e.g. PSScriptAnalyzer from the PowerShell
  # Gallery.
  patch -Np1 -i "$srcdir/mmi-optional.patch"

  # PowerShell sends telemetry with Application Insights unless POWERSHELL_TELEMETRY_OPTOUT is set. The
  # patch adds a build property, UseTelemetry=false (see _dotnet_env), which builds an empty version of
  # ApplicationInsightsTelemetry with the same members instead, without Microsoft.ApplicationInsights.
  # Built normally, nothing changes. The telemetry tests are skipped in builds without telemetry.
  patch -Np1 -i "$srcdir/telemetry-optional.patch"

  # Test-Json only reports the first error since 7.6.7, e.g. nothing for invalid array items
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/28218
  # Upstream fix: https://github.com/PowerShell/PowerShell/pull/28273, in 7.6.10
  patch -Np1 -i "$srcdir/test-json-list-output.patch"

  # Get-Help keeps loading the help file it found first, even after Update-Help installed help that
  # takes precedence or the UI culture changed, as the full path stays in the HelpFile of the command
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/28274
  # Upstream fix: https://github.com/PowerShell/PowerShell/pull/28294
  patch -Np1 -i "$srcdir/help-cache-reset.patch"

  # Get-Clipboard and Set-Clipboard only use xclip, which on Wayland only reaches the clipboard through
  # Xwayland: text copied in Wayland apps isn't there, Get-Clipboard returns older text instead. This
  # uses wl-clipboard on Wayland where it's installed, xclip otherwise.
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/17561
  # Upstream PR: https://github.com/PowerShell/PowerShell/pull/24049, which adds a variable to configure
  # the tools as well; this is only the detection and the use of wl-clipboard
  patch -Np1 -i "$srcdir/wayland-clipboard.patch"

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

  # Packages come from the system where possible, see _nuget_feeds() and _nuget_modules_config()
  _nuget_feeds "$_runtimever"
  _nuget_modules_config

  # Packages from the system feed may satisfy a dependency with a newer version than its minimum
  # (e.g. Json.More.Net 2.2.0 for JsonPointer.Net's >= 2.1.1), keep that a warning
  # shellcheck disable=SC2016
  sed -i 's|<TreatWarningsAsErrors>true</TreatWarningsAsErrors>|&\n    <WarningsNotAsErrors>$(WarningsNotAsErrors);NU1603</WarningsNotAsErrors>|' \
    PowerShell.Common.props test/Test.Common.props

  # There's no point to run analyzers in a PKGBUILD, see RunAnalyzersDuringBuild in build() as well
  sed -i -e '/PackageReference/d' Analyzers.props

  # libpsl-native is built from PowerShell-Native and put next to pwsh in build()
  sed -i -e '/"Microsoft.PowerShell.Native"/d' src/System.Management.Automation/System.Management.Automation.csproj

  # Every project is built for .NET $_dotnetsdkver and $_rid only. References to packages of assemblies
  # .NET itself has become framework references, and runtime packages of other platforms are dropped,
  # so they aren't downloaded. The source generator PSVersionInfoGenerator targets .NET Standard 2.0,
  # whose System.* packages are part of .NET.
  local _csproj _packref _packname
  while read -r _csproj; do
    sed -i -E -e 's/netstandard2\.0/net'"$_dotnetsdkver"'/' \
      -e 's|(RuntimeIdentifiers>)[^<]*|\1'"$_rids"'|' "$_csproj"
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

  # The code generators build() runs, on the build host
  dotnet restore "src/TypeCatalogGen" --runtime "$_host_rid"
  dotnet restore "src/ResGen" --runtime "$_host_rid"

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

# Builds libpsl-native from PowerShell-Native into PowerShell-Native/src/powershell-unix, for $CARCH. A
# cross build ($CARCH differs from the build host) compiles with clang and lld against the C library and
# GCC of a root file system for $CARCH in ROOTFS_DIR, like dotnet-system-io-ports-native. With "host",
# it's built for the build host instead, for the PowerShell a cross build runs (see build()).
_build_psl_native() {
  local _builddir=build-psl-native _args=() _triple="$CARCH-unknown-linux-gnu"
  if [[ "${1:-}" == host ]]; then
    # Not packaged, so without the flags of makepkg, which are for $CARCH
    CFLAGS='' CXXFLAGS='' LDFLAGS='' cmake -S PowerShell-Native/src/libpsl-native -B build-psl-native-host \
      -DCMAKE_BUILD_TYPE=Release
    cmake --build build-psl-native-host
    return
  fi
  if [[ "$(uname -m)" != "$CARCH" ]]; then
    if [[ ! -d "${ROOTFS_DIR:-}" ]]; then
      echo "powershell: a cross build needs ROOTFS_DIR set to a $CARCH root file system" >&2
      exit 1
    fi
    # Programs, e.g. make, from the build host, not the root file system, whose programs are for $CARCH
    _args=(
      -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR="$CARCH" -DCMAKE_SYSROOT="$ROOTFS_DIR"
      -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER
      -DCMAKE_C_COMPILER=clang -DCMAKE_C_COMPILER_TARGET="$_triple"
      -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_CXX_COMPILER_TARGET="$_triple"
      -DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=lld -DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=lld
    )
  fi
  cmake -S PowerShell-Native/src/libpsl-native -B "$_builddir" -DCMAKE_BUILD_TYPE=Release "${_args[@]}"
  cmake --build "$_builddir"
}

build() {
  _dotnet_env

  # A cross build ($CARCH differs from the build host) needs a PowerShell for the build host as well: the
  # bundled modules and the help are produced by running PowerShell, and the one being built is for
  # another architecture. It's published to $srcdir/host-pwsh below, with a libpsl-native for the host,
  # which goes to the same folder as the one for $CARCH, so it's built and set aside first.
  local _pwsh="$_publish_path/pwsh" _modulesargs=()
  if [[ "$_rid" != "$_host_rid" ]]; then
    _build_psl_native host
    install -Dm755 PowerShell-Native/src/powershell-unix/libpsl-native.so -t "$srcdir/host-pwsh"
    _pwsh="$srcdir/host-pwsh/pwsh"
  fi
  _build_psl_native

  # The classes of the resources (ResGen). It runs much faster if built with optimisations.
  cd "$srcdir"/PowerShell/src/ResGen || exit
  dotnet run \
    -c Release \
    -f "net$_dotnetsdkver" \
    -r "$_host_rid"

  # The type catalogue of System.Management.Automation, from the assemblies of Microsoft.PowerShell.SDK
  # (TypeCatalogGen)
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
    -r "$_host_rid" \
    ../System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs \
    "$_inc_file"

  local _build_arguments=(
    --configuration Release
    --framework "net$_dotnetsdkver"
    --no-self-contained
    -p:ReleaseTag="$pkgver"
    # Framework-dependent, with ReadyToRun (PowerShell.Common.props)
    "-p:AppDeployment=FxDependentDeployment"
    "-p:RunAnalyzersDuringBuild=false"
    # Use the source-built crossgen2 for ReadyToRun, see crossgen2-pack.targets
    "-p:CustomAfterMicrosoftCommonTargets=$srcdir/crossgen2-pack.targets"
  )

  cd "$srcdir"/PowerShell/src/powershell-unix || exit
  dotnet publish "${_build_arguments[@]}" \
    --runtime "$_rid" \
    --output "$_publish_path"

  # libpsl-native, built from PowerShell-Native
  install -Dm755 "$srcdir"/PowerShell-Native/src/powershell-unix/libpsl-native.so -t "$_publish_path"

  # Add-Type compiles against the reference assemblies of .NET in $PSHOME/ref
  mkdir -p "$_publish_path/ref"
  grep 'Microsoft.NETCore.App' "$_inc_file" | sed 's/;$//' | xargs -d '\n' cp -t "$_publish_path/ref"

  # The PowerShell for the build host of a cross build, without ReadyToRun, as it only runs here
  if [[ "$_rid" != "$_host_rid" ]]; then
    dotnet publish "${_build_arguments[@]}" --runtime "$_host_rid" -p:PublishReadyToRun=false \
      --output "$srcdir/host-pwsh"
    # The images are compiled against the runtime they run on, the one of the target
    local _runtime=("$NUGET_PACKAGES/microsoft.netcore.app.runtime.$_rid"/*)
    _modulesargs=(-RuntimePath "${_runtime[0]}")
  fi

  # The bundled modules, built from source with PowerShell. Their assemblies are architecture-neutral
  # IL, compiled to ReadyToRun for the target with the host's crossgen2 (which the publish above
  # restored), targeting $_target_arch so a cross build produces the target's images.
  local _crossgen2=("$NUGET_PACKAGES/microsoft.netcore.app.crossgen2.$_host_rid"/*/tools/crossgen2)
  "$_pwsh" -NoProfile -NonInteractive -File "$srcdir/build-modules.ps1" \
    -SourcePath "$srcdir" -OutputPath "$_publish_path/Modules" -Crossgen2Path "${_crossgen2[0]}" \
    -TargetArch "$_target_arch" -PowerShellHome "$_publish_path" "${_modulesargs[@]}"

  # The man page
  # The checked-in pwsh.1 ends in the synopsis at -WindowStyle: Ronn took the placeholder <style> for an
  # HTML style element and dropped what follows. Renaming the placeholder and regenerating the page
  # fixes it, and once a release has the regenerated pwsh.1, ruby-ronn-ng isn't needed anymore.
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/21086
  # Upstream fix: https://github.com/PowerShell/PowerShell/pull/28293
  cd "$srcdir"/PowerShell/assets/manpage || exit
  sed -i 's/<style>/<windowStyle>/' pwsh.1.ronn
  ronn -r "pwsh.1.ronn"

  # Install the help of the modules into the publish folder, see update-help.ps1
  "$_pwsh" -NoProfile -NonInteractive -File "$srcdir/update-help.ps1" -PowerShellHome "$_publish_path"
}

check() {
  # The man page generated in build(): no warnings from groff, and every section of the Ronn source in
  # it. groff doesn't warn about what Ronn drops, the checked-in pwsh.1 of
  # https://github.com/PowerShell/PowerShell/issues/21086 ends in the synopsis without a warning.
  local _manpage="$srcdir/PowerShell/assets/manpage" _warnings _section
  _warnings=$(groff -man -ww -z "$_manpage/pwsh.1" 2>&1)
  if [[ -n "$_warnings" ]]; then
    printf '%s\n' "$_warnings" >&2
    return 1
  fi
  while IFS= read -r _section; do
    if ! grep -qxF ".SH \"$_section\"" "$_manpage/pwsh.1"; then
      echo "pwsh.1 lacks the section $_section of pwsh.1.ronn" >&2
      return 1
    fi
  done < <(sed -n 's/^## //p' "$_manpage/pwsh.1.ronn")

  # The tests run the PowerShell that was built, which on a cross build ($CARCH differs from the build
  # host) targets another architecture and can't run here. Run them natively on the target instead, e.g.
  # the native aarch64 build.
  if [[ "$(uname -m)" != "$CARCH" ]]; then
    echo 'powershell: skipping the test suite on a cross build; run it natively on the target architecture' >&2
    return 0
  fi

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
  # A temp folder of their own as well: some tests write files with fixed names there, like
  # WebListener's ServerCert.pfx, which fail when another user's build left them in /tmp. It stays in
  # /tmp rather than $srcdir, as PowerShell's named pipes (Enter-PSHostProcess) are sockets in it,
  # whose paths can't be longer than 108 bytes.
  local _test_tmp
  _test_tmp=$(mktemp -d)
  export TMPDIR="$_test_tmp"

  ctest --test-dir build-psl-native --output-on-failure

  _dotnet_env
  cd PowerShell || exit
  # The xUnit tests aren't run from the publish folder, so they need to find libpsl-native
  export LD_LIBRARY_PATH="$srcdir/PowerShell-Native/src/powershell-unix${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

  cd test/powershell || exit
  # Pester 4 can't leave out single tests from the outside, so they're skipped in their files, or whole
  # files removed.

  # "Validate Get-Item ResolvedTarget property" changes to TestDrive:/TestDir, which only the previous
  # Describe creates, as each Describe gets an empty TestDrive. The tests then create their links in the
  # current directory, the repository.
  # shellcheck disable=SC2016
  sed -i -e 's/TestDrive:/$TestDrive/g' \
    -e '/Push-Location $rootDir/iNew-Item -ItemType "Directory" -Path $TestDrive -Name TestDir -Force' \
    Modules/Microsoft.PowerShell.Management/FileSystemProviderExtended.Tests.ps1

  # The test looks up the first time zone by its name, which fails when an alias of it comes first
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27502
  # Upstream fix: https://github.com/PowerShell/PowerShell/pull/27525, in 7.7
  sed -i 's/It "Call Get-TimeZone using Name param and singe item"/& -Skip/' \
    Modules/Microsoft.PowerShell.Management/TimeZone.Tests.ps1

  # The tests write to /tmp rather than the temp folder, with fixed names that fail when another user's
  # build left them there: ParameterBinding its assembly, Get-Process a script
  sed -i "s@\$tempDir = '/tmp'@\$tempDir = [System.IO.Path]::GetTempPath()@" \
    engine/ParameterBinding/ParameterBinding.Tests.ps1
  # shellcheck disable=SC2016
  sed -i 's@/tmp/\$commandName@"$([System.IO.Path]::GetTempPath())$commandName"@g' \
    Modules/Microsoft.PowerShell.Management/Get-Process.Tests.ps1

  # Test requires DSCv3 (https://github.com/PowerShell/DSC), which isn't part of PowerShell. The
  # powershell-dsc package runs it in its check() instead, against the installed PowerShell.
  rm dsc/dsc.profileresource.Tests.ps1

  cd ../.. || exit

  # The tools the tests use
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

  # Microsoft.CSharp is part of .NET, and the warning about the needless reference (NU1510) is an error
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

  # Some tests change $PSHOME, so they run with a copy of the publish folder package() installs. pwsh
  # reads the powershell.config.json package() adds on startup, which Host/Startup.Tests.ps1 expects.
  # Its module path would bring in the installed PowerShell's modules, so the copy gets an empty one.
  local _test_pshome="$srcdir/test-pshome"
  rm -rf "$_test_pshome"
  cp -a "$_publish_path" "$_test_pshome"
  echo '{}' >"$_test_pshome/powershell.config.json"

  # Add the test tools and pwsh to path
  export PATH="$_test_pshome:$PWD/bin${PATH:+:${PATH}}"

  # The modules the tests use from the PowerShell Gallery (PSGalleryTestModules.csproj), from source
  cp -r "$srcdir/SelfSignedCertificate/SelfSignedCertificate" test/tools/Modules/

  # Pester from source as well, which build.psm1 saves from the PowerShell Gallery, rather than
  # powershell-pester-4, which needs powershell to build. The Gherkin parser comes from
  # dotnet-gherkin-5 (part of powershell-build-deps) instead of the prebuilt one, as in
  # powershell-pester-4; with powershell-build-deps-bin, it's Pester's own. The build tools with
  # nuget.exe and the parser for Windows PowerShell aren't needed.
  local _pester="$srcdir/test-modules/Pester/$_pesterver"
  local _gherkin=/usr/share/nuget/packages/Gherkin.5.1.0.nupkg
  rm -rf "$srcdir/test-modules"
  mkdir -p "${_pester%/*}"
  cp -r "$srcdir/Pester-$_pesterver" "$_pester"
  rm -r "$_pester/lib/Gherkin/legacy" "$_pester/vendor"
  if [[ -f "$_gherkin" ]]; then
    rm -r "$_pester/lib/Gherkin/core"
    mkdir "$_pester/lib/Gherkin/core"
    bsdtar -xOf "$_gherkin" lib/netstandard2.0/Gherkin.dll >"$_pester/lib/Gherkin/core/Gherkin.dll"
  fi

  # Some tests are locale dependent, so we need to ensure the en-US locale is being used.
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  # PSResourceGet is built for .NET here, which upstream doesn't test. Its own tests need the PowerShell
  # Gallery, so it gets a smoke test with a local repository instead.
  rm -rf "$srcdir/psresourceget-test"
  pwsh -NoProfile -NonInteractive -File "$srcdir/psresourceget-test.ps1" -WorkPath "$srcdir/psresourceget-test"

  # The tests of PowerShell Standard are run here, as dotnet-powershellstandard-library would need
  # powershell for them, which needs it to build. They check the packaged reference assembly with this
  # PowerShell, instead of building it again: a cmdlet compiled against it runs, and it has no types
  # this PowerShell lacks. PowerShell 7 removed the workflow job proxies (PowerShell/PowerShell#10083,
  # #9618), and the CIM type adapter is only there with MMI (mmi-optional.patch).
  local _psstd="$srcdir/PowerShellStandard" _psstdver
  local _psstdpkg=(/usr/share/nuget/packages/PowerShellStandard.Library.*.nupkg)
  # With powershell-build-deps-bin, the one from nuget.org the modules were built against (some
  # restore the 7.0.0 preview as well)
  if [[ ! -f "${_psstdpkg[0]}" ]]; then
    _psstdpkg=("$NUGET_PACKAGES"/powershellstandard.library/5.*/powershellstandard.library.5.*.nupkg)
  fi
  read -r _ _psstdver < <(_nupkg_info "${_psstdpkg[0]}")
  rm -rf "$_psstd/src/5/bin"
  mkdir -p "$_psstd/src/5/bin/Release/netstandard2.0"
  bsdtar -xOf "${_psstdpkg[0]}" lib/netstandard2.0/System.Management.Automation.dll \
    >"$_psstd/src/5/bin/Release/netstandard2.0/System.Management.Automation.dll"
  sed -i "s|<ProjectReference Include=\"../../../src/5/System.Management.Automation-lib.csproj\" />|<PackageReference Include=\"PowerShellStandard.Library\" Version=\"$_psstdver\" />|" \
    "$_psstd/test/5/core/PSStandard.csproj"
  cp "$srcdir/nuget-modules.config" "$_psstd/test/5/core/nuget.config"
  # shellcheck disable=SC2016
  sed -i 's/-difference \$asmT /-difference ($asmT | Where-Object { $_ -notin @("System.Management.Automation.JobDataAddedEventArgs", "System.Management.Automation.PSChildJobProxy", "System.Management.Automation.PSJobProxy", "System.Management.Automation.Runspaces.PSSessionType", "Microsoft.PowerShell.Cim.CimInstanceAdapter") }) /' \
    "$_psstd/test/5/core/PSS5.Tests.ps1"
  # The tests find the library through git, so they run in the repository
  (
    cd "$_psstd/test/5/core" || exit
    pwsh -NoProfile -NonInteractive -File "$srcdir/invoke-pester.ps1" \
      -Repository "$srcdir/PowerShell" -ModulePath "$srcdir/test-modules" -Script "$PWD"
  )

  # Not -NonInteractive, some tests rely on prompts
  pwsh -NoProfile -File "$srcdir/invoke-pester.ps1" -Repository "$PWD" -ModulePath "$srcdir/test-modules"

  # The xUnit tests
  dotnet test -tl:on -c Release -f "net$_dotnetsdkver" -r "$_rid" --test-adapter-path:.

  rm -rf "${_test_tmp:?}"
}

# Fails if a binary in $pkgdir, also inside the .nupkg files there, is identical to one of the packages
# restored from a remote feed like nuget.org into $1, so no prebuilt binary slips in instead of one built
# from source. Left out are the packages that come from nuget.org by choice: Microsoft's packages of
# .NET itself (built by the VMR, dotnet/dotnet) with dotnet-build-deps-10.0-bin, the other libraries
# with powershell-build-deps-bin. The packs of .NET itself (DotnetPlatform: runtime packs, which
# $PSHOME/ref is copied from, and the like) always are: a cross build gets the ones of its target from
# nuget.org, as Microsoft's build of the .NET PowerShell runs on there.
_check_prebuilt() {
  local _extracted="$srcdir/check-prebuilt" _metadata _file _hash _found=0 _dotnetbin=false _libsbin=false
  local _binaries=(-type f '(' -name '*.dll' -o -name '*.exe' -o -name '*.so' -o -name '*.so.*' -o -name '*.dylib' ')')
  local -A _prebuilt=()
  # .NET's packages from nuget.org with dotnet-build-deps-10.0-bin, and for the target of a cross build
  # ($CARCH differs from the build host), which has no source-built .NET
  if pacman -T dotnet-build-deps-"$_dotnetsdkver"-bin >/dev/null || [[ "$(uname -m)" != "$CARCH" ]]; then
    _dotnetbin=true
  fi
  if pacman -T powershell-build-deps-bin >/dev/null; then _libsbin=true; fi
  while IFS= read -r -d '' _metadata; do
    grep -qE '"source": *"https?://' "$_metadata" || continue
    grep -qs '<packageType name="DotnetPlatform"' "${_metadata%/*}"/*.nuspec && continue
    if grep -qs '<repository [^>]*url="https://github.com/dotnet/dotnet"' "${_metadata%/*}"/*.nuspec; then
      [[ "$_dotnetbin" == true ]] && continue
    else
      [[ "$_libsbin" == true ]] && continue
    fi
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
  _dotnet_env
  cd PowerShell || exit

  local _pkgnum=${pkgver:0:1}

  # Without debug symbols and the maps of ReadyToRun
  install -dm755 "$pkgdir/usr/lib/$pkgname-$_pkgnum"
  cp -a "$_publish_path/." "$pkgdir/usr/lib/$pkgname-$_pkgnum/"
  find "$pkgdir/usr/lib/$pkgname-$_pkgnum" \( -name '*.pdb' -o -name '*.r2rmap' \) -delete

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
  # It's generated state, so it's written to /var/lib/powershell, and $PSHOME/pwsh.deps.json links to
  # it. The host still looks for the listed assemblies in $PSHOME.
  mv "$pkgdir/usr/lib/$pkgname-$_pkgnum/pwsh.deps.json" "$pkgdir/usr/lib/$pkgname-$_pkgnum/pwsh.base.deps.json"
  install -dm755 "$pkgdir/var/lib/powershell"
  ln -s /var/lib/powershell/pwsh.deps.json "$pkgdir/usr/lib/$pkgname-$_pkgnum/pwsh.deps.json"
  install -dm755 "$pkgdir/usr/share/powershell/deps.d"
  install -Dm644 -t "$pkgdir/usr/share/powershell" "$srcdir/update-pwsh-deps.ps1"
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" "$srcdir/powershell-deps.hook"
  install -Dm755 -t "$pkgdir/usr/share/libalpm/scripts" "$srcdir/update-pwsh-deps"
  sed -i "s|@PSHOME@|/usr/lib/$pkgname-$_pkgnum|g" "$pkgdir/usr/share/libalpm/scripts/update-pwsh-deps"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

  _check_prebuilt "$srcdir/PowerShell/nuget"
}
