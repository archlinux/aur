# Maintainer: Christoph Haag <christoph.haag@collabora.co.uk>

pkgname=xorg-xlease-git
pkgver=r5.fae00e3
pkgrel=1
pkgdesc="lease an X output for another DRM application"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('xorg-server')
makedepends=('meson' 'ninja')
groups=('xorg-apps' 'xorg')
source=(git://people.freedesktop.org/~keithp/xlease)
sha512sums=('SKIP')

pkgver() {
  cd "xlease"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/xlease"
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd "${srcdir}/xlease"
  DESTDIR="${pkgdir}" ninja -C build install

  # manual installation of man page. autotools does this, but meson doesn't :/
  install -d "$pkgdir"/usr/share/man/man1/
  install "$srcdir"/xlease/xlease.1 "$pkgdir"/usr/share/man/man1/
  cd "$pkgdir"/usr/share/man/man1/
  gzip xlease.1
}
