# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-chess
pkgver=0.1.0
pkgrel=1
pkgdesc="Chess for a Linux phone, with an opponent that thinks on a clock"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT' 'CC-BY-4.0')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
# python-cairo is not optional here the way it nearly is elsewhere: the board is
# a drawing area, so every square and every piece on screen is drawn from a
# Python draw function, and without pycairo GTK cannot hand that function a
# context at all. Habits loses a ring it can live without; this loses the board.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo')
source=("$url/releases/download/chess-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('647d996143061e989c7ab83bd42160bffd4e57a6ac8f7bc2bf86351aec24c3e0')

# Two licences, because the pieces are not ours: the six outlines in
# moarchy_chess/pieces.py are Font Awesome Free's chess icons under CC BY 4.0,
# which is an attribution licence and is attributed in the About dialog, the
# README and the file itself. Everything else is MIT.
#
# The source tarball is assembled by packaging/release.sh from two subtrees of
# one tag -- apps/chess and shared -- so it holds this app and the shared code
# it uses and nothing else. That is what lets a monorepo keep per-app versions:
# `git archive <tag>:<subdir>` means one repo does not mean one version number.
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
  # The rules, the pieces, the search and the file. All four are deliberately
  # GTK-free, so they run in a build chroot; the widget tests skip themselves
  # without a display, which a chroot does not have. scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_chess/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_chess/"

  # The shared code is vendored into this package rather than being a package of
  # its own. The store reports what an app costs in packages and megabytes onto
  # a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-chess"

  install -Dm644 data/org.moarchy.Chess.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Chess.desktop"
  install -Dm644 data/org.moarchy.Chess.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Chess.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
