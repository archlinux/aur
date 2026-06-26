# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname="powershell-editor-services"
pkgver=4.7.0
pkgrel=1
pkgdesc='A common platform for PowerShell development support in any editor or application'
url="https://github.com/PowerShell/PowerShellEditorServices"
arch=('any')
license=('MIT')
_dotnetsdkver='8.0'
depends=('powershell' 'dotnet-runtime-'"$_dotnetsdkver" 'aspnet-runtime-'"$_dotnetsdkver")
makedepends=(
  'aspnet-targeting-pack-'"$_dotnetsdkver"
  'dotnet-sdk-'"$_dotnetsdkver"
  'git'
)
install="$pkgname.install"
source=("git+$url.git#tag=v$pkgver")
options=('!debug')
sha512sums=('c9408c3462334a6fd6f78ae793b8483dd550ad3918cac969bf78a6e1d753820ece6d57536770eb929ce029c8dc644d770b3ec84c417af8f04da212b366a948ac')
b2sums=('94bbeb6af2cef3feed161759ff732370ef34929235220c5b827263493dfe405de1afe56032738367aeb0160defa8fa3012d77d7fd676d14576b2699f38e2b5fd')

prepare() {
  set -x
  mkdir -p "$srcdir"/build-modules
  # Identify required modules for the build and download them
  required_modules="$(grep "#Requires -Modules @{ModuleName = " "$srcdir"/PowerShellEditorServices/PowerShellEditorServices.build.ps1)"
  while IFS= read -r line; do
    # shellcheck disable=SC2001
    module_name="$(echo "$line" | sed 's/.*ModuleName = "\([^"]*\).*/\1/')"
    # shellcheck disable=SC2001
    module_version="$(echo "$line" | sed 's/.*ModuleVersion = "\([^"]*\).*/\1/')"
    pwsh -noprofile -command 'Save-PSResource -Name '"$module_name"' -Version '"$module_version"' -Repository PSGallery -TrustRepository -Path '"$srcdir"'/build-modules'
  done <<<"$required_modules"

  # Update global.json to match with the current SDK
  sdk8ver=$(dotnet --list-sdks | grep -F "$_dotnetsdkver" | sed "s/ .*$//")
  dotnet new globaljson --sdk-version "$sdk8ver" --roll-forward latestFeature -v q
  cp "$srcdir"/global.json "$srcdir"/PowerShellEditorServices

  # Disable self-contained deployment
  # shellcheck disable=SC2016
  sed -i -e 's/dotnet publish/dotnet publish --self-contained false/g' "$srcdir"/PowerShellEditorServices/PowerShellEditorServices.build.ps1
}

build() {
  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    Get-ChildItem '"$srcdir"'/build-modules/ | ForEach-Object { Import-Module $_ }
    Set-Location '"$srcdir"'/PowerShellEditorServices
    Invoke-Build -Task Build -Configuration Release
  '
}

check() {
  # Only run the TestPS74 subset.
  # Full tests, i.e. -Task Test or TestFull include very long running CI tests.
  # shellcheck disable=SC2016
  pwsh -noprofile -command '
    Get-ChildItem '"$srcdir"'/build-modules/ | ForEach-Object { Import-Module $_ }
    Set-Location '"$srcdir"'/PowerShellEditorServices
    Invoke-Build -Task TestPS74 -Configuration Release
  '
}

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/PowerShellEditorServices/module" "$pkgdir/opt/$pkgname"

  install -Dm644 "$srcdir/PowerShellEditorServices/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
