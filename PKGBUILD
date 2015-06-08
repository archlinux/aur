# Maintainer: replabrobin 
#	hashup of void runit and base runit
#	Archlinux package
# 
# copyright see
# http://creativecommons.org/publicdomain/zero/1.0/

pkgname=arch-runit
pkgver=2.1.2_20150603
_runit_ver=2.1.2
pkgrel=2
pkgdesc='Arch native runit package'
url='http://smarden.org/runit/'
license=('Creative Commons')
arch=('i686' 'x86_64')
install='runit.install'
source=("http://smarden.org/runit/runit-${_runit_ver}.tar.gz"
		"void-runit::git+https://github.com/voidlinux/void-runit"
		'cross.patch' 'utmpset-time_t.patch' 'void-runit.patch'
		)
sha256sums=('6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66ab49490992c0c47ba18'
			'SKIP'
			'51c17405558f5bbbe631d92a37adff872b9518fe1876a56b24efb05bedffae94'
			'527f68f501cc9eb4bbab33f8ad374822624342c7d74b5c795efe4aac6b3f170a'
			'14c48eb40c030e6f3d2ea487f11d6e331bd0d73b56adad187d546997f815b055'
			)
depends=()
makedepends=('git')
optdepends=('arch-runit-services')
provides=('arch-runit' 'runit')
conflicts=(
		ignite ignite-git
		runit-desktop runit-dietlibc runit-init
		runit-musl
		runit-run-git
		runit-scripts
		runit-services
		runit-services-git
		void-runit
		)

prepare(){
	cd "${srcdir}/admin"
	local pd=runit-${_runit_ver}
	sed -i -e's,sbin/runit,usr/bin/runit,g' ${pd}/src/runit.h
	sed -i -e's/ -static//g' ${pd}/src/Makefile
	sed -i -e's:^char \*varservice ="/service/";$:char \*varservice ="/var/service/";:' ${pd}/src/sv.c
	patch -d ${pd} -Np1 <${srcdir}/cross.patch
	patch -d ${pd} -Np1 <${srcdir}/utmpset-time_t.patch
	touch "${pd}/.makepkg.patched"
	cd "${srcdir}/void-runit"
	patch -Np1 <${srcdir}/void-runit.patch
	touch ".makepkg.patched"
	}

build(){
	cd "$srcdir/void-runit"
	make

	cd "${srcdir}/admin/runit-${_runit_ver}"

	## apply custom CFLAGS and LDFLAGS
	echo "${CC:-gcc} $CFLAGS" > src/conf-cc
	echo "${CC:-gcc -s} $LDFLAGS" > src/conf-ld

	## compile
	make -C 'src'
	}

check(){
	cd "${srcdir}/admin/runit-$_runit_ver"
	make -C 'src' check
	}

pkgver(){
	cd "$startdir/void-runit"
	git show -s --format="%ci" HEAD | sed -e 's/-//g;s/ .*//;s/^/'${_runit_ver}'_/'
	}

package() {
	cd "$srcdir/void-runit"
	make DESTDIR="$pkgdir" PREFIX=usr install

	cd "${srcdir}/admin/runit-$_runit_ver"
	# default services
	install -dm0755 "$pkgdir/var"

	ln -s ../etc/runit/runsvdir/current "$pkgdir/var/service" #???

	# install binaries
	install -dm0755 "$pkgdir/usr/bin"
	for f in $(<package/commands); do
		install -sm0755 src/$f "$pkgdir/usr/bin"
	done
	ln -s runit-init "$pkgdir/usr/bin/init"

	# man-pages
	install -dm0755 "$pkgdir/usr/share/man/man8"
	install -m0644 man/* "$pkgdir/usr/share/man/man8"

	# doc
	install -dm0755 "$pkgdir/usr/share/doc/runit"
	install -m0644 doc/*.html "$pkgdir/usr/share/doc/runit"

	install -Dm0644 package/COPYING "$pkgdir/usr/share/licenses/runit/LICENSE"
	}
