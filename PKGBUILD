# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="xf86-input-libinput"
pkgname="${_basename}-xlibre"
pkgver=1.5.0
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput (built against XLibre)"
arch=('aarch64' 'x86_64')
url="http://xorg.freedesktop.org"
license=('MIT')
depends=('glibc' 'libinput')
makedepends=('libx11' 'libxi' 'xlibre-server-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
provides=("${_basename}")
conflicts=("${_basename}" 'xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xorg-drivers-xlibre')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://xorg.freedesktop.org/releases/individual/driver/${_pkgsrc}.tar.xz"
        "${_pkgsrc}.tar.xz.sig::https://xorg.freedesktop.org/releases/individual/driver/${_pkgsrc}.tar.xz.sig")
sha512sums=('03090beb7c162fdf55e9bb9da41ffb8601b20047e4a53895bad27de47b3197fc920e710f26fa23e7322b367ab65fa56ba5f9a195ec69801529af3958632c2d6e'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./configure \
    --prefix='/usr' \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${_basename}/COPYING"
}
