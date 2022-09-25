# Maintainer: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Adrien Wu <adrien.sf.wu dot gmail at com>
# Contributor: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r1291.654461d2
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
	'a9acf3132757b275d4c182e1c262b25ebb578bcd2e40a5963f44be778da9007fb2ce770d0eac1c65a897ae1a359b944180dfc9d037293288111e3dd36b80adb3')

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
	for _man in 'ksh93' 'rksh'; do
		ln -srf 'ksh.1' "${pkgdir}/usr/share/man/man1/${_man}.1"
	done
	for _fun in 'autocd' 'man' 'dirs' 'popd' 'pushd'; do
		install -Dm0644 "src/cmd/${_pkgname}/fun/${_fun}" "${pkgdir}/usr/share/ksh/functions/${_fun}"
	done
	for _doc in 'COMPATIBILITY' 'DESIGN' 'OBSOLETE' 'PROMO.mm' 'README' 'README-AUDIT.md' 'RELEASE' 'RELEASE88' 'RELEASE93' 'TYPES'; do
		install -Dm0644 "src/cmd/${_pkgname}/${_doc}" "${pkgdir}/usr/share/doc/ksh/${_doc}"
	done
	install -Dm0755 "arch/linux.i386-64/bin/ksh" "${pkgdir}/usr/bin/ksh"
	for _exe in 'ksh93' 'rksh'; do
		ln -srf 'ksh' "${pkgdir}/usr/bin/${_exe}"
	done
	install -Dm0755 "arch/linux.i386-64/bin/shcomp" "${pkgdir}/usr/bin/shcomp"
}
