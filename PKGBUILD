# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>
# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=python-pywikibot-git
pkgver=6.3.0.r92.gd4e930c09d
pkgrel=2
epoch=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python python-setuptools git)
install=install
source=("$pkgname::git+https://gerrit.wikimedia.org/r/pywikibot/core.git" user-config.py)
sha256sums=(SKIP 6a6251e826e7ebcef77dcd57f528c6262fb974594a2d53686cec5412d984cf78)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package_python-pywikibot-git() {
  depends=(python python-requests)
  optdepends=("python-mwparserfromhell: improved parser, mandatory - choose and install one of the parsers"
              "python-wikitextparser: improved parser, mandatory - choose and install one of the parsers")
  provides=(python-pywikibot)
  conflicts=(python-pywikibot)

  cd "$srcdir/$pkgname"
  python setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/python-pywikibot" user-config.py
}
