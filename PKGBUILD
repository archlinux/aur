# Submitter: Steffen Weber <boenki-gmx-de>
# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=ffdiaporama
_pkgdir="ffDiaporama"
pkgver=2.1
pkgrel=5
pkgdesc='application for creating video sequences consisting of photos, movies, music'
arch=(x86_64)
url=http://ffdiaporama.tuxfamily.org
license=(GPL2)
depends=('ffmpeg2.1' 'sdl' 'sdl_mixer' 'qt6-base' 'qt6-tools' 'qt6-svg' 'sqlite' 'exiv2' 'taglib')
provides=(

)
makedepends=(
  gcc
)
#http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_bin_2.1.2014.0209.tar.gz
source=('https://sourceforge.net/projects/ffdiaporama/files/ffdiaporama_bin_2.1.2014.0209.tar.gz'
        'exiv2_0-28_fix.patch'
        'ffdiaporama_2.1-1.diff.gz'
        )
md5sums=('f9f46277153cf49f6947973778516adb'
         'SKIP'
         'SKIP'
         )

options=('debug')

prepare() {
  #cd "$pkgname-pkgver"
  cd "$_pkgdir"
  pwd
  echo "${srcdir}"
  #patch --forward --strip=1 --input="${srcdir}/patchfile.patch"
  patch --forward --strip=1 --input="${srcdir}/exiv2_0-28_fix.patch"
  patch --forward --strip=1 --input="${srcdir}/ffdiaporama_2.1-1.diff"
  #patch -p1 < "${srcdir}/ffdiaporama_2.1-1.diff"
  #patch ${srcdir}/ffDiaporama/src/ffDiaporama/wgt_QMultimediaBrowser/QCustomFolderTable.cpp ${startdir}/patchfile.patch
}

build() {
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib/ffmpeg2.1:/opt/lib
  export LD_LIBRARY_PATH
  cd "$_pkgdir"
  sed -i 's@GTK;GNOME;Qt;KDE;AudioVideo;@AudioVideo;Player;X-Red-Hat-Base;@g' ffDiaporama.desktop
  qmake6 'QMAKE_CFLAGS_ISYSTEM=-I' 'INCLUDEPATH += /opt/include/ffmpeg2.1 /opt/include' 'LIBPATH += /opt/lib/ffmpeg2.1 /opt/lib' ffDiaporama.pro PREFIX=/usr
  
  make "-j$(nproc)" || return 1
}

package() {
  cd "$_pkgdir"
  make INSTALL_ROOT="$pkgdir" install
}
