# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.32.0
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
sha512sums=('5bf24c28ec66a7ac1a0c9ee976521d825d4c2f8abbbeb59c7ac55e89db10dde6ebb643d238d217d636d79fda363244558fee1effe8c5e8c573c1a3e957fe391f'
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
