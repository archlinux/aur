# Maintainer : Mico Tischler <mt-ml at gmx dot net>
# Contributor : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname="sbsigntools"
pkgver=0.8
pkgrel=1
pkgdesc="Tools to add signatures to EFI binaries and Drivers"
arch=('x86_64')
url="https://build.opensuse.org/package/show/home:jejb1:UEFI/sbsigntools"
license=('GPL3')
makedepends=('gnu-efi-libs' 'help2man' 'git') 
depends=('libutil-linux' 'openssl')
_commitid='ed53774c2f6b39ab63b312891ba7e98492f4d7e3'
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/jejb/sbsigntools.git#commit=${_commitid}"
	"git://git.ozlabs.org/~ccan/ccan"
	"0001-OBS-add-correcting-definition-of-EFI_ARCH.patch"
	"0001-sbsigntools-fix-autogen.sh-for-build-service.patch")
sha256sums=('SKIP'
            'SKIP'
            '44a69e3708770f465ce5dc139aaa90c5208a2abae420cbcb00674a6ef7866a97'
            '9085ad181f67ac911918864783a9804af456d33c4631659e6acaaa27987786d7')

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -p1 -i "${srcdir}/0001-OBS-add-correcting-definition-of-EFI_ARCH.patch"
	patch -p1 -i "${srcdir}/0001-sbsigntools-fix-autogen.sh-for-build-service.patch"

	git submodule init
	git config submodule."lib/ccan.git".url "${srcdir}/ccan"
	git submodule update
}

build() {
	cd "${pkgname}"

        NOCONFIGURE=1 ./autogen.sh
	./configure --prefix="/usr" --bindir="/usr/bin" --sbindir="/usr/bin" --libexecdir="/usr/lib" --mandir="/usr/share/man" --sysconfdir="/etc"
	cp "lib/ccan.git/config.h" "lib/ccan/"
	make
}

package() {
	cd "${pkgname}"
	
	make DESTDIR="${pkgdir}" install
}
