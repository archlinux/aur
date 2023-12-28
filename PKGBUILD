# Maintainer: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Adrien Wu <adrien.sf.wu dot gmail at com>
# Contributor: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r1496.4dacec27
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
	'fbd5721696d08f429a999676340c9e84322517c4c1c519ac58009c00d61fc3b5ef42dfda1b2a385c6950d51df8e79de5fc6a36d9b393e1b2ace19e6b27a83495')

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
	# Folder creation in ${pkgdir}
	install -dm0755 "${pkgdir}/usr/share/ksh/functions"
	install -dm0755 "${pkgdir}/usr/share/doc/ksh"
	install -dm0755 "${pkgdir}/usr/share/licenses/ksh"
	install -dm0755 "${pkgdir}/usr/share/man/man3ast"
	# Install the example kshrc
	install -Dm0644 sample.kshrc "${pkgdir}/etc/skel/.kshrc"

	cd "${srcdir}/$_pkgname"
	# Install license files and documentation
	install -Dm0644 LICENSE.md "${pkgdir}/usr/share/licenses/ksh/LICENSE.md"
	install -Dm0644 COPYRIGHT "${pkgdir}/usr/share/licenses/ksh/COPYRIGHT"
	install -Dm0644 "src/cmd/${_pkgname}/sh.1" "${pkgdir}/usr/share/man/man1/ksh.1"
	for _man in 'ksh93' 'rksh' 'rksh93'; do
		ln -srf "${pkgdir}/usr/share/man/man1/ksh.1" "${pkgdir}/usr/share/man/man1/${_man}.1"
	done
	for _astdoc in ./arch/linux.i386-64/man/man3/*; do
		# To avoid clashes with man pages from other packages, the libast and libshell
		# man pages are installed to a '3ast' section. The default filenames in the
		# repo only have a .3 filename extension, so this is changed to .3ast.
		install -Dm0644 "${_astdoc}" "${pkgdir}/usr/share/man/man3ast/$(basename ${_astdoc})ast"
	done
	for _doc in 'builtins.mm' 'COMPATIBILITY' 'DESIGN' 'OBSOLETE' 'PROMO.mm' 'README' 'README-AUDIT.md' \
			'RELEASE' 'RELEASE88' 'RELEASE93' 'sh.memo' 'TYPES'; do
		install -Dm0644 "src/cmd/${_pkgname}/${_doc}" "${pkgdir}/usr/share/doc/ksh/${_doc}"
	done

	# Install various ksh functions like autocd
	for _fun in 'autocd' 'man' 'dirs' 'popd' 'pushd'; do
		install -Dm0644 "src/cmd/${_pkgname}/fun/${_fun}" "${pkgdir}/usr/share/ksh/functions/${_fun}"
	done

	# Install the ksh and shcomp binaries
	install -Dm0755 "arch/linux.i386-64/bin/ksh" "${pkgdir}/usr/bin/ksh"
	for _exe in 'ksh93' 'rksh' 'rksh93'; do
		ln -srf "${pkgdir}/usr/bin/ksh" "${pkgdir}/usr/bin/${_exe}"
	done
	install -Dm0755 "arch/linux.i386-64/bin/shcomp" "${pkgdir}/usr/bin/shcomp"
}
