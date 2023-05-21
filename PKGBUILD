# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=astroid-git
_pkgname=astroid
pkgver=v0.16.r2.g7c2022f
pkgrel=1
pkgdesc="a graphical threads-with-tags style, lightweight and fast, email client for notmuch, inspired by sup and others"
arch=('x86_64' 'i686')
url="https://github.com/astroidmail/astroid"
license=('GPL')
depends=('notmuch' 'boost' 'boost-libs' 'gmime3' 'gtkmm3' 'webkit2gtk' 'libsass'
         'libpeas' 'gobject-introspection' 'protobuf' 'gtk-update-icon-cache')
makedepends=('cmake' 'ninja' 'git' 'pkg-config' 'python-gobject' 'cmark' 'ruby-ronn')
checkdepends=('notmuch-runtime' 'w3m')
optdepends=('gvim: default editor'
            'emacs: can be used as editor'
            'vte3: for drop-down terminal'
            'cmark: for markdown to html composition')
provides=('astroid')
conflicts=('astroid')
source=("git+https://github.com/astroidmail/astroid.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build

  # We ship the manpage to avoid an AUR dependency
  cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DDISABLE_DOCS=ON
  ninja
}

check() {
  cd "$_pkgname"
  cd build
  ctest --output-on-failure
}

package() {
  cd "$_pkgname"
  cd build
  DESTDIR="$pkgdir" ninja install
}

