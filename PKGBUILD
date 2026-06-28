# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

pkgname=powershell-dsc
pkgver=3.2.2
pkgrel=1
pkgdesc="DSCv3 is the latest iteration of Microsoft's Desired State Configuration platform."
arch=(x86_64)
url='https://github.com/PowerShell/DSC'
license=(MIT)
depends=(glibc libgcc bash)
makedepends=(git cargo tree-sitter-cli nodejs protobuf powershell)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('e6959738351f28c3dc58871c9ced225bb6b0bd1186f9602c2c56a9b6c051016517dbe29dd3688c5fc4acc27600fc648b1ad534f20082bf2df9843134c0780d9c')
b2sums=('c7b435ed73f40575e8515308a705a303850cb471d0d40f9cf8154020910150f0a89a2c9be8125ff6e3b19b15352f8790b4336549ab6ebf6df2216205dc2404f2')
options=('!lto' '!debug')

prepare() {
  # Upstream uses a private registry
  # We need to delete this to use the usual crates.io
  rm "$pkgname"/.cargo/config.toml
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable

  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    Import-Module ./helpers.build.psm1
    $BuildData = Import-DscBuildData -RefreshProjects
    Export-GrammarBinding -Project $BuildData.Projects
    $buildParams = @{
      Project = $BuildData.Projects
      Release = $true
    }
    Build-RustProject @buildParams
    Copy-BuildArtifact @buildParams -ExecutableFile $BuildData.PackageFiles.Executable | Out-Null
  '
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable

  # Doesn't seem to account for pwsh.profile.dsc.resource.json being shipped with PowerShell
  rm dsc/tests/dsc_extension_discover.tests.ps1

  # Test seems not to have been updated, at least it doesn't expect that dsc intentionally warns about relative paths
  rm dsc/tests/dsc_adapter.tests.ps1

  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    if(-not (Test-Path pwsh-modules -PathType Container)) {
      New-Item -Type Directory -Name pwsh-modules | Out-Null
    }
    $modulefolder = Resolve-Path pwsh-modules
    $env:PSModulePath = "${modulefolder}:${env:PSModulePath}" 
    $required_modules = "Pester", "YaYaml", "PSToml"
    foreach($module in $required_modules) {
      Save-PSResource -Name $module -Repository PSGallery -TrustRepository -Path $modulefolder
      Import-Module $module
    }
    Import-Module ./helpers.build.psm1
    $BuildData = Import-DscBuildData -RefreshProjects
    $releaseopt = @{ Release=$true }
    Update-PathEnvironment @releaseopt
    $commonParams = @{ Project = $BuildData.Projects }

    Test-RustProject @commonParams @releaseopt
    Test-ProjectWithPester @commonParams -Group @("dsc", "adapters", "extensions", "grammars", "resources")
  '
}

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/DSC"
  install -dm755 "$pkgdir/usr/lib/powershell-7/Modules"

  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    Import-Module ./helpers.build.psm1
    $BuildData = Import-DscBuildData -RefreshProjects
    $commonParams = @{
      Release = $true
    }
    $artifactDirectory = Get-ArtifactDirectoryPath @commonParams
    foreach($file in $BuildData.PackageFiles.Linux) {
      $dest = ($file -eq "psDscAdapter/") ? (Join-Path "/usr/share/powershell/Modules" $file) : "/usr/lib/DSC"
      $prefixdest = Join-Path '"$pkgdir"' $dest
      $currentfile = Get-Item (Join-Path $artifactDirectory.Bin $file)
      Copy-Item -LiteralPath $currentfile.FullName -Destination $prefixdest -Recurse -ErrorAction Stop
      if(($currentfile -is [System.IO.FileInfo]) -and ($currentfile.UnixMode -match "x")) {
        $symlinkdest = Join-Path '"$pkgdir"' "/usr/bin/$file"
        New-Item -Type SymbolicLink -Path $symlinkdest -Target (Join-Path $dest $file) | Out-Null
      }
    }
  '

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
