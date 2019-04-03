# Maintainer: Thermi <noel at familie-kuntze dot de>

pkgname=ocfs2-tools
pkgver=1.8.5
pkgrel=2
pkgdesc="ocfs2 tool chain by Oracle, including mkfs, tunefs, fsck, debugfs and utilities for ocfs2"
arch=("x86_64" "i686")
url="https://github.com/markfasheh/ocfs2-tools/"
license=("GPL2")
optdepends=("pacemaker" "corosync")
makedepends=("automake" "libaio")
source=("https://github.com/markfasheh/ocfs2-tools/archive/ocfs2-tools-${pkgver}.tar.gz"
        "2125-Makefile-allow-parallel-builds.patch"
        "2129-fsck.ocfs2-fix-compile-error-when-glibc-upgrade.patch"
        "0001-tunefs.ocfs2-fix-parallel-build.patch"
        "0002-Fix-build-failure-with-glibc-2.28.patch"
        "0003-sysmacros-h.patch")

sha256sums=('ccf8bf8a2cccad841a96b41e0a858194ec61e8a765065630595d4218e9008569'
            '8bab7feb2184c193df963e13963647e9fff5b09ecce62d5d0253e85009a5fb83'
            '6e2fc81962513ce9ea7f7074fc5eabaab3859933956eef4a47025f7e1d84cb0f'
            'ca0d9f713177393b9909b42875c62302fa98a3496c7f4d0fb21472685caa632d'
            '21f97110e61439670f489d18b86def8e7e0ef374a26a0367607986fbe923cf52'
            '9e336415c6733bbd7efebcb97fe3b3b0a34ecb471013b1c6f3096705e4ff6e21')

prepare() {
    # Upstream packaged it like that, it"s not a problem in this PKGBUILD.
    cd "${srcdir}/ocfs2-tools-ocfs2-tools-${pkgver}"
    patch -p1 <"${srcdir}/2125-Makefile-allow-parallel-builds.patch"
    patch -p1 <"${srcdir}/2129-fsck.ocfs2-fix-compile-error-when-glibc-upgrade.patch"
    patch -p1 <"${srcdir}/0001-tunefs.ocfs2-fix-parallel-build.patch"
    patch -p1 <"${srcdir}/0002-Fix-build-failure-with-glibc-2.28.patch"
    patch -p1 <"${srcdir}/0003-sysmacros-h.patch"
}

build() {
	# Upstream packaged it like that, it"s not a problem in this PKGBUILD.
	cd "${srcdir}/ocfs2-tools-ocfs2-tools-${pkgver}/"

	./autogen.sh --prefix=/usr 		\
		--sysconfdir=/etc 			\
		--libexecdir=/usr/lib		\
		--sbindir=/usr/bin			\
		--mandir=/usr/share/man		\
		--enable-dynamic-ctl=yes	\
		--enable-dynamic-fsck=yes
	make
}

package() {
    # Upstream packaged it like that, it"s not a problem in this PKGBUILD.
	cd "${srcdir}/ocfs2-tools-ocfs2-tools-${pkgver}/"
	make DESTDIR=${pkgdir} install 
	mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin/
	rmdir ${pkgdir}/sbin
}
