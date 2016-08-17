# Maintainer: jbreams@gmail.com
pkgname=gonepass-git
pkgver=r37.22ea069
pkgrel=1
pkgdesc="GTK+ 1Password reader"
arch=('x86_64')
url="https://github.com/jbreams/gonepass"
license=('Apache2')
groups=()
depends=(
  'openssl'
  'gtkmm3'
)
makedepends=(
  'git'
  'cmake'
)
install=
source=('git+https://github.com/jbreams/gonepass')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    mkdir build
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF ..
    make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR=$pkgdir/ install
}

post_install() {
    glib-compile-schemas /usr/share/glib-2.0/schemas
    update-desktop-database -q
}

pre_upgrade() {
    if [ -f /usr/share/glib-2.0/schemas/gonepass.gschema.xml ]; then
        gconfpkg --uninstall gonepass
    fi
}

post_upgrade() {
    post_install $1
}

post_remove() {
    post_install $1
}
