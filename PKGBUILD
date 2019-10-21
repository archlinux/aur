# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=pcsxr-pgxp-git
pkgver=1.9.94.r1731.62467b86
pkgrel=1
pkgdesc='A Sony PlayStation (PSX) emulator based on the PCSX-df Project with Parallel/Precision Geometry Transform Pipeline'
arch=('x86_64')
url='http://ngemu.com/threads/pcsxr-pgxp.186369/'
license=('GPL')
depends=('ffmpeg' 'gtk3' 'libarchive' 'libcdio' 'libxv')
makedepends=('cmake' 'git' 'intltool' 'mesa')
provides=('pcsxr' "${pkgname/%-git/}")
conflicts=('pcsxr' "${pkgname/%-git/}")
source=("${pkgname/%-git/}::git+https://github.com/iCatButler/pcsxr.git"
        'fix-pango.patch')
sha256sums=('SKIP'
            '40298efe5f3137fa6926a1315d2299ef1b311ec365674d63578235bb00f2e454')

pkgver() {
  cd "${pkgname/%-git/}"
  printf "1.9.94.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname/%-git/}"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  patch -p1 -i "$srcdir"/fix-pango.patch
}

build() {
  cd "${pkgname/%-git/}"/build
  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DSND_BACKEND='sdl' \
    -DENABLE_CCDDA='ON' \
    -DUSE_LIBARCHIVE='ON' \
    -DUSE_LIBCDIO='ON'
  make
}

package() {
  cd "${pkgname/%-git/}"/build
  make DESTDIR="$pkgdir" install
}
