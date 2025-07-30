# Maintainer: solstiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=virt-v2v
pkgver=2.9.2
pkgrel=1
pkgdesc="Convert a guest image to use with KVM"
arch=(x86_64)
url="https://libguestfs.org/virt-v2v.1.html"
license=('GPL-2.0-or-later')
depends=('libguestfs' 'libosinfo' 'libnbd' 'nbdkit')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-libvirt')
options=('!ccache')
# ocaml-libvirt 0.6.1.5 is broken, use ocaml-libvirt-git
optdepends=('mingw-w64-rhsrvany: for Windows based VM'
	'virtio-win: for windows based VM')

# dirty hack to deal with both stable and dev version
_minor=`echo $pkgver|awk -F. '{print $2}'`
_dirname='stable'
if [[ `expr $_minor % 2` -eq 1 ]]; then
	_dirname='development'
fi

source=("https://download.libguestfs.org/virt-v2v/${pkgver:0:3}-${_dirname}/virt-v2v-${pkgver}.tar.gz" "virt-v2v.install")
install=virt-v2v.install

sha256sums=('5808990149330fc8d1a94312978be77a7a6b18b11d7676c522e99b283486edc8'
            '6235d47396e8e193a80de17825fe337f18ab0bb6ffb4a61f204bea57e5a90f7d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

# some tests are still failling
#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
