# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-breakout
pkgver=0.1.0
pkgrel=1
pkgdesc="Breakout for a Linux phone, with a bat that follows your thumb"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
# python-cairo is not optional here the way it nearly is elsewhere: the field is
# one drawing area repainted sixty times a second, and every brick, the bat and
# the ball are drawn from a Python draw function. Without pycairo GTK cannot
# hand that function a context at all, and there is nothing left of the app.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo')
source=("$url/releases/download/breakout-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e82cef60ed6acd37c67dd8c4ac115965e44be4d520c806117311d9f04ef75984')

# The source tarball is assembled by packaging/release.sh from two subtrees of
# one tag -- apps/solitaire and shared -- so it holds this app and the shared
# code it uses and nothing else. That is what lets a monorepo keep per-app
# versions: `git archive <tag>:<subdir>` means one repo does not mean one
# version number.
#
# Deliberately a versioned package rather than a -git one. mobileomarchy pins
# each package by a commit; for a VCS package that pin governs the packaging and
# says nothing about the code makepkg then clones at HEAD, so "pinned" would
# read as reproducible without being it. A tarball with a checksum makes the pin
# name the exact code, and gives pacman a version it can compare for upgrades.
#
# The source is a release asset built with `git archive`, not GitHub's
# auto-generated archive: those are produced on demand, and a change to the
# compression GitHub uses has broken every checksum pinned against them before.

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # The world and the file. Both are deliberately GTK-free, so they run in a
  # build chroot -- which is where the physics is checked, by playing whole
  # levels through with a bat that follows the ball: a ball that tunnels through
  # a brick is a bug no screenshot can show. The widget tests skip themselves
  # without a display, which a chroot does not have. scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_breakout/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_breakout/"

  # The shared code is vendored into this package rather than being a package of
  # its own. The store reports what an app costs in packages and megabytes onto
  # a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-breakout"

  install -Dm644 data/org.moarchy.Breakout.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Breakout.desktop"
  install -Dm644 data/org.moarchy.Breakout.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Breakout.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
