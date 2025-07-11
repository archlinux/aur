# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=sbuild
_tag=debian/0.89.3
pkgver=${_tag##*/}
_srcname=$pkgname-${_tag/\//-}
pkgrel=1
epoch=
arch=(any)
url="https://salsa.debian.org/debian/sbuild"
license=('GPL2')
pkgdesc="Tool for building Debian binary packages from Debian sources"
depends=(
	apt
	"dpkg>=1.21.14"
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
source=(
	"$url/-/archive/$_tag/$_srcname.tar.gz"
	sbuild.sysusers
)
sha512sums=('3c99aba4e2b989dd0fd931f4499b88d93f45857e1a1ff0c286c4cfec342e152e0c055b052aa88f9a554fdd3bbd173e8d5a6d6e5e320af09fbcde95b8534e80dd'
            'd885e8aaaf44b72b7cdbdca2163d7594f08296f34f930522eaa86b8e348ce0b4a2cf7f2cf5cfc2e595f7c272c70f5bf2734a416333a7a068a00bc74b58c67fe8')
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
	install -Dm 644 ../sbuild.sysusers "${pkgdir}/usr/lib/sysusers.d/sbuild.conf"
}
