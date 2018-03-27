# Maintainer: Michael Serpieri <mickybart@pygoscelis.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgbase=schroot-hybris
_pkgbase=schroot
pkgname=('schroot-hybris' 'schroot-droid')
pkgver=1.6.10
pkgrel=18
url="http://packages.qa.debian.org/s/schroot.html"
license=('GPL3')
makedepends=('boost' 'cppunit')
arch=('x86_64' 'armv7h')
source=("http://http.debian.net/debian/pool/main/s/$_pkgbase/${_pkgbase}_${pkgver}.orig.tar.xz"
	"http://http.debian.net/debian/pool/main/s/schroot/schroot_$pkgver-3+deb9u1.debian.tar.xz"
	'arch32-example'
	'arch32-config'
	'arch32-copyfiles'
	'arch32-mount'
	'arch32-nssdatabases'
	'pam.d.schroot.patch'
	'schroot-cppunit.patch'
	'android-environment-schroot.patch'
	'gls-common::git+https://github.com/mickybart/gnulinux_support-common')
md5sums=('f8ec667831487f4b12e094bc0dc9bbe3'
         '467f67cfc9596ddf301bd26968935d29'
         '54239847f89b9a4772910415bde6276a'
         '5a3f7b839c7e0b8933748da7c5b6385b'
         'ddb2f09c02b24dab777110f9808472e1'
         'f0d5d5b5e34a860f6f90b5628c680f46'
         'af1da6edd8c8c0dafeeb2c2c4e0c840b'
         'a8d77cac806a0a9adef3f93cdbeb280a'
	 '4c744c38b1541359de5696c65a508e5e'
	 '532a4f1abdb479ba569cc7e23e53d69c'
	 'SKIP')

prepare() {
	cd ${_pkgbase}-${pkgver}
	cat "$srcdir"/debian/patches/series | while read p; do
		patch -p1 -i "$srcdir"/debian/patches/$p
	done
	# fix configure with cppunit 1.4
	patch -p1 -i ../schroot-cppunit.patch
	# support for android
	patch -p1 -i "${srcdir}"/android-environment-schroot.patch
	./bootstrap
}

build() {
	cd ${_pkgbase}-${pkgver}
	export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-dchroot \
		--enable-lvm-snapshot \
		--enable-btrfs-snapshot \
		--with-bash-completion-dir=/usr/share/bash-completion/completions/ \
		BTRFS=/sbin/btrfs \
		BTRFSCTL=/sbin/btrfsctl \
		LVCREATE=/sbin/lvcreate \
		LVREMOVE=/sbin/lvremove
		# --enable-csbuild
	make
}

check() {
	cd ${_pkgbase}-${pkgver}
#	make -k check
}

package_schroot-hybris() {
	pkgdesc="Allows users to execute shell commands under different root filesystems. (Successor to dchroot)."
	depends=('pam' 'lockdev' 'boost-libs' 'e2fsprogs')
	optdepends=('btrfs-progs-unstable' 'lvm2')
	conflicts=('dchroot' 'schroot' 'schroot-android')
	replaces=('dchroot' 'schroot' 'schroot-android')
	provides=('schroot' 'sbuild' 'dchroot' 'schroot-android')
	backup=('etc/schroot/schroot.conf'
		'etc/schroot/arch32/config'
		'etc/schroot/arch32/copyfiles'
		'etc/schroot/arch32/mount'
		'etc/schroot/arch32/nssdatabases')

	cd ${_pkgbase}-${pkgver}
	make DESTDIR="$pkgdir" install
	install -dm 755 "${pkgdir}"/etc/schroot/arch32
	install -m 644 "${srcdir}"/arch32-{config,mount,copyfiles,nssdatabases} "${pkgdir}"/etc/schroot/arch32
	rename 'arch32-' '' "${pkgdir}"/etc/schroot/arch32/*
	install -m 644 "${srcdir}"/arch32-example "${pkgdir}"/etc/schroot/chroot.d/arch32.conf.example
	patch -i "${srcdir}"/pam.d.schroot.patch "${pkgdir}"/etc/pam.d/schroot

	install -dm 755 "${pkgdir}"/usr/share/schroot/examples/
	cp -a "${srcdir}"/gls-common/schroot/android-example "${pkgdir}"/usr/share/schroot/examples/android
}

package_schroot-droid() {
	pkgdesc="Allow user to interact with Android chroot easily"
	depends=('schroot-hybris')

	install -d "${pkgdir}"/usr/bin
	install -m 755 "${srcdir}"/gls-common/schroot/sdroid "${pkgdir}"/usr/bin/

	install -d "${pkgdir}"/usr/lib/tmpfiles.d/
	install -m 644 "${srcdir}"/gls-common/schroot/config/tmpfiles.d.schroot-droid.conf "${pkgdir}"/usr/lib/tmpfiles.d/schroot-droid.conf

}
