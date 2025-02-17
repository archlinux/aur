# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Amish <contact at via dot aur>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>
# Contributor: Lubomir Krajcovic <lubomir.krajcovic(AT)gmail(DOT)com>
# Contributor: Vladimir Kutyavin <vlkut(AT)bk(DOT)ru>

_pkgbase=xtables-addons-xtee
_gitname=xtables-addons
pkgname=${_pkgbase}-dkms-git
pkgver=r1186.165387e
pkgrel=1
pkgdesc='DKMS for additional extensions for Xtables packet filter present in the Linux kernel (with XTEE patch)'
arch=('x86_64' 'i686')
license=('GPL2')
url="https://github.com/egormanga/${_gitname}"
depends=('dkms')
optdepends=('perl-text-csv-xs: required for building GeoIP database'
            'perl-net-cidr-lite: required for building GeoIP database'
            'wget: required for building GeoIP database'
            'unzip: required for building GeoIP database')
conflicts=(xtables-addons xtables-addons-git xtables-addons-dkms xtables-addons-xtee xtables-addons-xtee-dkms)
replaces=(xtables-addons xtables-addons-git xtables-addons-dkms xtables-addons-xtee xtables-addons-xtee-dkms)
source=("git+${url}.git"
        'dkms.conf')
sha256sums=('SKIP'
            'ad9ef3579bf33f09b25964c9ca5f8a95342ce7ec09867fa35ce479a8eab2dadc')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"

	sed -ie "s/@VERSION@/${pkgver}/" '../dkms.conf'

	# Disable install-exec-hook (avoids useless calling of depmod -a at 'make install' stage)
	sed -i 's/^install-exec-hook:$/dont-run:/' 'Makefile.am'

	# Disable building of xt_ECHO (it's an example module, and it breaks the build)
	sed -i 's/^build_ECHO=.*$/build_ECHO=n/' 'mconfig'
}

build() {
	cd "${srcdir}/${_gitname}"

	# Build userspace parts
	autoreconf -fvi
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--mandir=/usr/share/man \
		--docdir=/usr/share/doc \
		--libexecdir=/usr/lib/xtables \
		--with-xtlibdir=/usr/lib/xtables \
		--without-kbuild
	make
}

package() {
	cd "${srcdir}/${_gitname}"

	# Install userspace parts
	make DESTDIR="${pkgdir}" install

	install -Dm644 '../dkms.conf' -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
	cp -r '.' "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
