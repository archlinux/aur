# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=upower
pkgname=upower-silent-mouse
pkgver=0.99.13
pkgrel=1
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics, patched with guiambros' silent-mouse notification fix"
url="https://upower.freedesktop.org"
arch=(x86_64)
license=(GPL)
depends=(systemd libimobiledevice libgudev)
makedepends=(docbook-xsl gobject-introspection python git gtk-doc)
provides=(upower)
conflicts=(upower)
backup=(etc/UPower/UPower.conf)
_commit=0f6cc0a10be22d7ddd684e1cd851e4364a440494  # tags/UPOWER_0_99_13^0
source=("git+https://gitlab.freedesktop.org/upower/upower.git#commit=$_commit"
        "https://github.com/guiambros/silent-mouse/raw/main/up-device-0_99_13.patch")
sha256sums=('SKIP'
            'ebff59c52ea3d9ced604fd6507e8f99e62467785b40443da52f41bf3b5f941dd')

pkgver() {
	cd $_pkgname
	git describe --tags | sed -e 's/UPOWER_//' -e 's/_/\./g' -e 's/-/+/g'
}

prepare() {
	cd "${srcdir}/${_pkgname}/src"
	patch -Np0 -i "${srcdir}/up-device-0_99_13.patch"

	cd ..
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd $_pkgname
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib \
		--disable-static \
		--enable-gtk-doc
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
}
