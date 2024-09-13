# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.28.1
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux (32-bit)"
arch=('x86_64')
url="https://linuxtv.org/"
provides=("lib32-libv4l=$pkgver")
replaces=('lib32-libv4l')
conflicts=('lib32-libv4l')
license=('LGPL')
depends=($_pkgbasename 'lib32-gcc-libs' 'lib32-libjpeg-turbo' 'lib32-systemd' 'lib32-libglvnd' 'lib32-json-c')
makedepends=('meson' 'clang' 'lib32-libbpf')
source=(https://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.xz
        https://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.xz.asc)
validpgpkeys=('05D0169C26E41593418129DF199A64FADFB500FF') # Gregor Jasny <gjasny@googlemail.com>
sha512sums=('6493c97f59af5fe0ffa4bb815ebac4531f5ea2b0612c2035c7f00a888ce686ee0aeeaef982553ff9ad6441c39dac63e6c718b1bedb0541cb2ce2e3c2f91ab12f'
            'SKIP')

prepare() {
  # HACK: inform upstream to make this configurable
  cd "${_pkgbasename}-${pkgver}"
  sed -i 's/sbin/bin/' utils/v4l2-dbg/meson.build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson  -Dgconv=disabled -Ddoxygen-doc=disabled -Dqv4l2=disabled -Dqvidcap=disabled \
    "${_pkgbasename}-${pkgver}" build --libdir=/usr/lib32
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,lib}
}
