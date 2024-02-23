# Maintainer: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Adrien Wu <adrien.sf.wu dot gmail at com>
# Contributor: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r1602.6b624629
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
	'd201874dc09457457a544c8d5d4ddd193ee3384a3af0716daa786fd7dc5aa0660765a42361353e9e828c6b8414af463bc14f3c7398333bb6c6cc19549b7855ac')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# Build with SHOPT_ALL_LIBCMD (aka enable all ksh builtins) if
	# ${_all_libcmd} is set to '1' or 'yes'.
	if [[ ${_all_libcmd} == 1 || ${_all_libcmd} == yes ]]; then
		sed -i 's/ALL_LIBCMD=0/ALL_LIBCMD=1/g' src/cmd/ksh93/SHOPT.sh
	fi
}

build() {
	cd "${srcdir}/${_pkgname}"
	test -n "${CFLAGS}" || CFLAGS=-O2  # This generic fallback is only used when necessary.
	rm -rf ./arch  # Get rid of any leftover build files, in case the flags in makepkg.conf changed.
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
	for _fun in 'autocd' 'cd' 'dirs' 'man' 'mcd' 'popd' 'pushd'; do
		install -Dm0644 "src/cmd/${_pkgname}/fun/${_fun}" "${pkgdir}/usr/share/ksh/functions/${_fun}"
	done

	# Install the ksh and shcomp binaries
	install -Dm0755 "arch/linux.i386-64/bin/ksh" "${pkgdir}/usr/bin/ksh"
	for _exe in 'ksh93' 'rksh' 'rksh93'; do
		ln -srf "${pkgdir}/usr/bin/ksh" "${pkgdir}/usr/bin/${_exe}"
	done
	install -Dm0755 "arch/linux.i386-64/bin/shcomp" "${pkgdir}/usr/bin/shcomp"
}
