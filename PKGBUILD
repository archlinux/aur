# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-habits
pkgver=0.1.2
pkgrel=1
pkgdesc="Habit tracking for a Linux phone, kept on the device"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
# python-cairo is for the today-ring, which is drawn rather than laid out.
# It is already on the phone image, so it adds nothing there -- but an
# undeclared dependency does not fail, it just silently draws nothing, which
# is how the ring came to be missing from every screenshot taken in a
# container that did not have it.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo')
source=("$url/releases/download/habits-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('52d2a8ae1ef4595330262ce6fd84a45dc130caf68aa7c755b4edfc4dc525f7e4')

# The source tarball is assembled by packaging/release.sh from two subtrees of
# one tag -- apps/habits and shared -- so it holds this app and the shared code
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
  # The storage layer and every date calculation in it. The widget tests skip
  # themselves without a display, which a build chroot does not have;
  # scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_habits/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_habits/"

  # The shared code is vendored into this package rather than being a package of
  # its own. The store reports what an app costs in packages and megabytes onto
  # a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-habits"

  install -Dm644 data/org.moarchy.Habits.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Habits.desktop"
  install -Dm644 data/org.moarchy.Habits.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Habits.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
