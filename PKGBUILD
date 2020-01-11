# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>
# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=(python-pywikibot-git python2-pywikibot-git)
pkgbase=python2-pywikibot-git
pkgver=3.0.20190430.r326.g32b5f40e6d
pkgrel=1
epoch=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=(any)
url=https://www.mediawiki.org/wiki/Manual:Pywikibot
license=(MIT)
makedepends=(python python-requests python-setuptools python2 python2-enum34 python2-ipaddr python2-pathlib2 python2-requests python2-setuptools git)
source=(pywikibot-$pkgver::git+https://gerrit.wikimedia.org/r/pywikibot/core.git)
sha256sums=(SKIP)

prepare() {
  cd "$srcdir"
  cp -a pywikibot-$pkgver{,-py2}
}

pkgver() {
  cd "$srcdir/pywikibot-$pkgver"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/pywikibot-$pkgver"
  python setup.py build

  cd "$srcdir/pywikibot-$pkgver-py2"
  python2 setup.py build
}

package_python-pywikibot-git() {
  depends=(python python-requests)
  optdepends=("python-mwparserfromhell-git: improved parser")
  provides=(python-pywikibot)
  conflicts=(python-pywikibot)

  cd "$srcdir/pywikibot-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-pywikibot-git() {
  depends=(python2 python2-requests python2-ipaddr python2-pathlib2 python2-enum34)
  optdepends=("python2-mwparserfromhell: improved parser")
  provides=(python2-pywikibot)
  conflicts=(python2-pywikibot)

  cd "$srcdir/pywikibot-$pkgver-py2"
  python2 setup.py install --optimize=1 --root="$pkgdir/" --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
