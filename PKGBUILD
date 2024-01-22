# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Ted Alff <twa022 at gmail dot com>
pkgname=touchpad-indicator-git
pkgver=2.2.3.ubuntu20.04.0.r137.86064c7
pkgrel=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://github.com/atareao/Touchpad-Indicator"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libappindicator-gtk3'
  'libnotify'
  'lsb-release'
  'librsvg'
  'python-xlib'
  'python-pyudev'
  'python-dbus'
  'python-evdev'
  'xorg-xinput'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/atareao/Touchpad-Indicator.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
    sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 }

prepare() {
  cd "${pkgname%-git}"

  # Install locales to correct directory
  find . -type f -exec \
    sed -i -e 's:locale-langpack:locale:g' '{}' \;

  # Create a script to install the translations from the debian rules file
  grep -A 1000 "Create languages directories" debian/rules | \
    grep -B 1000 "End comile languages" | \
    sed "s:\${CURDIR}/debian/touchpad-indicator:\"$pkgdir\":g" > make_translations.sh
  chmod +x make_translations.sh
}

package() {
  cd "${pkgname%-git}"
  while read _in _out ; do
    mkdir -p "$pkgdir/$_out/"
    install -m644 ${_in} "$pkgdir/$_out/"
  done < debian/install
  chmod 755 "$pkgdir/usr/bin/${pkgname%-git}"
  chmod -R 755 \
    "$pkgdir"/{usr/lib/systemd/system-sleep,usr/share/"${pkgname%-git}",etc/pm/sleep.d}
  ./make_translations.sh
}
