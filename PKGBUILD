# Contributor: Vianney le Clément <vleclement AT gmail · com>
# Contributor: Michael Klier <chi@chimeric.de>
# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=upslug2-openwrt
pkgver=41
pkgrel=3
pkgdesc="A tool to flash your NSLU2 (Slug) from a computer on a local network. (With OpenWRT patches)"
url="http://www.nslu2-linux.org/wiki/Main/UpSlug2"
depends=('gcc-libs')
makedepends=('subversion')
arch=('i686' 'x86_64')
license=('custom')
source=("100-libpcap_fix.patch"
        "110-wrt350nv2_support.patch")
md5sums=('d50d808f117361f18bbe0726a73b40e2'
         '80e4028a3c79dd4ac5dde263015d6063')

_svntrunk="http://svn.nslu2-linux.org/svnroot/upslug2/trunk"
_svnmod="upslug2"

build() {
	cd ${srcdir}

	msg "Connecting to ${_svnmod}.nslu2-linux.org SVN server...."
	if [ -d ${_svnmod}/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	msg "SVN checkout done or server timeout"

	cp -r $_svnmod ${_svnmod}-build
	cd ${_svnmod}-build

	msg "Patching files..."
	patch -p1 < "${srcdir}/100-libpcap_fix.patch"
	patch -p1 < "${srcdir}/110-wrt350nv2_support.patch"

	msg "Starting make..."
	autoreconf -i
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

	install -d ${pkgdir}/usr/share/man/man8/
	gzip -c upslug2.8 > ${pkgdir}/usr/share/man/man8/upslug2.8.gz || return 1
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	cp COPYING ${pkgdir}/usr/share/licenses/${pkgname}

	rm -rf ${srcdir}/${_svnmod}-build
}
