# Contributor: ReNoM <renom@list.ru>
pkgname=vmware-vcli
pkgver=5.5.0.2043780
pkgrel=1
pkgdesc="The vCLI utilities make it possible to manage VMWare ESX servers (with the possibility of using vCenter). For make package, place VMware-vSphere-CLI-5.5.0-1549297.{your_arch}.tar.gz to PKGBUILD directory."
arch=('i686' 'x86_64')
url="https://my.vmware.com/web/vmware/details?productId=351&downloadGroup=VCLI55U1"
license=('custom:vmware')
depends=(e2fsprogs openssl libxml2 perl perl-xml-sax perl-crypt-ssleay perl-archive-zip perl-html-parser perl-data-dump perl-soap-lite perl-uri perl-lwp-protocol-https perl-class-methodmaker perl-net-ssleay perl-xml-libxml)
[ "$CARCH" == "i686" ] && source=(VMware-vSphere-CLI-5.5.0-2043780.i386.tar.gz for-arch.patch)
[ "$CARCH" == "x86_64" ] && source=(VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar.gz for-arch.patch)

[ "$CARCH" == "i686" ] && sha256sums=('0717672728f8abc9066927127d48a3570fcf1d931a1a6e0bbfcfd2df7cb6629a' '45707476b36341e3ecf04378f2bf6310b2abb5534cf1168c8a245bf791f5c94c')
[ "$CARCH" == "x86_64" ] && sha256sums=('23e4ae5fdab120ff73bb1163297c6c98b0b3d14e8134ed7fad7e21204d902003' '45707476b36341e3ecf04378f2bf6310b2abb5534cf1168c8a245bf791f5c94c')

build() {
	cd "$srcdir"
	patch -p0 < for-arch.patch
}

package ()
{
	cd "$pkgdir"
	mkdir -p usr/bin
	mkdir -p usr/lib/perl5/core_perl
	cd "$srcdir/vmware-vsphere-cli-distrib"
	export ftp_proxy=""
	export http_proxy=""
	./vmware-install.pl --prefix=../../pkg/vmware-vcli
	cd "$pkgdir"
	rm usr/lib/perl5/core_perl/Data/Dumper.pm
	rm usr/lib/perl5/core_perl/auto/Data/Dumper/Dumper.so
	mv bin/* usr/bin/
	rmdir bin
	mv lib/* usr/lib/
	rmdir lib
}

