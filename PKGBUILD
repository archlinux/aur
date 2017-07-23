# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm-git
_pkgname=bterm
pkgver=v1.0.0.r2.255e6a3
pkgrel=1
pkgdesc="cross-platform terminal emulator"
arch=('x86_64' 'i686')
url="https://github.com/bleenco/bterm"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm') 
source=("bterm-git::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, tags available
printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname}"
  npm install
  npm run dist
}

package() {
	cd "$srcdir/${pkgname}"
  appdir=/usr/lib/$_pkgname
  install -d "$pkgdir/usr/bin/"
  local _icon_dir="usr/share/icons/hicolor"
  install -d "${pkgdir}"${appdir}
  cp -r build/linux-unpacked/* "${pkgdir}"${appdir}
  for size in  32 512; do
        install -Dm644 \
            assets/icon_${size}x${size}.png \
            "${pkgdir}"/$_icon_dir/${size}x${size}/apps/${pkgname}.png
      done
ln -s /usr/lib/bterm/bterm $pkgdir/usr/bin/$_pkgname
install -Dm644 assets/icon.svg $pkgdir/$_icon_dir/scalable/apps/$pkgname.svg
}
