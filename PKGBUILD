# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Ted Alff <twa022 at gmail dot com>
pkgname=touchpad-indicator-git
pkgver=2.2.3.ubuntu20.04.0.r128.97cdae5
pkgrel=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://github.com/atareao/Touchpad-Indicator"
license=('GPL3')
depends=('gdk-pixbuf2' 'libappindicator-gtk3' 'libnotify' 'lsb-release' 'librsvg'
         'python-xlib' 'python-pyudev' 'python-dbus' 'python-evdev' 'xorg-xinput')
makedepends=('git' 'dpkg')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/atareao/Touchpad-Indicator.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(dpkg-parsechangelog --show-field Version | sed 's/-/./')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

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
  cd "$srcdir/${pkgname%-git}"
  while read _in _out ; do
    mkdir -p "$pkgdir/$_out/"
    install -m644 ${_in} "$pkgdir/$_out/"
  done < debian/install
  chmod 755 "$pkgdir/usr/bin/${pkgname%-git}"
  chmod -R 755 \
    "$pkgdir"/{usr/lib/systemd/system-sleep,usr/share/"${pkgname%-git}",etc/pm/sleep.d}
  ./make_translations.sh
}
