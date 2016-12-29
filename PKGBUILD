# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
# Contributor: Lubomir Krajcovic <lubomir.krajcovic(AT)gmail(DOT)com>
# Contributor: Vladimir Kutyavin <vlkut(AT)bk(DOT)ru>
pkgname=xtables-addons-dkms
pkgver=2.11
pkgrel=1
pkgdesc="Successor to patch-o-matic(-ng). Contains extensions that were not accepted in the main Xtables. DKMS flavor for kernels >= 3.7."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xtables-addons.sourceforge.net/"
depends=('dkms')
optdepends=('perl-text-csv-xs: required for building GeoIP database'
            'unzip: required for building GeoIP database')
makedepends=()
conflicts=(xtables-addons xtables-addons-git xtables-addons-multikernel)
replaces=(xtables-addons xtables-addons-git xtables-addons-multikernel)
source=(dkms.conf
        https://sourceforge.net/projects/${pkgname%-dkms}/files/Xtables-addons/${pkgver}/${pkgname%-dkms}-${pkgver}.tar.xz)
sha256sums=('58a1ae063d61dcff8b5d68d19a828045af4b26810b471cad1461b610ac53900a'
            'f14f8953a9d3a70157a82883886ff6ec866c61dbea1585edb421478107279921')

prepare() {
	# go to builddir
	cd "${srcdir}/xtables-addons-${pkgver}"
	
	# disable install-exec-hook (avoids useless calling of depmod -a at 'make install' stage)
	sed -i 's/^install-exec-hook:$/dont-run:/' Makefile.am
	# disable building of xt_ECHO (it's an example module, and it breaks the build)
	sed -i 's/^build_ECHO=.*$/build_ECHO=n/' mconfig
	
}

build() {
	cd "${srcdir}/xtables-addons-${pkgver}"

	# build userspace parts
    ./autogen.sh

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --libdir=/usr/lib \
        --mandir=/usr/share/man \
        --docdir=/usr/share/doc \
        --libexecdir=/usr/lib/iptables \
        --with-xtlibdir=/usr/lib/iptables \
		--without-kbuild

	make
}

package() {
	cd "${srcdir}/xtables-addons-${pkgver}"

	# prepare dkms build tree
	dkmsDst="${pkgdir}/usr/src/xtables-addons-${pkgver}"
	mkdir -p "${dkmsDst}/"
	cp -R . "${dkmsDst}/"
	
	# prepare dkms config
	cp "${srcdir}/dkms.conf" "${dkmsDst}/"
	sed -i -e "s/@VERSION@/${pkgver}/" "${dkmsDst}/dkms.conf"

	make DESTDIR="${pkgdir}" install
}
