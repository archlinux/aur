# Maintainer : Mico Tischler <mt-ml at gmx dot net>
# Contributor : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname="sbsigntools"
pkgver=0.7
pkgrel=1
pkgdesc="Tools to add signatures to EFI binaries and Drivers"
arch=('x86_64')
url="https://build.opensuse.org/package/show/home:jejb1:UEFI/sbsigntools"
license=('GPL3')
makedepends=('gnu-efi-libs' 'help2man')
depends=('libutil-linux' 'openssl')
source=("https://build.opensuse.org/source/home:jejb1:UEFI/sbsigntools/${pkgname}-${pkgver}.tar.gz"
	"https://build.opensuse.org/source/home:jejb1:UEFI/sbsigntools/ccan-0.0.2.tar.gz"
	"0001-OBS-add-correcting-definition-of-EFI_ARCH.patch"
	"0001-sbsigntools-fix-autogen.sh-for-build-service.patch")
sha256sums=('415db6779062a3bd9752718637aa8760ed14d8822061eac9e5819987439b06c4'
            'a3ac0d59dce1b7662ec75c1c79e0bf6518d79d012282e270099231006d12272e'
            '44a69e3708770f465ce5dc139aaa90c5208a2abae420cbcb00674a6ef7866a97'
            '9085ad181f67ac911918864783a9804af456d33c4631659e6acaaa27987786d7')
noextract=("ccan-0.0.2.tar.gz")

prepare() {
#        mkdir -p "${pkgname}-${pkgver}/lib/ccan"
	cd "${pkgname}-${pkgver}/lib/ccan.git"
	tar xf "${srcdir}/ccan-0.0.2.tar.gz"
	
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/0001-OBS-add-correcting-definition-of-EFI_ARCH.patch"
	patch -p1 -i "${srcdir}/0001-sbsigntools-fix-autogen.sh-for-build-service.patch"
}

build() {
	cd "${pkgname}-${pkgver}"

        NOCONFIGURE=1 ./autogen.sh
	./configure --prefix="/usr" --bindir="/usr/bin" --sbindir="/usr/bin" --libexecdir="/usr/lib" --mandir="/usr/share/man" --sysconfdir="/etc"
	cp "lib/ccan.git/config.h" "lib/ccan/"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	
	make DESTDIR="${pkgdir}" install
}
