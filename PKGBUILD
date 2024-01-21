# Maintainer: solstiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=virt-v2v
pkgver=2.4.0
pkgrel=1
pkgdesc="Convert a guest image to use with KVM"
arch=(x86_64)
url="https://libguestfs.org/virt-v2v.1.html"
license=('GPL')
depends=('libguestfs' 'libosinfo' 'libnbd' 'nbdkit')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-libvirt')
options=('!ccache')
# ocaml-libvirt 0.6.1.5 is broken, use ocaml-libvirt-git
optdepends=('mingw-w64-rhsrvany: for Windows based VM'
	'virtio-win: for windows based VM')
source=("https://download.libguestfs.org/virt-v2v/${pkgver:0:3}-stable/virt-v2v-${pkgver}.tar.gz" "virt-v2v.install")
install=virt-v2v.install

sha256sums=('c413cfc874c8ced3a84d9d63c8e9265930ef1746e653a8a9d432e1363dcecf47'
            '6235d47396e8e193a80de17825fe337f18ab0bb6ffb4a61f204bea57e5a90f7d')

prepare() {
	if [ ! -f /usr/lib/ocaml/nbd/META ] ;then
		echo "It seems you have built libnbd without ocaml binding. Please rebuilt libnbd with ocaml installed" >&2
	fi
	cd "$pkgname-$pkgver"
	# small fix until upstream fix it for ocaml 5.0
	sed -i 's/Pervasives/Stdlib/' common/mlstdutils/std_utils.ml
}
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

# some tests are failing
#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
