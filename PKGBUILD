# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Rikarnto Bariampa <richard1996ba@gmail.com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Christian Pfeiffer <cpfeiffer at rev-crew dot info>

pkgname=powershell
pkgver=7.6.3
pkgrel=5
pkgdesc="A cross-platform automation and configuration tool/framework"
arch=('x86_64')
url='https://microsoft.com/PowerShell'
license=('MIT')
options=('!debug')
depends=(
  dotnet-runtime-10.0
)
optdepends=('openssh: PowerShell Remoting over ssh'
  'xclip: Clipboard functionality')
makedepends=(
  dotnet-sdk-10.0
  aspnet-targeting-pack-10.0
  git
  unzip
  jq
)
checkdepends=(
  expect        # Needed for test/powershell/Host/Read-Host.Tests.ps1
  lttng-ust2.12 # Used for CoreCLR tracing, adds to reproducibility here
  inetutils
  iputils
  openssh # Needed for test/powershell/engine/Remoting/SSHRemotingCmdlets.Tests.ps1
  xclip   # Needed for test/powershell/Modules/Microsoft.PowerShell.Management/Clipboard.Tests.ps1
  xdg-utils
)
install=powershell.install

# Restore-PSPester() installs the latest version of Pester up to 4.99
# The last release of Pester 4 was 4.10.1, so this is picked
_pesterversion=4.10.1
source=(
  "git+https://github.com/PowerShell/PowerShell.git#tag=v$pkgver"
  'Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets'
  "https://globalcdn.nuget.org/packages/pester.$_pesterversion.nupkg"
  'nuget-source.patch'
  'disable-telemetry.patch'
)
noextract=("pester.${_pesterversion}.nupkg")
sha512sums=('2a185b1388744ff2ae36d87a56734532381fa0fcfa71b7c973ac0efbafe0347a9ae43f4b7b76fde69484d7ae35e208500923aed8904f5e8824073b2f621baec3'
  '5a70efe247cdae8ed5c66702909137e0727cf5e25aca54983891fc17716a56081825f9a6e57c56f8fa8aa5615a159f81c68ca501d42e2ce085c073be633b3025'
  '28044ba021b435692c22f7b1c8601774c87ddbfbc48356b74927a1e66c6d0cd1c16bd6b8a60a97ce8fed8114b7f39ef42684b9e3df30c01ba8359a901c7e8a81'
  'b23c18212391a9396e02e3b92abd91036d9f1bef3339d8b895b216c51b0f0e25b8baf3175204c6a802f6c6202c352d6574746c57297d4d38cb30b8fec2774792'
  '85b41fa0e6e2b40df3de5ddcb382d0801dff1cf709ec05c8f83116bfdba37ab740cddda1fcd47701cdb367a279e179ea518a00f01d698276abfb12074eeffbd1')
b2sums=('9846ac2506e74038ad74d1f79e9de8eadd1f0d54a5855109e3d38fb4e960c9f0f7d004c06e893ec8aac9f4ffa3cd86fa933583acaf61613e722d365a1a00316c'
  'ae227c4fb537ebc22fab66ed51ad49eee6b9c5be884a245256039cedfdc72e7e09329f814394aa961bcadf4c00b566c31da868f442392e72c6937a7a96587c14'
  '7f271e30cd911ad386789e83d0e45ba1e34a3dcce551e306f2fbf603613f4257dfa0b315a13643beb6efc5bdd3937088cccb4883e7fb0ca525a8a4eb20f9986c'
  '2c343d12d57057d1b0602fd772c3c99d8ca81448ab4a57447797d3ace540b7feed5e0271c2644ffe296fdbdef0b546549b9ef7d969bff5f4d98e487d3771dde8'
  '726b8934b144bf3a5ac1fc70a42a5da6d2dc47e939e1d63f35b6b05f2dd17b22977a94e42accd18b33d0cae22b9583b3008a0172efce95f457853eb96d7dcf1a')

