# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.30.1
pkgrel=2
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
sha512sums=('b34ff9a233da9cb5a569cb5a6fcee288216277eb6f2f6e83c75e717422c1440f58da5e4f4c557b95a11f7650bbacc603c79edaa7451c277398aebf9c232761b3'
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
  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin,lib},etc}
}
