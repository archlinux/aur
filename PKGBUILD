# Maintainer: Iaroslav Sorokin <iaroslav.sorokin@gmail.com>

pkgname=mingw-w64-libadwaita
pkgver=1.3.0
pkgrel=1
pkgdesc='Building blocks for modern GNOME applications.'
arch=('any')
url='https://gitlab.gnome.org/GNOME/libadwaita/-/tree/libadwaita-1-3/'
license=('LGPL-2.1+')
makedepends=(
  'git'
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-meson'
)
depends=(
  'mingw-w64-glib2>=2.72.0'
  'mingw-w64-gtk4>=4.9.5'
)
options=('!strip' '!buildflags' 'staticlibs')
source=("$pkgname-$pkgver::git+https://gitlab.gnome.org/GNOME/libadwaita.git#branch=libadwaita-1-3")
sha256sums=('SKIP')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
    cd "${srcdir}/${pkgname}-$pkgver"

    # Removing lines with stack protector flags (does not link)
    # sed -i '88,94d' meson.build

    for _arch in "${_architectures[@]}"; do
        mkdir -p "build-${_arch}"
        cd "build-${_arch}"
        "${_arch}-meson" \
            --default-library both \
            -Dintrospection=disabled
        ninja
        cd ..
    done
}

package() {
    cd "${srcdir}/${pkgname}-$pkgver"

    for _arch in "${_architectures[@]}"; do
        cd "build-${_arch}"
        DESTDIR="${pkgdir}" ninja install
        find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
        find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
        find "${pkgdir}/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
        cd ..
    done
}

