# Maintainer: Score_Under <seejay 11@gmail com>
options=(!strip)  # Don't strip libs because there aren't any
DOC_DIRS=(opt/hydrus/help)

pkgname=hydrus
_pkgname=hydrus
pkgver=523.1
pkgrel=1
pkgdesc="Danbooru-like image tagging and searching system for the desktop"
arch=(any)
license=(WTFPL)
install=hydrus.install
conflicts=(hydrus-docs hydrus-sources)
url=http://hydrusnetwork.github.io/hydrus/
depends=(python python-opencv python-beautifulsoup4 python-yaml
         'python-lz4>=0.10.1' python-numpy python-twisted python-pillow
         python-pysocks python-psutil python-send2trash python-html5lib
         python-requests python-qtpy emoji-font python-mpv
         python-service-identity fmt pyside6)
makedepends=(git)
optdepends=('ffmpeg: show duration and other information on video thumbnails'
            'miniupnpc: automatic port forwarding'
            'desktop-file-utils: to add Hydrus to your desktop environment menus'
            'python-cloudscraper: bypass cloudflare "checking your browser" challenges'
            'python-pyqt6-charts: display bandwidth usage charts'
            'python-pyopenssl: to generate certificates for accessing client API and server via HTTPS')
source=("${_pkgname}::git+https://github.com/hydrusnetwork/${_pkgname}.git#commit=245a885eef4a5718fc30fb9c68c31886e7c996a2"
        paths-in-opt.patch
        hydrus-client
        hydrus-server
        hydrus.desktop)
sha256sums=('SKIP'
            'f34b3cbe1ee548975f98b339200e79c95ab1482c8e96636e9a27db4ee8ade27a'
            'd2cb826ce0dd1892ab95fc3b14dbe6bd312210f653d0aea31938eeb7e361fdc5'
            '463841cc16059b516cc327cfbc30d3383e2236b085ba2d503e82f5be39444806'
            '9b8c2603a8040ae80152ff9a718ad3e8803fdc3029a939e3c0e932ea35ded923')

_tweak_package_add_docs() {
    # Check if the user has skipped doc builds. Added by popular request.
    # Note: this is called at the end of the PKGBUILD before any other
    # functions are executed.
    if check_option docs n; then
        warning "Skipping $pkgname documentation build; this will break the help menu and report inaccurate --printsrcinfo."
        return
    fi

    makedepends+=('mkdocs>=1.3.0' mkdocs-material 'pymdown-extensions>=9.4')
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 < ../paths-in-opt.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  msg 'Compiling .py files...'
  python -OO -m compileall -fq .

  if check_option docs y; then
    msg 'Building documentation...'
    mkdocs build -d help
  fi
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Create /opt/hydrus and copy hydrus files to there
  install -m755 -d "${pkgdir}/opt/hydrus"
  cp -r hydrus static client.pyw server.py "${pkgdir}/opt/hydrus/"
  if check_option docs y; then
     cp -r help "${pkgdir}/opt/hydrus/"
  fi

  # Remove unit tests
  rm -rf "${pkgdir}/opt/hydrus/hydrus/test" "${pkgdir}/opt/hydrus/static/testing"

  # Create and populate /opt/hydrus/bin
  install -d -m755 "${pkgdir}/opt/hydrus/bin"
  ln -s /usr/bin/upnpc "${pkgdir}/opt/hydrus/bin/upnpc_linux"
  ln -s /usr/bin/ffmpeg "${pkgdir}/opt/hydrus/bin/ffmpeg"

  # Install hydrus-client and hydrus-server executables
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 ../hydrus-{client,server} "${pkgdir}/usr/bin/"

  # Install .desktop shortcut
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 ../hydrus.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install license files
  install -d -m755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -m644 license.txt "${pkgdir}/usr/share/licenses/${_pkgname}/"
}

# Tests (they don't pass!)
# makedepends+=(python-httmock)
# check() {
#   cd "${srcdir}/${_pkgname}"
#   python -m unittest discover -s hydrus/test -p 'Test*.py'
# }

_tweak_package_add_docs
