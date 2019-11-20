# Maintainer: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r3353.0525de95
pkgrel=1
pkgdesc="AT&T's KornShell (${_pkgname}) from ast-base, Meson Build"
arch=('x86_64')
url='http://kornshell.org/'
license=('EPL' 'CPL')
depends=('glibc')
makedepends=('gcc' 'git' 'meson')
conflicts=('ksh' 'ksh93')
provides=('ksh')
install='ksh93.install'
source=("${_pkgname}::git+http://github.com/att/ast#branch=master"
'sample.kshrc'
'LICENSE')
sha512sums=('SKIP'
'aeb54cb5ec944628ab64a692d364cab14bbc312c1a892b3692058f7f7b1cf72c95a6bfb4a95ffc3c4ddfb8f8ca4d17707023108d5504f912cb3ceb9e8d4da6b3'
'917ae643f241741919eb7f4633ec7b3cd58fb0d19150a017773562c36b15812bcf5f680024994d546ef18d771ab25aefc4bfe57ebd0c08043c9ad17e9cd7e076')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	meson build
	ninja -C build
}

package() {
  	cd "${srcdir}"
	install -dm 755 "${pkgdir}/usr/share/ksh"
	install -dm 755 "${pkgdir}/usr/share/ksh/functions"
	install -dm 755 "${pkgdir}/usr/share/doc/ksh"
	install -dm 755 "${pkgdir}/usr/share/licenses/ksh"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/ksh/LICENCE"
	install -Dm 644 sample.kshrc "${pkgdir}/etc/skel/.kshrc"
	cd "${srcdir}/$_pkgname"
	install -Dm 644 "src/cmd/${_pkgname}/docs/nval.3" "${pkgdir}/usr/share/man/man3/nval.3"
	install -Dm 644 "src/cmd/${_pkgname}/docs/shell.3" "${pkgdir}/usr/share/man/man3/shell.3"
 	install -Dm 644 "src/cmd/${_pkgname}/docs/ksh.1" "${pkgdir}/usr/share/man/man1/ksh.1"
	local _man
	for _man in 'rksh' 'pfksh'; do
		ln -sf 'ksh.1' "${pkgdir}/usr/share/man/man1/${_man}.1"
	done
	local _fun
	for _fun in 'dirs' 'popd' 'pushd'; do
	install -Dm 644 "src/cmd/${_pkgname}/functions/${_fun}" "${pkgdir}/usr/share/ksh/functions/${_fun}"
	done
	local _dox
	for _dox in 'COMPATIBILITY' 'DESIGN' 'OBSOLETE' 'README' 'RELEASE' 'RELEASE88' 'RELEASE93' 'TYPES'; do
	  install -Dm 644 "src/cmd/${_pkgname}/${_dox}" "${pkgdir}/usr/share/doc/ksh/${_dox}"
	done
	install -Dm 755 "build/src/cmd/${_pkgname}/ksh" "${pkgdir}/usr/bin/ksh"	
	local _exe
	for _exe in 'rksh' 'pfksh'; do
		ln -sf 'ksh' "${pkgdir}/usr/bin/${_exe}"
	done
	install -Dm 755 "build/src/cmd/${_pkgname}/shcomp" "${pkgdir}/usr/bin/shcomp"
}
