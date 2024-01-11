# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-git
pkgver=4.2.1.r11.gc5e173c
pkgrel=1
epoch=1
pkgdesc='A Bible study tool for GTK3'
arch=('x86_64' 'i686')
url='http://xiphos.org'
license=('GPL2')
depends=(biblesync libbiblesync.so
         dbus-glib
         icu libicui18n.so
         minizip
         sword
         webkit2gtk)
makedepends=(appstream-glib
             cmake
             docbook-utils
             git
             gtkmm
             intltool
             itstool
             libffi
             libxml2
             python
             yelp-tools
             zlib
             zip)
provides=(gnomesword "${pkgname%-git}")
conflicts=("${provides[@]}")
source=("git+https://github.com/crosswire/xiphos.git"
        https-by-default.patch
        xiphos-glibc.patch
        disable-webkit-editor.patch)
sha256sums=('SKIP'
            '3630dee5f9f05600e1a726b91a89e2eb17615a73d30548de303e7b29ec2286d2'
            'd1669dced24a5d6d9a76ab033fc89201855285b76a1e80ef3fe695242d1c401d'
            'b8e7e8da6eaa246f7f6ff952bf4b5bc87a7274a6e71ae311fad55da2c43aa5af')

prepare() {
	cd "${pkgname%-git}"
	# https://github.com/crosswire/xiphos/issues/1083
	patch -Np0 -i ../xiphos-glibc.patch
	# disable study pad as it requires a very old webkitgtk
	# https://github.com/crosswire/xiphos/issues/794
	patch -Np1 -i ../disable-webkit-editor.patch
	# avoid fetching modules over plaintext ftp
	patch -Np1 -i ../https-by-default.patch
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags --abbrev=7 --match="[0-9]*" HEAD |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "${pkgname%-git}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
