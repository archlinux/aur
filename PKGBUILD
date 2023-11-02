# Maintainer: Martin Schulze <spam.martin.schulze at gmx dot de>

pkgname=livekeys
pkgver=1.9.1
pkgrel=1
pkgdesc="Computer vision coding environment that displays results in real time"
arch=('x86_64')
url="https://github.com/live-keys/${pkgname}"
license=('LGPL3')
depends=("opencv" "qt5-quickcontrols" "qt5-websockets")
makedepends=("qt5-base" "python-pipx")
source=("livekeys-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"https://github.com/livecv/live-pm/archive/master.zip")
sha256sums=('6b4869697dfbd416cfac352f273fd8a0c18d00b8afa8904e5b44451b617d5f43'
            'f8b9aeda707e80bc81d0c2aad0a37eb85bb886ba5a59d68daac98310a8ccf772')
provides=('livekeys')

export_LK_BUILDDIR() {
  export  LK_BUILDDIR="${srcdir}/livekeys-${pkgver}/build"
  VENV_PATH=${LK_BUILDDIR}/.venv
}

prepare () {
  export_LK_BUILDDIR
  mkdir -p "${LK_BUILDDIR}"
  cp -r "${srcdir}/live-pm-master/"* "${LK_BUILDDIR}" 
  pushd "${LK_BUILDDIR}"
  python -m venv "$VENV_PATH"
  "$VENV_PATH/bin/pip" install -r requirements.txt
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
  "$VENV_PATH/bin/python3" livepm/main.py build .. gcc_64
  "$VENV_PATH/bin/python3" livepm/main.py deploy .. gcc_64
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
