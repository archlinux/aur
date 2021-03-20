# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=authenticator
pkgname=$_pkgname-git
pkgver=4.0.2.r21.g8ac5109
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
  "zbar-rust::git+https://github.com/magiclen/zbar-rust.git"
  "0001-fix-change-minor-max-version.patch"
)
sha256sums=('SKIP'
            'SKIP'
            '9b9274c9e96107793914c181034a3d9794689e98817c9cffe2e7523f7cf095c1')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/zbar-rust"
  patch -Np1 < "../0001-fix-change-minor-max-version.patch"

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

