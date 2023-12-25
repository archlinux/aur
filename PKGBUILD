# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.26.1
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
sha512sums=('a3b12b311977afec410db8b430696e923a24e04f003a5891cc77ddeb667d0b98666a06d31a439c95ce57d9e9c9c2593c5e9dd9e7cf2be002adb95db5b8f00ac8'
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
