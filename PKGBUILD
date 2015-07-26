# Maintainer: Lubomir Krajcovic <lubomir.krajcovic(AT)gmail(DOT)com>
# Contributor: Vladimir Kutyavin <vlkut(AT)bk(DOT)ru>
pkgname=xtables-addons-dkms
pkgver=2.6
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
        http://download.sourceforge.net/project/xtables-addons/Xtables-addons/$pkgver/xtables-addons-$pkgver.tar.xz)
sha512sums=('bb5e7eff3e402dc0561d917d67af540fb405b2a404dd16a3d553610c7197c4741a583007a97d0ca380b727dc45a818c29ec34996581e1e14dfe1657ee2d17d7a'
            'd1e917ac3c15ea8a533686781f6989ef648786f7a6666d06739c96d37debdc44bd2449c332db6e30af0f655540d1df49d4f5b702da4731aa7d550204ac908333'
            'e493c7a6e6512f8240d211b4ba5bb9ed705fcef604dca4b2ade717dd45046464087250b4057d9b66c94de92e090c0269e47e2cf665362bfe620b3a942d83d10d')
install=$pkgname.install

package() {
	# go to builddir
	cd "${srcdir}/xtables-addons-${pkgver}"
	# disable install-exec-hook (avoids useless calling of depmod -a at 'make install' stage)
	sed -i 's/^install-exec-hook:$/dont-run:/' Makefile.am
	# prepare dkms build tree
	dkmsDst="${pkgdir}/usr/src/xtables-addons-${pkgver}-${pkgrel}/"
	mkdir -p "${dkmsDst}"
	cp -R . "${dkmsDst}"
	# prepare dkms config
	cp "${srcdir}/make.sh" "${dkmsDst}"
	cp "${srcdir}/dkms.conf" "${dkmsDst}"
	sed -i -e "s/@VERSION@/${pkgver}-${pkgrel}/" "${dkmsDst}dkms.conf"
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
