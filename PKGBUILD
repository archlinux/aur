# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164
# shellcheck shell=bash

pkgname=powershell-dsc
pkgver=3.3.0
pkgrel=1
pkgdesc="DSCv3 is the latest iteration of Microsoft's Desired State Configuration platform."
arch=(x86_64)
url='https://github.com/PowerShell/DSC'
license=(MIT)
depends=(glibc libgcc bash)
makedepends=(git cargo tree-sitter-cli nodejs protobuf powershell)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('69cc660042669c5bc78235ed918be49a2e845c6f091c152838fda5f62516dca801e592fbb6bc7182c67cf2eac85702c82e77fe2098e727583cbd60164071c479')
b2sums=('62942c4c671e536467a8c1cf6f5c0a0e329e9ba8a2481367d96aa1bef42698703b76660108e9412796dbf07c53be3ff7934c0b56f22c339a9c8bcf0f832375ca')
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
