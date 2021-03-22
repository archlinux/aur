# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=authenticator
pkgname=$_pkgname-git
pkgver=4.0.2.r22.gb1c9dba
pkgrel=1
pkgdesc="2FA code generator for GNOME "
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL')
depends=('gtk4' 'glib2' 'libsecret' 'zbar' 'libadwaita' 'gstreamer')
makedepends=('git' 'meson' 'ninja' 'gobject-introspection' 'rust')
provides=('authenticator')
conflicts=('authenticator')
source=(
  "$_pkgname::git+https://gitlab.gnome.org/World/Authenticator.git"
  "zbar-rust::git+https://github.com/magiclen/zbar-rust.git#commit=fc38e762b93326c98db965e7fcde55c7ab024ae8"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i "s|zbar-rust = \"0\.0\"|zbar-rust = { path = \"$srcdir/zbar-rust\" }|g" Cargo.toml
  meson build --prefix=/usr --libdir=lib --libexecdir=lib
}

build() {
  cd "$srcdir/$_pkgname"
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
}

