# Maintainer: Martin Schulze <spam.martin.schulze at gmx dot de>

pkgname=livekeys
pkgver=1.6.1
pkgrel=1
pkgdesc="Computer vision coding environment that displays results in real time"
arch=('x86_64')
url="https://github.com/live-keys/${pkgname}"
license=('LGPL3')
depends=("opencv" "qt5-quickcontrols" "qt5-websockets")
makedepends=("qt5-base" "python-bcolz")
source=("livekeys-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"https://github.com/livecv/live-pm/archive/master.zip"
        "livekeys.patch")
sha256sums=('dce9e6b78a068b57ca8dd2a565c21c378effa710634af6e74c5dc0bb94c57f84'
            'bcbd550e744ee7a77dadbae265a66c8646108062cdd79836f1eb4a3b1d56d2cd'
            'c9bd85f5cde78a312e44ea70ce3ca124bcd50e5eded978071038691169f617c3')
provides=('livekeys')

export_LK_BUILDDIR() {
  export  LK_BUILDDIR="${srcdir}/livekeys-${pkgver}/build"
}

prepare () {
  export_LK_BUILDDIR
  mkdir -p "${LK_BUILDDIR}"
  cp -r "${srcdir}/live-pm-master/"* "${LK_BUILDDIR}" 
  pip3 install -r "${LK_BUILDDIR}/requirements.txt" --user
  pushd livekeys-${pkgver}
  patch -p0 < ../livekeys.patch
  popd
  # stitch together a faked qt build folder
  mkdir -p fake-qt
  pushd fake-qt
  DEFAULT_QT_DIR=/usr/lib/qt
  # for plugins (and the rest?)
  for folder in $(ls -1 "$DEFAULT_QT_DIR"); do
    ln -sfn "${DEFAULT_QT_DIR}/$folder" "$folder"
  done
  # for qmake
  ln -sfn /usr/bin bin
  # for libQt5*.so*
  ln -sfn /usr/lib lib
}

build() {
  export_LK_BUILDDIR
  cd "${LK_BUILDDIR}"
  export QTDIR="${srcdir}/fake-qt"
  export OPENCV_DIR=/usr/lib
  python3 livepm/main.py build .. gcc_64
  python3 livepm/main.py deploy .. gcc_64
}

package() {
  export_LK_BUILDDIR
  cd "${srcdir}/livekeys-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/lib/livekeys"
  mkdir -p "${pkgdir}/usr/lib/livekeys/link"

  cp "${LK_BUILDDIR}/gcc_64/bin/lib"*.so "${pkgdir}/usr/lib/"
  cp -r "${LK_BUILDDIR}/gcc_64/bin/"* "${pkgdir}/usr/lib/livekeys/"

  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/editor/libeditor.so" "${pkgdir}/usr/lib/livekeys/link/libeditor.so"
  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/lcvcore/liblcvcore.so" "${pkgdir}/usr/lib/livekeys/link/liblcvcore.so"
  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/lcvfeatures2d/liblcvfeatures2d.so" "${pkgdir}/usr/lib/livekeys/link/liblcvfeatures2d.so"
  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/lcvimgproc/liblcvimgproc.so" "${pkgdir}/usr/lib/livekeys/link/liblcvimgproc.so"
  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/lcvphoto/liblcvphoto.so" "${pkgdir}/usr/lib/livekeys/link/liblcvphoto.so"
  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/lcvvideo/liblcvvideo.so" "${pkgdir}/usr/lib/livekeys/link/liblcvvideo.so"
  ln -r -s "${pkgdir}/usr/lib/livekeys/plugins/live/liblive.so" "${pkgdir}/usr/lib/livekeys/link/liblive.so"

  ln -r -s "${pkgdir}/usr/lib/livekeys/livekeys" "${pkgdir}/usr/bin/livekeys"
}
