# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=dotnet-powershellstandard-library
_nugetid=PowerShellStandard.Library
pkgver=5.1.1
pkgrel=1
pkgdesc="Reference assembly for PowerShell modules that run on Windows PowerShell 5.1 and PowerShell 7 (NuGet package)"
arch=('any')
url='https://github.com/PowerShell/PowerShellStandard'
license=('MIT')
_dotnetsdkver="10.0"
makedepends=(
  dotnet-sdk-"$_dotnetsdkver"
  dotnet-source-build-reference-packages
  git
)
checkdepends=(
  powershell
  powershell-pester-4
)
# The commit of the 5.1.1 release ("release 5.1.1 - which adds an assembly for net452"), upstream
# doesn't tag. The later commits only change documentation and the template, before master moves on to
# PowerShell Standard 7.
_commit="b69d5e6a5107287a5981db515bae4d5631278f76"
source=("git+$url.git#commit=$_commit"
  "invoke-tests.ps1")
sha512sums=('e06ea3440792c4c7ad1cffa48cfff9f11434edc88344b200b1f4aa828d2fd0a81e5ff57f9b20f22838e74cec8997f23a88c559adc07ca355443b37e5fe3b447d'
            'c031d359563d2551e48e61d4373450c2047492465ec3becee39c7279c2c14a59ba5c80eaf5b005090ad84529e6a1816d991a57eb5b9333ae29b71b7b8f9a09df')
b2sums=('88d59ba95cf513d89e59dab0a1e7869c2dd7f28e8073160335689c5f685325be210039875504f992778a00fef531b6fc00d8b2744e6ff8b3ab5c4289e15433c1'
        '55f0889ec1ddc893f155f9bf972d606d28b4b2620cd489a59698cdcfad3fc4ccb40499cb1133cbdb48ad2d298c88f4809d6281090364eace573c54a9ab6eccf4')

_dotnet_env() {
  export NUGET_PACKAGES="$srcdir/nuget"
  export DOTNET_CLI_HOME="$srcdir/dotnet-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  # The repository information usually comes from git, which would find the repository this PKGBUILD
  # is in instead
  _build_arguments=(
    --configuration Release
    -p:SourceRevisionId="$_commit"
    -p:EnableSourceControlManagerQueries=false
  )
}

prepare() {
  cd PowerShellStandard || exit
  # NETStandard.Library and the System.* reference packages come from dotnet-source-build-reference-packages
  cat >nuget.config <<EOF
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="dotnet-source-build-reference-packages" value="/usr/share/dotnet/source-build-reference-packages" />
  </packageSources>
</configuration>
EOF
  # Only for .NET Standard: the .NET Framework 4.5.2 build would need its reference assemblies, and is
  # only used by Windows PowerShell. Public signed with the key in the repository, giving it the same
  # strong name as upstream's. The packages it compiles against in the versions the reference packages
  # have; System.Security.SecureString and System.Security.Principal are part of .NET Standard 2.0. The
  # nuspec's file name differs in case.
  sed -i -E \
    -e 's|<TargetFrameworks>netstandard2.0;net452</TargetFrameworks>|<TargetFramework>netstandard2.0</TargetFramework>|' \
    -e 's|<DelaySign>True</DelaySign>|<PublicSign>True</PublicSign>|' \
    -e 's|(Include="System.IO.FileSystem.AccessControl" Version=)"[^"]*"|\1"5.0.0"|' \
    -e 's|(Include="System.Security.AccessControl" Version=)"[^"]*"|\1"6.0.0"|' \
    -e 's|(Include="System.Security.Permissions" Version=)"[^"]*"|\1"6.0.0"|' \
    -e '/Include="System.Security.(SecureString|Principal)"/d' \
    -e 's|PowershellStandard.Library.nuspec|PowerShellStandard.Library.nuspec|' \
    src/5/System.Management.Automation-lib.csproj
  sed -i '/net452/d' src/5/PowerShellStandard.Library.nuspec

  # The tests compare the types with the PowerShell running them, which no longer has some: PowerShell 7
  # removed the workflow job proxies (PowerShell/PowerShell#10083, #9618), and powershell's
  # cim-windows-only.patch the CIM type adapter
  # shellcheck disable=SC2016
  sed -i 's/-difference \$asmT /-difference ($asmT | Where-Object { $_ -notin @("System.Management.Automation.JobDataAddedEventArgs", "System.Management.Automation.PSChildJobProxy", "System.Management.Automation.PSJobProxy", "System.Management.Automation.Runspaces.PSSessionType", "Microsoft.PowerShell.Cim.CimInstanceAdapter") }) /' \
    test/5/core/PSS5.Tests.ps1
}

build() {
  _dotnet_env
  cd PowerShellStandard || exit
  dotnet pack src/5/System.Management.Automation-lib.csproj "${_build_arguments[@]}" --output "$srcdir/nupkg"
}

check() {
  _dotnet_env
  # The tests of the release files (test/Build.Tests.ps1) list the .NET Framework build as well
  HOME="$srcdir/home" pwsh -NoProfile -NonInteractive -File "$srcdir/invoke-tests.ps1" -Path "$srcdir/PowerShellStandard"
}

package() {
  install -Dm644 "$srcdir/nupkg/$_nugetid.$pkgver.nupkg" -t "$pkgdir/usr/share/dotnet/nuget-packages/"
  install -Dm644 PowerShellStandard/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
