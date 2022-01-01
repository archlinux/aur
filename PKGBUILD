# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=sbuild
_tag=debian/0.81.2
pkgver=${_tag##*/}
_srcname=$pkgname-${_tag/\//-}
pkgrel=2
epoch=
arch=(any)
url="https://salsa.debian.org/debian/sbuild"
license=('GPL2')
pkgdesc="Tool for building Debian binary packages from Debian sources"
depends=(
	apt
	"dpkg>=1.20"
	"gnupg>=2.1"
	perl-exception-class
	perl-filesys-df
	perl-mime-lite
	perl-yaml-tiny
	python
)
optdepends=(
	"adduser: sbuild-adduser support"
	"debootstrap: sbuild-createchroot support"
	"qemu: QEMU support"
	"python-pexpect: QEMU support"
	"python-psutil: QEMU support"
	"schroot>=1.6.0: alternate chroot backend; sbuild support"
	"smtp-forwarder: mail build logs support"
)
source=("$url/-/archive/$_tag/$_srcname.tar.gz")
sha512sums=('d9e5a0157ddfd7df10216f38cc80c99445fdcfec50cfb9428ab35459f0ce85be198f50c0ea0028365f31f5eadb91d6d696ed3f6194fa3c799464f2fd2602fda8')
validpgpkeys=()

prepare() {
	cd "$_srcname"
	sed -ie 's,PERL_MODULE_DIR=.*,PERL_MODULE_DIR="${datadir}/perl5/vendor_perl",g' configure.ac
	autoupdate
}

build() {
	cd "$_srcname"
	autoreconf -i
	./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --sysconfdir=/etc
	make
}

package() {
	cd "$_srcname"
	make DESTDIR="$pkgdir/" install
}
