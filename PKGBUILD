# Submitter: Steffen Weber <boenki-gmx-de>
# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=ffdiaporama
_pkgdir="ffDiaporama"
pkgver=2.1
pkgrel=2
pkgdesc='application for creating video sequences consisting of photos, movies, music'
arch=(x86_64)
url=http://ffdiaporama.tuxfamily.org
license=(GPL2)
depends=('ffmpeg21' 'sdl' 'sdl_mixer' 'qt5-base' 'qt5-tools' 'qt5-svg' 'sqlite' 'qt5-imageformats' 'exiv2' 'taglib')
provides=(

)
makedepends=(
  gcc
)
source=('http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_bin_2.1.2014.0209.tar.gz'
        'patchfile.patch')
md5sums=('f9f46277153cf49f6947973778516adb'
         '6269400e6c9805f57ddb0202035cc7c7')

prepare() {
  #cd "$pkgname-pkgver"
  cd "$_pkgdir"
  patch --forward --strip=1 --input="${srcdir}/patchfile.patch"
  #patch ${srcdir}/ffDiaporama/src/ffDiaporama/wgt_QMultimediaBrowser/QCustomFolderTable.cpp ${startdir}/patchfile.patch
}

build() {
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ffmpeg21/lib:/opt/lib
  export LD_LIBRARY_PATH
  cd "$_pkgdir"
  sed -i 's@GTK;GNOME;Qt;KDE;AudioVideo;@AudioVideo;Player;X-Red-Hat-Base;@g' ffDiaporama.desktop
  qmake-qt5 'QMAKE_CFLAGS_ISYSTEM=-I' 'INCLUDEPATH += /opt/ffmpeg21/include' 'LIBPATH += /opt/ffmpeg21/lib' ffDiaporama.pro PREFIX=/usr
  
  make "-j$(nproc)" || return 1
}

package() {
  cd "$_pkgdir"
  make INSTALL_ROOT="$pkgdir" install
}