prepare() {
  cd PowerShell

  # Change the default for POWERSHELL_TELEMETRY_OPTOUT to disable telemetry by default
  patch --strip=0 --input=../disable-telemetry.patch

  jq '.sdk.version = "10.0.0" | .sdk.rollForward = "feature"' global.json >_global.json
  mv _global.json global.json

  # Use nuget.org source
  patch --strip=1 --input=../nuget-source.patch

  # I couldn't find any way of silencing the very verbose warnings from
  # Microsoft.SourceLink other than to set the remote to a proper URL..
  git remote set-url origin "https://github.com/PowerShell/PowerShell.git"

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  # Replicating build.psm1:Start-PSBuild()
  ## Restore-PSPackage()
  dotnet restore src/powershell-unix -p:PublishReadyToRun=true

  dotnet restore src/TypeCatalogGen
  dotnet restore src/ResGen
  dotnet restore src/Modules
  dotnet restore src/Microsoft.PowerShell.GlobalTool.Shim

  dotnet restore test/tools/TestAlc
  dotnet restore test/tools/TestExe
  dotnet restore test/tools/UnixSocket
  dotnet restore test/tools/Modules

  dotnet restore test/tools/TestService -p:RuntimeIdentifiers=linux-x64
  dotnet restore test/tools/WebListener -p:RuntimeIdentifiers=linux-x64

  dotnet restore test/tools/NamedPipeConnection/src/code
}

build() {
  cd PowerShell

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  ## Start-ResGen()
  pushd src/ResGen
  dotnet run --no-restore
  popd

  ## Start-TypeGen()
  cp -t src/Microsoft.PowerShell.SDK/obj \
    "$srcdir/Microsoft.PowerShell.SDK.csproj.TypeCatalog.targets"

  local inc_file="$PWD/src/TypeCatalogGen/powershell_linux-x64.inc"
  dotnet msbuild \
    src/Microsoft.PowerShell.SDK \
    -t:_GetDependencies \
    -p:DesignTimeBuild=true \
    -p:_DependencyFile="$inc_file" \
    -nologo

  dotnet run \
    --no-restore \
    --project src/TypeCatalogGen \
    src/System.Management.Automation/CoreCLR/CorePsTypeCatalog.cs \
    "$inc_file"

  ## Publish PowerShell
  dotnet publish \
    --no-restore \
    --runtime linux-x64 \
    --no-self-contained \
    --configuration Release \
    --output lib \
    src/powershell-unix/

  ## Publish reference assemblies
  grep 'Microsoft.NETCore.App' "$inc_file" | sed 's/;//' | while read -r assembly; do
    install -Dm755 -t lib/ref "$assembly"
  done

  ## Restore-PSModuleToBuild()
  # The version numbers stem from src/Modules/PSGalleryModules.csproj and need to match the current release
  cp -a "$NUGET_PACKAGES/microsoft.powershell.archive/1.2.5/." lib/Modules/Microsoft.PowerShell.Archive
  cp -a "$NUGET_PACKAGES/microsoft.powershell.psresourceget/1.2.0/." lib/Modules/Microsoft.PowerShell.PSResourceGet
  cp -a "$NUGET_PACKAGES/packagemanagement/1.4.8.1/." lib/Modules/PackageManagement
  cp -a "$NUGET_PACKAGES/powershellget/2.2.5/." lib/Modules/PowerShellGet
  cp -a "$NUGET_PACKAGES/psreadline/2.4.5/." lib/Modules/PSReadLine
  cp -a "$NUGET_PACKAGES/microsoft.powershell.threadjob/2.2.0/." lib/Modules/Microsoft.PowerShell.ThreadJob
}

