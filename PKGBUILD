# Submitter: Steffen Weber <boenki-gmx-de>
# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=ffdiaporama
_pkgdir="ffDiaporama"
pkgver=2.1
pkgrel=3
pkgdesc='application for creating video sequences consisting of photos, movies, music'
arch=(x86_64)
url=http://ffdiaporama.tuxfamily.org
license=(GPL2)
depends=('ffmpeg2.1' 'sdl' 'sdl_mixer' 'qt5-base' 'qt5-tools' 'qt5-svg' 'sqlite' 'qt5-imageformats' 'exiv2' 'taglib')
provides=(

)
makedepends=(
  gcc
)
source=('http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_bin_2.1.2014.0209.tar.gz'
        'patchfile.patch'
        'cBaseMediaFile.cpp.patch'
        )
md5sums=('f9f46277153cf49f6947973778516adb'
         '6269400e6c9805f57ddb0202035cc7c7'
         'SKIP'
         )

options=('debug')

prepare() {
  #cd "$pkgname-pkgver"
  cd "$_pkgdir"
  patch --forward --strip=1 --input="${srcdir}/patchfile.patch"
  patch --forward --strip=1 --input="${srcdir}/cBaseMediaFile.cpp.patch"
  #patch ${srcdir}/ffDiaporama/src/ffDiaporama/wgt_QMultimediaBrowser/QCustomFolderTable.cpp ${startdir}/patchfile.patch
}

build() {
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib/ffmpeg2.1:/opt/lib
  export LD_LIBRARY_PATH
  cd "$_pkgdir"
  sed -i 's@GTK;GNOME;Qt;KDE;AudioVideo;@AudioVideo;Player;X-Red-Hat-Base;@g' ffDiaporama.desktop
  qmake-qt5 'QMAKE_CFLAGS_ISYSTEM=-I' 'INCLUDEPATH += /opt/include/ffmpeg2.1 /opt/include' 'LIBPATH += /opt/lib/ffmpeg2.1 /opt/lib' ffDiaporama.pro PREFIX=/usr
  
  make "-j$(nproc)" || return 1
}

package() {
  cd "$_pkgdir"
  make INSTALL_ROOT="$pkgdir" install
}
