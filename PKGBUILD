# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-coins
pkgver=0.1.0
pkgrel=1
pkgdesc="A coin tracker for a Linux phone: the top hundred, and the ones you star"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
#
# Note what is NOT here. There is no python-cairo, because nothing in this app
# is drawn: no graph, no sparkline, no coin logo, so every figure on screen is a
# label and the whole app is stock widgets. Vitals needs pycairo and says why in
# its own PKGBUILD; an app that copied that line without needing it would be a
# package the store has to account for on a stock image.
#
# There is no python-requests either. The one network call this app makes is a
# GET of a JSON document, which urllib in the standard library does -- and the
# store reports what an app costs in packages onto a stock image, so a
# dependency for `requests.get` would be a cost with nothing behind it.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
source=("$url/releases/download/coins-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2d38512b57af41796fe6aa168cef85a83de701076403857361a086515d51c8ce')

# The source tarball is assembled by packaging/release.sh from two subtrees of
# one tag -- apps/coins and shared -- so it holds this app and the shared code it
# uses and nothing else. That is what lets a monorepo keep per-app versions:
# `git archive <tag>:<subdir>` means one repo does not mean one version number.
#
# Deliberately a versioned package rather than a -git one, and a release asset
# rather than GitHub's auto-generated archive. Both arguments are in
# apps/vitals/PKGBUILD in full; neither is any different here.

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # Parsing somebody else's JSON and writing our own file, against records
  # written by hand in tests/. That is the whole reason nothing in market.py or
  # store.py imports gi: a build chroot has no display, and neither the shape of
  # an answer nor the format of a price needs one. Nothing here opens a socket
  # either -- the one class that would is driven through a stand-in for urlopen,
  # because a build must not depend on CoinGecko being up. The widget tests skip
  # themselves without a display; scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_coins/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_coins/"

  # The shared code is vendored into this package rather than being a package of
  # its own. The store reports what an app costs in packages and megabytes onto
  # a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-coins"

  install -Dm644 data/org.moarchy.Coins.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Coins.desktop"
  install -Dm644 data/org.moarchy.Coins.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Coins.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
