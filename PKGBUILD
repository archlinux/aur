# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Note: Package builds on PKGBUILD from ABS, provides latest version from
#       git master branch of Seahorse.
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=seahorse-git
pkgver=41.0+41+g8bbc1f48
pkgrel=1
pkgdesc="GNOME application for managing encryption keys and passwords in the
GNOME Keyring."
url="https://wiki.gnome.org/Apps/Seahorse"
arch=(x86_64)
license=(GPL)
options=(debug !strip)
depends=(gtk3 gcr libsecret libsoup gpgme gnome-keyring libpwquality libhandy)
conflicts=('seahorse')
provides=('seahorse')
makedepends=(libldap yelp-tools gobject-introspection vala git meson)
provides=(x11-ssh-askpass)
# Tag: 3.30.0: 7e0535880a2010df356d9c468c68cdcb77b45431
#_commit=7e0535880a2010df356d9c468c68cdcb77b45431
#source=("git+https://gitlab.gnome.org/GNOME/seahorse.git#commit=$_commit")

source=("git+https://gitlab.gnome.org/GNOME/seahorse.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname%-git}
}

build() {
  rm -rf build
  meson --prefix /usr --buildtype=plain seahorse build -D manpage=true
  meson compile -C build
}

check() {
  cd build
  meson test --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