check() {
  cd PowerShell

  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  # Test contains a logic error
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27503
  rm test/powershell/Host/PSVersionTable.Tests.ps1

  # Test is broken on systems with UTC+2 or greater
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27500
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/ConvertTo-Json.Tests.ps1

  # Test is broken due to a logic error not considering timezone aliases
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27502
  rm test/powershell/Modules/Microsoft.PowerShell.Management/TimeZone.Tests.ps1

  # Test requires DSCv3 being installed
  # DSCv3 is available as an addon https://github.com/PowerShell/DSC
  rm test/powershell/dsc/dsc.profileresource.Tests.ps1

  # Test seems to have an incorrect default assembly lists for Linux
  # It complains about a bunch unexpected of assemblies being loaded,
  # but all are core dotnet ones. Likely a bug.
  rm test/powershell/Host/Startup.Tests.ps1

  # Test is dependent on the locale of the system
  # Breaks if culture is Invariant Language (Invariant Country)
  # this happens if LANG=C.UTF-8, which is the default in chroot builds
  # Upstream issue: https://github.com/PowerShell/PowerShell/issues/27532
  rm test/powershell/engine/Help/HelpSystem.Tests.ps1

  # Opens browser, skipping
  rm test/powershell/Language/Scripting/NativeExecution/NativeCommandProcessor.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Invoke-Item.Tests.ps1

  # Creates & leaves directories in $HOME, skipping
  rm test/powershell/Language/Parser/ParameterBinding.Tests.ps1
  rm test/powershell/Language/Scripting/ScriptHelp.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Add-Type.Tests.ps1
  rm test/powershell/Modules/Microsoft.PowerShell.Utility/Set-PSBreakpoint.Tests.ps1
  rm test/powershell/engine/Basic/Assembly.LoadFrom.Tests.ps1
  rm test/powershell/engine/Basic/Assembly.LoadNative.Tests.ps1

  # Creates a file named ~/.profile, skip
  rm test/powershell/Host/ConsoleHost.Tests.ps1

  # Attempts to create the USER_MODULES and SHARED_MODULES locations
  rm test/powershell/Modules/Microsoft.PowerShell.PSResourceGet/Microsoft.PowerShell.PSResourceGet.Tests.ps1

  # Runs Install-Script affecting the CurrentUser scope
  rm test/powershell/Modules/PowerShellGet/PowerShellGet.Tests.ps1

  # We disable telemetry by default, which the telemetry tests do not expect
  rm test/powershell/engine/Basic/Telemetry.Tests.ps1

  ## Restore-PSPester()
  unzip -ud temp_pester "$srcdir/pester.${_pesterversion}.nupkg"
  cp -a temp_pester/tools lib/Modules/Pester

  unzip -ud test/tools/Modules/SelfSignedCertificate \
    "$NUGET_PACKAGES/selfsignedcertificate/0.0.4/selfsignedcertificate.0.0.4.nupkg"

  dotnet publish \
    --no-restore \
    --configuration Debug \
    test/tools/TestAlc

  for project in TestExe TestService UnixSocket WebListener; do
    dotnet publish \
      --no-restore \
      --runtime linux-x64 \
      --self-contained \
      --configuration Debug \
      --output test/tools/$project/bin \
      test/tools/$project
    export PATH="$PATH:$PWD/test/tools/$project/bin/Debug/net10.0/linux-x64"
  done

  dotnet publish \
    --no-restore \
    --configuration Debug \
    --framework net10.0 \
    --output test/tools/Modules/Microsoft.PowerShell.NamedPipeConnection \
    test/tools/NamedPipeConnection/src/code
  install -Dm644 -t test/tools/Modules/Microsoft.PowerShell.NamedPipeConnection \
    test/tools/NamedPipeConnection/src/Microsoft.PowerShell.NamedPipeConnection.psd1

  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8

  # shellcheck disable=SC2016
  lib/pwsh -noprofile -command '
    $env:PSModulePath = "$(Get-Location)/test/tools/Modules:" + $env:PSModulePath
    Import-Module "Pester"
    Invoke-Pester -Show Header,Failed,Summary -EnableExit `
    -OutputFormat NUnitXml -OutputFile pester-tests.xml `
    -ExcludeTag @("Slow", "RequireSudoOnUnix") `
    -Tag @("CI", "Feature") `
    "test/powershell"
    '
}

package() {
  cd PowerShell

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$pkgname-$pkgnum"
  cp -a -t "$pkgdir/usr/lib/$pkgname-$pkgnum" lib/*

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname-$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
