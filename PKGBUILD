# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn-tls-crypt
pkgver=1.2.8
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN (supports tls-crypt)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/NetworkManager"
license=('GPL')
depends=('libnm' 'libsecret' 'openvpn')
makedepends=('libnm-gtk' 'intltool' 'python' 'git')
conflicts=('networkmanager-openvpn')
replaces=('networkmanager-openvpn')
install=networkmanager-openvpn.install
_commit=3b19f480395aadf50de531d0a3df9bb8d924fe62  # tags/1.2.8^0
source=("git+https://git.gnome.org/browse/network-manager-openvpn#commit=$_commit"
	# See https://bugzilla.gnome.org/show_bug.cgi?id=777768
	"${pkgname}.patch")
md5sums=('SKIP'
         '787f4f23e55e6b3b8a3e0921104c1bca')

pkgver() {
	cd network-manager-openvpn
	git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd "network-manager-openvpn"
	patch -p1 -i "$srcdir/$pkgname.patch"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "network-manager-openvpn"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--libexecdir=/usr/lib/NetworkManager --disable-static
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
	cd "network-manager-openvpn"
	make -k check
}

package() {
	cd "network-manager-openvpn"
	make DESTDIR="$pkgdir/" install
}
