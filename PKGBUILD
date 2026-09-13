# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-vitals
pkgver=0.1.0
pkgrel=1
pkgdesc="A task manager for a Linux phone: processor, memory, tasks and network"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
#
# python-cairo is not optional: the processor graph, the network graph and the
# per-core bars are draw functions, not widgets, and without pycairo GTK cannot
# hand them a context at all. What is left is an app of labels with three empty
# rectangles in it -- which is exactly how Habits came to ship screenshots with
# no ring in them, from a container that did not have it.
#
# Nothing else. Everything this app reports is read out of /proc and /sys, which
# is in the kernel rather than in a package: no procps, no lm_sensors, no
# psutil. That is a deliberate dependency decision and not a coincidence -- the
# store measures what an app costs onto a stock image, and this one costs the
# GUI stack the phone already has.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo')
source=("$url/releases/download/vitals-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d199df2f268d68f3ab717bc1ee6cea19bc355401c509eda2ab4cb112c47b2f3d')

# The source tarball is assembled by packaging/release.sh from two subtrees of
# one tag -- apps/vitals and shared -- so it holds this app and the shared code
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
  # Every file format the app reads, against machines written by hand in
  # tests/fixtures.py. That is the whole reason nothing in sysinfo.py imports
  # gi: a build chroot has no display, and the arithmetic that decides what the
  # app reports needs none. The widget tests skip themselves without one;
  # scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_vitals/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_vitals/"

  # The shared code is vendored into this package rather than being a package of
  # its own. The store reports what an app costs in packages and megabytes onto
  # a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-vitals"

  install -Dm644 data/org.moarchy.Vitals.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Vitals.desktop"
  install -Dm644 data/org.moarchy.Vitals.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Vitals.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
