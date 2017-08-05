# Maintainer: Janne Heß <jannehess@gmail.com>

pkgbase=smack-utils
pkgname=('smack-utils' 'libsmack')
pkgdesc='SMACK Userspace'
pkgver=1.3.1
pkgrel=2
url='http://schaufler-ca.com/'
license=('LGPL')
makedepends=('doxygen')
source=("https://github.com/smack-team/smack/archive/v${pkgver}.tar.gz")
sha512sums=('cf55137a0b1262171ece5eba9cdfd0da7f2d6602955801431174891b35be702b2237ea9910784c79c8aa3cfdd3a6b3a2c5f600857637096f7151c1a0823bca39')
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/smack-${pkgver}"

	./autogen.sh
	make all
}

package_smack-utils() {
	pkgdesc='SMACK Userspace'
	conflicts=('smack-utils-git')
	depends=('libsmack')
	install='smack-utils.install'

	cd "${srcdir}/smack-${pkgver}"

	make DESTDIR="${pkgdir}" \
		install-exec \
		install-data

	pushd "${pkgdir}/usr"
	rm -r include \
		share/doc \
		share/man/man3 \
		lib
	popd

	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	for t in service mount; do
		install -Dm644 "init/smack.${t}" "${pkgdir}/usr/lib/systemd/system/"
	done

	install -dm755 "${pkgdir}/etc/smack/accesses.d"
	install -dm755 "${pkgdir}/etc/smack/cipso.d"
}

package_libsmack() {
	pkgdesc='SMACK userspace library'
	conflicts=('smack-utils-git')
	depends=('libsmack')

	cd "${srcdir}/smack-${pkgver}"

	make DESTDIR="${pkgdir}" \
		install-data \
		install-exec
	
	rm -r "${pkgdir}/usr/share/man/man1"
	rm -r "${pkgdir}/usr/share/man/man8"
	rm -r "${pkgdir}/usr/bin"
}

