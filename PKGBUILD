# Maintainer: Midoo <ahmedmoselhi55@gmail.com>

pkgname=xdman8-beta-git
_pkgname=xdman
pkgver=8.0.16.r294.c0eeb69
pkgrel=1
pkgdesc="Open source download accelerator and video downloader."
arch=(x86_64)
url=https://xtremedownloadmanager.com
license=(GPL3)
depends=(ffmpeg 'gtk3>=3.22.0' hicolor-icon-theme)
makedepends=(dotnet-host dotnet-sdk gendesk git)
provides=("$pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
source=("$_pkgname"::git+https://github.com/subhra74/xdm.git#branch=feature/8.0.1
        git+https://github.com/subhra74/xdm-helper-chrome.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  local _ver="$(grep -Pio "_vers.*\b.*\d+\.[[:alnum:]\.]+" app/XDM/XDM.Core/AppInfo.cs | grep -Pio '\d+\.[[:alnum:]\.]+')"
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list "$(git rev-list --tags --no-walk --max-count=1)"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

prepare() {
  gendesk -f -n --name='Xtreme Download Manager' --comment="${pkgdesc/.}" --custom='Keywords=download;internet;manager;' --exec=/opt/"$_pkgname"/xdm-app --icon=/opt/"$_pkgname"/xdm-logo.svg --terminal=false --categories='Network' --startupnotify=false --pkgname="$_pkgname"
}

package() {
  install -dm 755 "$pkgdir"/{opt/"$_pkgname",usr/share/applications}
  dotnet publish -c Release -f net6.0 -r linux-x64 "$_pkgname"/app/XDM/XDM.Gtk.UI/XDM.Gtk.UI.csproj -o "$pkgdir"/opt/"$_pkgname"
  dotnet publish -c Release -f net6.0 -r linux-x64 "$_pkgname"/app/XDM/XDM.App.Host/XDM.App.Host.csproj -o "$pkgdir"/opt/"$_pkgname"/XDM.App.Host
  cp -dr --no-preserve='ownership' xdm-helper-chrome/chrome/chrome-extension "$pkgdir"/opt/"$_pkgname"/
  cp -dr --no-preserve='ownership' xdm-helper-chrome/ext-loader "$pkgdir"/opt/"$_pkgname"/
  install -m 644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/
}
