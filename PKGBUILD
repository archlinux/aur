# Maintainer: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Adrien Wu <adrien.sf.wu dot gmail at com>
# Contributor: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r1297.9f597d01
pkgrel=1
pkgdesc="KornShell 93u+m, fork based on ksh 93u+"
arch=('x86_64')
url='https://github.com/ksh93/ksh/'
license=('EPL')
depends=('glibc')
makedepends=('git')
conflicts=('ksh' 'ksh93')
provides=('ksh' 'ksh93')
install='ksh93.install'
source=("${_pkgname}::git+http://github.com/ksh93/ksh#branch=dev"
	'sample.kshrc')
sha512sums=('SKIP'
	'f4a65e4181358703fc8905dbff917f966f46e39f8013c116d09e24615dd4676df1a83a037b972e624a1c2360ed803458682b231f657eaef5d55d22ac01d1d8ca')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	test -n "${CFLAGS}" || CFLAGS=-Os      # Fallback to default ksh flags if necessary
	./bin/package make CCFLAGS="${CFLAGS}"
}

package() {
	cd "${srcdir}"
	install -dm0755 "${pkgdir}/usr/share/ksh"
	install -dm0755 "${pkgdir}/usr/share/ksh/functions"
	install -dm0755 "${pkgdir}/usr/share/doc/ksh"
	install -dm0755 "${pkgdir}/usr/share/licenses/ksh"
	install -Dm0644 sample.kshrc "${pkgdir}/etc/skel/.kshrc"
	cd "${srcdir}/$_pkgname"
	install -Dm0644 LICENSE.md "${pkgdir}/usr/share/licenses/ksh/LICENSE.md"
	install -Dm0644 "src/cmd/${_pkgname}/nval.3" "${pkgdir}/usr/share/man/man3/nval.3"
	install -Dm0644 "src/cmd/${_pkgname}/shell.3" "${pkgdir}/usr/share/man/man3/shell.3"
	install -Dm0644 "src/cmd/${_pkgname}/sh.1" "${pkgdir}/usr/share/man/man1/ksh.1"
	for _man in 'ksh93' 'rksh' 'rksh93'; do
		ln -srf "${pkgdir}/usr/share/man/man1/ksh.1" "${pkgdir}/usr/share/man/man1/${_man}.1"
	done
	for _fun in 'autocd' 'man' 'dirs' 'popd' 'pushd'; do
		install -Dm0644 "src/cmd/${_pkgname}/fun/${_fun}" "${pkgdir}/usr/share/ksh/functions/${_fun}"
	done
	for _doc in 'COMPATIBILITY' 'DESIGN' 'OBSOLETE' 'PROMO.mm' 'README' 'README-AUDIT.md' 'RELEASE' 'RELEASE88' 'RELEASE93' 'TYPES'; do
		install -Dm0644 "src/cmd/${_pkgname}/${_doc}" "${pkgdir}/usr/share/doc/ksh/${_doc}"
	done
	install -Dm0755 "arch/linux.i386-64/bin/ksh" "${pkgdir}/usr/bin/ksh"
	for _exe in 'ksh93' 'rksh' 'rksh93'; do
		ln -srf "${pkgdir}/usr/bin/ksh" "${pkgdir}/usr/bin/${_exe}"
	done
	install -Dm0755 "arch/linux.i386-64/bin/shcomp" "${pkgdir}/usr/bin/shcomp"
}
