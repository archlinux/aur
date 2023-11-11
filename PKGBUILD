# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=qcma-git
pkgver=0.4.1.13.g65f0eab
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita. (GIT version)"
arch=('x86_64')
url='https://github.com/codestation/qcma'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Network.so libQt5Sql.so
  'libnotify' 'libnotify.so'
  'libvitamtp' # libvitamtp.so
  'libx11' # libX11.so
  'libva' 'libva-drm.so' 'libva-x11.so' 'libva.so'
  'libvdpau' 'libvdpau.so'
  'glib2' 'libgobject-2.0.so'
  'bzip2' 'libbz2.so'
  'xz' 'liblzma.so'
  'zlib' 'libz.so'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'qt5-tools'
)
conflicts=(
  'qcma-appindicator-git'
  'qcma-kdenotifier-git'
)
source=(
  'git+https://github.com/codestation/qcma.git'
  'https://ffmpeg.org/releases/ffmpeg-3.4.13.tar.xz'
  'mathops_fix.patch::https://git.videolan.org/?p=ffmpeg.git;a=patch;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd qcma
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  patch -d ffmpeg-3.4.13 -p1 -i "${srcdir}/mathops_fix.patch"
}

build() {

  cd ffmpeg-3.4.13
  ./configure \
    --prefix="${srcdir}/fakeroot" \
    --enable-libpulse \
    --enable-indev=alsa,pulse,oss,fbdev \
    --enable-outdev=alsa,pulse,oss,fbdev \
    --disable-programs \
    --disable-doc
  make
  make install

  cd "${srcdir}/build"
  export PKG_CONFIG_LIBDIR="${srcdir}/fakeroot/lib/pkgconfig"
  export PKG_CONFIG_PATH="${PKG_CONFIG_LIBDIR}:/usr/lib/pkgconfig:/usr/share/pkgconfig"
  lrelease-qt5 ../qcma/common/resources/translations/*.ts
  qmake-qt5 ../qcma PREFIX=/usr
  make
}

package() {
  make -C build INSTALL_ROOT="${pkgdir}" install
}
