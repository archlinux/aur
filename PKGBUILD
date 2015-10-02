# Maintainer: Lubomir Krajcovic <lubomir.krajcovic(AT)gmail(DOT)com>
# Contributor: Vladimir Kutyavin <vlkut(AT)bk(DOT)ru>
pkgname=xtables-addons-dkms
pkgver=2.8
pkgrel=1
pkgdesc="Successor to patch-o-matic(-ng). Contains extensions that were not accepted in the main Xtables. DKMS flavor for kernels >= 3.7."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xtables-addons.sourceforge.net/"
depends=('iptables>=1.4.5' 'dkms' 'gcc' 'make' 'automake' 'autoconf' 'pkg-config')
optdepends=('perl-text-csv-xs: required for building GeoIP database')
makedepends=()
conflicts=(xtables-addons xtables-addons-git xtables-addons-multikernel)
replaces=(xtables-addons xtables-addons-git xtables-addons-multikernel)
source=(dkms.conf
        make.sh
        http://download.sourceforge.net/project/xtables-addons/Xtables-addons/xtables-addons-$pkgver.tar.xz)
sha512sums=('428fea77c2df17778f6773ffbfcd9c57f91ce466eda2bdece2822ab2402541e4bff41888f4118e9e8da25f44967e978a2b378d07148f0f7edd672f99777dbd2b'
            'b6ebf96d02f919522861205cd17d3a75e5890f7e50cb258689ffca8b4036e77a6e018893fe3ba2ad8ffcee13b6335080b46970486a49983ce0764e8d6fef4a02'
            '337a0f9f8e1236a14977b1f60f82e9f6ea4b3d1134fb4ff29cdb7edfca54501639760e8f855ac803e259660a9a5afd7366770543e2f077346cb5dda8ef80462e')
install=$pkgname.install

package() {
	# go to builddir
	cd "${srcdir}/xtables-addons-${pkgver}"
	
	# disable install-exec-hook (avoids useless calling of depmod -a at 'make install' stage)
	sed -i 's/^install-exec-hook:$/dont-run:/' Makefile.am
	# disable building of xt_ECHO (it's an example module, and it breaks the build)
	sed -i 's/^build_ECHO=.*$/build_ECHO=n/' mconfig
	
	# prepare dkms build tree
	dkmsDst="${pkgdir}/usr/src/xtables-addons-${pkgver}-${pkgrel}"
	mkdir -p "${dkmsDst}/"
	cp -R . "${dkmsDst}/"
	
	# prepare dkms config
	cp "${srcdir}/make.sh" "${dkmsDst}/"
	cp "${srcdir}/dkms.conf" "${dkmsDst}/"
	sed -i -e "s/@VERSION@/${pkgver}-${pkgrel}/" "${dkmsDst}/dkms.conf"
	
	# build userspace parts
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/iptables \
		--sysconfdir=/etc \
		--with-xtlibdir=/usr/lib/iptables \
		--mandir=/usr/share/man \
		--without-kbuild
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1
}
