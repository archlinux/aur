# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=xournalpp-mobile-git
_pkgname=xournalpp-mobile
_gitname=xournalpp_mobile
pkgver=1.1.10.r6.ga64432f
pkgrel=2
pkgdesc="A port of the main features of Xournal++ to various Flutter platforms like Android, iOS and the Web."
arch=('x86_64' 'arm')
url="https://xournal.online/"
license=('custom:EUPL-1.2')
depends=('gtk3' 'xdg-user-dirs')
makedepends=('git' 'flutter-group-pacman-hook' 'flutter-beta' 'cmake' 'ninja' 'clang')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.com/TheOneWithTheBraid/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_gitname}"

  flutter config --enable-linux-desktop
}

build() {
	cd "$srcdir/${_gitname}"
	flutter build linux
}

package() {
	cd "$srcdir/${_gitname}"

 # install
  install -dm755 ${pkgdir}/opt
  mv build/linux/x64/release/bundle ${pkgdir}/opt/${_pkgname}

  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # icon
  install -dm755 "${pkgdir}/usr/share/icons"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -Dm 644 build/flutter_assets/assets/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -Dm 644 build/flutter_assets/assets/${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png

  # desktop entry
  install -dm755 ${pkgdir}/usr/share/applications
  install -Dm644 "linux/${_pkgname}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
