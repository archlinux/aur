# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributer: Térence Clastres <t dot clastres at gmail dot com>
pkgname=gnome-shell-extension-gsconnect-git
pkgver=62.r5.gb97d58f
pkgrel=1
pkgdesc="KDE Connect implementation with GNOME Shell integration"
arch=('any')
url="https://github.com/GSConnect/gnome-shell-extension-gsconnect"
license=('GPL-2.0-or-later OR MPL-2.0')
depends=('gnome-shell')
makedepends=(
  'git'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'evolution-data-server: access contacts in GNOME Online Accounts, Evolution or the local address book.'
  'gsound: sound effects'
  'nautilus-python: share files from Nautilus'
  'nemo-python: share files from Nemo'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/GSConnect/gnome-shell-extension-gsconnect.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build \
    -Dnemo=true \
    -Dinstalled_tests=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --suite gsconnect:data --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
