# Maintainer: Simon Schubert <simon@librem.one>
#
# Vitals as an app: the QML tree in /usr/share/moarchy-vitals, started by
# /usr/bin/moarchy-vitals. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same task manager in
# QML, and the Python stack it depended on is no longer needed by it.
pkgname=moarchy-vitals
pkgver=0.2.0
pkgrel=1
pkgdesc='A task manager: processor, memory, storage, battery and network, and what is using them, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see, so it calls this dependency unneeded -- as
# it does quickshell, for the same reason. Everything the app reports is read
# out of /proc and /sys by one sh and one awk a tick, plus df for the size of a
# filesystem; coreutils, gawk and procps-ng's kill are in every base install.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/vitals at the
# tag, not GitHub's generated archive of the whole repository.
source=("$url/releases/download/vitals-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('59184efc4d32970354755b8b8bc80955ed69ad44339e4feff7956e8947eed71e')

# Deliberately a versioned package rather than a -git one. mobileomarchy pins
# each package by a commit; for a VCS package that pin governs the packaging and
# says nothing about the code makepkg then clones at HEAD, so "pinned" would
# read as reproducible without being it. A tarball with a checksum makes the pin
# name the exact code, and gives pacman a version it can compare for upgrades.
#
# The source is a release asset built with `git archive`, not GitHub's
# auto-generated archive: those are produced on demand, and a change to the
# compression GitHub uses has broken every checksum pinned against them before.
# The checksum is pinned in the commit after the tag, as every app's here is.

check() {
  cd "$pkgname-$pkgver"
  # The parsers, against /proc text written by hand. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 manifest.json ./*.qml ./*.js icon.svg \
    "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/moarchy-vitals "$pkgdir/usr/bin/moarchy-vitals"
  install -Dm644 org.moarchy.Vitals.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Vitals.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Vitals.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
