# Maintainer: Lance G. <gero3977 at gmail dot com>
# Contributor: Danct12 <danct12@disroot.org>
pkgname=osk-sdl
pkgver=0.67
pkgrel=2
pkgdesc="SDL2 On-screen Keyboard for FDE"
arch=(x86_64)
url="https://gitlab.com/postmarketOS/osk-sdl"
license=('GPL3')
depends=(device-mapper cryptsetup sdl2 sdl2_ttf mesa ttf-dejavu libglvnd)
makedepends=(scdoc meson)
_commit="41f67e26b8e8466c0613ea51ff602c19e01c7009" # include 0.67 and fixes
source=(git+https://gitlab.com/postmarketOS/osk-sdl.git#commit=${_commit}
        osk-sdl-hooks
        osk-sdl-install)

build() {
  arch-meson "$pkgname"  _build
  meson compile -C _build
}

package() {
  DESTDIR="$pkgdir" meson install --no-rebuild -C _build

  # DejaVu is on a different directory than default
  sed -i 's/\/usr\/share\/fonts\/ttf-dejavu/\/usr\/share\/fonts\/TTF/g' ${pkgdir}/etc/osk.conf

  # Install initramfs
  install -Dm644 ${srcdir}/osk-sdl-hooks ${pkgdir}/usr/lib/initcpio/hooks/osk-sdl
  install -Dm644 ${srcdir}/osk-sdl-install ${pkgdir}/usr/lib/initcpio/install/osk-sdl
}

md5sums=('SKIP'
         '9727164078e40cb57f4cd7344d6871b1'
         '0bee876e2268bd2a270058f0093179c6')
