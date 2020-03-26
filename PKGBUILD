# Maintainer: Score_Under <seejay 11@gmail com>
options=(!strip)  # Don't strip libs because there aren't any
DOC_DIRS=(opt/hydrus/help)

pkgbase=hydrus
pkgname=(hydrus)
pkgver=390.b
pkgrel=2
pkgdesc="Danbooru-like image tagging and searching system for the desktop"
arch=(any)
license=(WTFPL)
install=hydrus.install
conflicts=(hydrus-docs hydrus-sources)
url=http://hydrusnetwork.github.io/hydrus/
depends=(python opencv python-beautifulsoup4 python-yaml
         'python-lz4>=0.10.1' python-numpy python-twisted python-pillow
         python-pysocks python-psutil python-send2trash python-html5lib
         python-requests hdf5 python-pyqt5 python-qtpy qt5-charts
         python-pyopenssl emoji-font python-mpv)
makedepends=(git)
optdepends=('ffmpeg: show duration and other information on video thumbnails'
            'miniupnpc: automatic port forwarding'
            'desktop-file-utils: to add Hydrus to your desktop environment menus'
            )
source=("${pkgbase}::git+https://github.com/hydrusnetwork/${pkgbase}.git#commit=2f2ebb3957b825829e5da7136494d457d23f240f"
        paths-in-opt.patch
        hydrus-client
        hydrus-server
        hydrus.desktop)
sha256sums=('SKIP'
            'c6802327827cf77acefa8cdff1b9b45097e4754349ef187d94695f4095ef34dd'
            '7b0dbc6f38f9aaff409e435ba807199575166976b52715d6b54418f89dbde634'
            '463841cc16059b516cc327cfbc30d3383e2236b085ba2d503e82f5be39444806'
            '9b8c2603a8040ae80152ff9a718ad3e8803fdc3029a939e3c0e932ea35ded923')

prepare() {
  cd "$pkgbase"
  git apply < ../paths-in-opt.patch

  # Remove unit tests
  rm -f "hydrus/Test"*.py
  rm -rf "static/testing"
}

build() {
  cd "$pkgbase"

  msg 'Compiling .py files...'
  python -OO -m compileall -fq .
}

package_hydrus() {
  cd "$pkgbase"

  # Create /opt/hydrus and copy hydrus files to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r help hydrus static client.pyw server.py "${pkgdir}/opt/hydrus/"

  # Create and populate /opt/hydrus/bin
  install -d -m755 "${pkgdir}/opt/hydrus/bin"
  ln -s /usr/bin/upnpc "${pkgdir}/opt/hydrus/bin/upnpc_linux"
  ln -s /usr/bin/ffmpeg "${pkgdir}/opt/hydrus/bin/ffmpeg"

  # Install hydrus-client and hydrus-server executables
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 ../hydrus-{client,server} "${pkgdir}/usr/bin/"

  # Install .desktop shortcut
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 ../hydrus.desktop "${pkgdir}/usr/share/applications/${pkgbase}.desktop"

  # Install license files
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgbase}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/"
  install -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgbase}/"
}
