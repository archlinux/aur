# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian-git
pkgver=r7209.fd0ddab4
pkgrel=1
pkgdesc='Ebook, audiobook and magazine collection manager for newsgroup and torrent users'
arch=(i686 x86_64)
url='https://gitlab.com/LazyLibrarian/LazyLibrarian/'
license=('GPL-3.0-or-later')
depends=(
  apprise
  bash
  python
  python-apscheduler
  python-beautifulsoup4
  python-certifi
  python-charset-normalizer
  python-cherrypy
  python-cherrypy-cors
  python-cryptography
  python-dateutil
  python-deluge-client
  python-google_trans_new
  python-html5lib
  python-httpagentparser
  python-httplib2
  python-idna
  python-irc
  python-iso639-lang
  python-jaraco.stream
  python-levenshtein
  python-lxml
  python-magic
  python-mako
  python-markupsafe
  python-pillow
  python-portend
  python-pyopenssl
  python-pyparsing
  python-pypdf
  python-rapidfuzz
  python-requests
  python-setuptools
  python-six
  python-slskd-api
  python-soupsieve
  python-standard-cgi
  python-thefuzz
  python-tzdata
  python-urllib3
  python-webencodings
  python-xmltodict
  python-yaml
  unrar
)
makedepends=(git)
provides=(lazylibrarian)
conflicts=(lazylibrarian)
install=lazylibrarian.install
source=(
  'git+https://gitlab.com/LazyLibrarian/LazyLibrarian.git'
  lazylibrarian.service
  lazylibrarian.sysusers
  lazylibrarian.tmpfiles
)

sha256sums=('SKIP'
            'b2a04e1184c4e592187e32fbeb30b8c95742951b809814971f830bd2c05e0fc2'
            '4bfc8d0836e328ed28ef28f366e8e367f7b39b85f472ae9d34012c8b749bf6fd'
            '6cddd4de91618e5ee62b15916bcb623b612dfdf1ddcef7b3aa74d3eb62587604')

# prepare() {
#   cd LazyLibrarian
# }

pkgver() {
  cd LazyLibrarian
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/lazylibrarian"
  cp -dpr --no-preserve=ownership LazyLibrarian/* "${pkgdir}/usr/lib/lazylibrarian"
  rm -rf "${pkgdir}/usr/lib/lazylibrarian/init"
  rm -rf "${pkgdir}/usr/lib/lazylibrarian/LazyLibrarian.app"
  rm -rf "${pkgdir}/usr/lib/lazylibrarian/unittests"
  rm "${pkgdir}/usr/lib/lazylibrarian/ISSUE_TEMPLATE.md"
  rm "${pkgdir}/usr/lib/lazylibrarian/README.md"
  rm "${pkgdir}/usr/lib/lazylibrarian/UNITTESTING.md"

  python -m compileall "${pkgdir}/usr/lib/lazylibrarian"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/lazylibrarian/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 lazylibrarian.service "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
  install -Dm644 lazylibrarian.sysusers "${pkgdir}/usr/lib/sysusers.d/lazylibrarian.conf"
  install -Dm644 lazylibrarian.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/lazylibrarian.conf"
}
