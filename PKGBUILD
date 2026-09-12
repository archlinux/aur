# Maintainer: Simon Schubert <simon@librem.one>
pkgname=moarchy-keep
pkgver=0.1.1
pkgrel=1
pkgdesc="Text notes and checklists for a Linux phone, kept on the device"
arch=('any')
url="https://github.com/SimonSchubert/moarchy-apps"
license=('MIT')
# Pure Python, so arch=any. The GUI stack is all runtime, nothing is compiled.
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
source=("$url/releases/download/keep-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9786ab25aca6980ea68efd7578af1ae8aed7b5fecac76b5c99a674e8a8c5eebd')

# The source tarball is assembled by packaging/release.sh from two subtrees of
# one tag -- apps/keep and shared -- so it holds this app and the shared code it
# uses and nothing else. That is what lets a monorepo keep per-app versions:
# `git archive <tag>:<subdir>` means one repo does not mean one version number.
#
# Deliberately a versioned package rather than a -git one. mobileomarchy pins
# each AUR package by the AUR repo's commit; for a VCS package that pin governs
# the packaging and says nothing about the code makepkg then clones at HEAD, so
# "pinned in manifest.toml" would read as reproducible without being it. A
# tarball with a checksum makes the pin name the exact code, and gives pacman a
# version it can actually compare for upgrades.
#
# The source is a release asset built with `git archive`, not GitHub's
# auto-generated archive: those are produced on demand, and a change to the
# compression GitHub uses has broken every checksum pinned against them before.
# An uploaded file is stored verbatim and its checksum cannot move under us.

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # The storage layer only. The widget tests skip themselves without a display,
  # which a build chroot does not have; scripts/check.sh runs those.
  PYTHONPATH=. python3 -m unittest discover -s tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Deliberately NOT site-packages. That path is Python-version-specific
  # (/usr/lib/python3.13/site-packages), and this is an arch=any package: the
  # version that built it would be baked in, so a Python minor bump would break
  # every installed copy until rebuilt. A private dir on sys.path is immune.
  install -Dm644 moarchy_keep/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_keep/"

  # The shared code is vendored into this package rather than being a package
  # of its own. The store reports what an app costs in packages and megabytes
  # onto a stock image, and a second package for two hundred lines of palette
  # arithmetic is a cost with nothing behind it. One source copy in the repo,
  # one self-contained package here, no runtime coupling between apps.
  install -Dm644 moarchy_ui/*.py -t "$pkgdir/usr/lib/$pkgname/moarchy_ui/"

  install -Dm755 launcher "$pkgdir/usr/bin/moarchy-keep"

  install -Dm644 data/org.moarchy.Keep.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Keep.desktop"
  install -Dm644 data/org.moarchy.Keep.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Keep.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
