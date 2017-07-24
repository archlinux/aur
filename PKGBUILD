# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm-git
_pkgname=bterm
pkgver=v1.0.0.r10.8b9d9f2
pkgrel=1
pkgdesc="cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/bleenco/bterm"
license=('MIT')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
makedepends=('git' 'npm' "libicns" "dpkg")
source=("bterm-git::git+$url.git"
        "$_pkgname.desktop")
sha256sums=('SKIP'
            '38ed1e551459aa69afd86f432168f0488bf88e16b727e6d2c0962a18b6bbe565')

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, tags available
printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname}"
  npm install
  npm run app:linux
}

package() {
	cd "$srcdir/${pkgname}"
  appdir=/usr/lib/$_pkgname
  install -d "$pkgdir/usr/bin/"
  local _icon_dir="usr/share/icons/hicolor"
  install -d "${pkgdir}"${appdir}
  cp -r dist/bterm-linux-x64/* "${pkgdir}"${appdir}
  for size in  32 512; do
        install -Dm644 \
            assets/icon_${size}x${size}.png \
            "${pkgdir}"/$_icon_dir/${size}x${size}/apps/${pkgname}.png
      done
ln -s /usr/lib/bterm/bterm $pkgdir/usr/bin/$_pkgname
install -Dm644 assets/icon.svg $pkgdir/$_icon_dir/scalable/apps/$pkgname.svg

 msg2 "  -> Installing .desktop file..."
  install -Dm644 ../../bterm.desktop $pkgdir/usr/share/applications/bterm.desktop
}
