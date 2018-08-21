# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Note: Package builds on PKGBUILD from ABS, provides latest version from
#       git master branch of Seahorse.
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=seahorse-git
pkgver=3.29.91+23+g74b7416a
pkgrel=1
pkgdesc="GNOME application for managing encryption keys and passwords in the
GNOME Keyring."
url="https://wiki.gnome.org/Apps/Seahorse"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gcr libsecret libsoup gpgme gnome-keyring)
conflicts=('seahorse')
provides=('seahorse')
makedepends=(libldap yelp-tools gobject-introspection vala git meson)
provides=(x11-ssh-askpass)
#_commit=9496a0d19efd681850dbfe38012c5db4709f591e  # master
source=("git+https://gitlab.gnome.org/GNOME/seahorse.git"
        0001-LDAP-source-Fix-non-debug-build.patch)
sha256sums=('SKIP'
            '7c45e55f9d98510e1f9305af71d9a11d66fd15100ed29239493c94d591eb9e98')

pkgver() {
  cd seahorse/
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd seahorse/
  patch -Np1 -i ../0001-LDAP-source-Fix-non-debug-build.patch
}

build() {
  arch-meson seahorse build
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
