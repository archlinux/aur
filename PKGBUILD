# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-fiveletters
pkgver=0.1.0
pkgrel=1
pkgdesc="A five-letter word a day for a Linux phone, with its own keyboard"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
# python-cairo is not optional here the way it nearly is elsewhere: the board is
# one drawing area, and all thirty tiles -- the letters on them, the marks in
# their corners and the flip that turns them over -- are drawn from a Python
# draw function. The keyboard is real buttons and would survive; the board would
# not, and the board is the game.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo')
source=("$url/releases/download/fiveletters-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8056449deb7d2b13eac6bf1291cfe486e70d3a8b02362e0a9c49d3fe8e793225')

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
  # The rules, the word lists and the file. All three are deliberately GTK-free,
  # so they run in a build chroot -- which is where the word lists are checked
  # as word lists: every answer five letters, every answer a legal guess, and no
  # blank lines. The widget tests skip themselves without a display, which a
  # chroot does not have. scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_fiveletters/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_fiveletters/"

  # The shared code is vendored into this package rather than being a package of
  # its own. The store reports what an app costs in packages and megabytes onto
  # a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  # The word lists go in /usr/share rather than next to the module, because they
  # are data: they are the same bytes on every architecture and every Python,
  # and `words.py` looks for them in a checkout first so that running from
  # source uses the tree's own copy rather than whichever one is installed.
  install -Dm644 data/answers.txt data/guesses.txt data/NOTICE.md \
    -t "$pkgdir/usr/share/$pkgname/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-fiveletters"

  install -Dm644 data/org.moarchy.FiveLetters.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.FiveLetters.desktop"
  install -Dm644 data/org.moarchy.FiveLetters.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.FiveLetters.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
