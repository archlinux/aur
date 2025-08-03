# Maintainer: fenuks

_pkgver=0.22
_pkgrel=06
_file=gtk-wave-cleaner-${_pkgver}-${_pkgrel}
pkgname=gwc
pkgver=${_pkgver}_${_pkgrel}
pkgrel=2
pkgdesc="Gtk Wave Cleaner is a digital audio editor to denoise, dehiss and amplify audio files"
arch=("i686" "x86_64")
url="http://gwc.sourceforge.net/"
license=("GPL")
depends=("libsndfile" "gtk2" "fftw")
optdepends=("vorbis-tools: for ogg export"
            "lame: for mp3 export")
makedepends=("make")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
source=("https://github.com/AlisterH/gwc/releases/download/${_pkgver}-${_pkgrel}/${_file}.tar.gz")
sha256sums=('0c5e58c195ac2aff5822703796a136d1cff5fffd1e5d787eddbae98ebf179854')

prepare() {
    cd "${srcdir}/${_file}"
    ./configure --prefix=/usr
}

build() {
    cd "${srcdir}/${_file}"
    # CFLAGS cannot be set during configure because they are not passed when building e.g. dmacheps
    CFLAGS="$(sed -n "/^CFLAGS = /s/CFLAGS = //p" Makefile)"
    make -j1 CFLAGS="${CFLAGS} -std=gnu17 -Wno-implicit-function-declaration -Wno-int-conversion -Wno-incompatible-pointer-types"
}

package() {
    cd "${srcdir}/${_file}"
    make DESTDIR="${pkgdir}/" install
    rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
