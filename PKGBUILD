# Maintainer: Anton Karasev <uselessfire at gmail dot com>

pkgname=plasma6-applets-battery-chargelimit
_repo=plasma-battery-chargelimit
_id=org.kde.plasma.battery.chargelimit
pkgver=6.7.5.1
pkgrel=1
pkgdesc='The stock Plasma 6 Power & Battery applet with a switch for the battery charge limit'
arch=(any)
url="https://github.com/uselessfire/$_repo"
license=('LGPL-2.0-or-later AND GPL-2.0-or-later')
# The owners of the QML modules the applet imports, and UPower, which switches the limit.
# The applet is taken from this Plasma version, so it needs at least that one; there is
# no upper bound not to hold Plasma updates back, a new Plasma may need a new release.
depends=(
  kcmutils
  kconfig
  kcoreaddons
  kirigami
  kitemmodels
  knotifications
  ksvg
  kwindowsystem
  libplasma
  'plasma-workspace>=6.7'
  'powerdevil>=6.7'
  qt6-declarative
  'upower>=1.90.10'
)
install=$pkgname.install
source=("$_repo-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Filled in by updpkgsums when the package is released; the copy in the project
# repository has SKIP.
sha256sums=('a88e6ce3036ebd4373a8c4c74e4edf9bedc1cef0f94a251054a4a5a0c371d667')

package() {
  local plasmoid="$pkgdir/usr/share/plasma/plasmoids/$_id"
  install -d "${plasmoid%/*}" "$pkgdir/usr/share/locale"
  cp -rT --no-preserve=mode "$_repo-$pkgver/package" "$plasmoid"
  # Moved, not copied: Plasma prefers the catalogs in the plasmoid, which would bypass
  # NoExtract in pacman.conf, while /usr/share/locale is where KDE packages keep theirs
  mv "$plasmoid/contents/locale"/* "$pkgdir/usr/share/locale/"
  rmdir "$plasmoid/contents/locale"
}
