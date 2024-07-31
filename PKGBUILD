# Maintainer: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Adrien Wu <adrien.sf.wu dot gmail at com>
# Contributor: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r1732.42b9a09e
pkgrel=1
pkgdesc="KornShell 93u+m, fork based on ksh 93u+"
arch=('x86_64' 'i686' 'pentium4' 'powerpc64le' 'powerpc64' 'powerpc' 'riscv64' 'arm' 'armv6h' 'armv7h' 'aarch64')
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
	# 'bin/package install' requires that the file(1) command be functional.
	# The package() function in all PKGBUILD scripts is run in a fakeroot
	# environment, which by default has seccomp restrictions that stop
	# file from operating. To work around this, file is passed the --no-sandbox
	# flag via an alias inserted into the bin/package script.
	sed -i '1s/^/alias file="file --no-sandbox" /' bin/package
}

build() {
	cd "${srcdir}/${_pkgname}"
	rm -rf ./arch               # Get rid of any leftover build files (in case makepkg.conf changed)
	export CCFLAGS="${CFLAGS}"  # bin/package uses CCFLAGS rather than CFLAGS
	./bin/package make          # Build ksh
}

package() {
	# Folder creation in ${pkgdir}
	cd "${srcdir}"
	install -dm0755 "${pkgdir}/etc/skel"
	install -dm0755 "${pkgdir}/usr/share/ksh"
	install -dm0755 "${pkgdir}/usr/share/doc/ksh"
	install -dm0755 "${pkgdir}/usr/share/licenses/ksh"

	# Install the example kshrc provided with the PKGBUILD
	install -Dm0644 sample.kshrc "${pkgdir}/etc/skel/.kshrc"

	# Use the bin/package script to install the core components of ksh + man pages
	cd "${srcdir}/$_pkgname"
	./bin/package install "${pkgdir}/usr"

	# Install license files and additional documentation
	install -Dm0644 LICENSE.md "${pkgdir}/usr/share/licenses/ksh/LICENSE.md"
	install -Dm0644 COPYRIGHT "${pkgdir}/usr/share/licenses/ksh/COPYRIGHT"
	for _doc in 'builtins.mm' 'COMPATIBILITY' 'DESIGN' 'OBSOLETE' 'PROMO.mm' 'README' 'README-AUDIT.md' \
			'RELEASE' 'RELEASE88' 'RELEASE93' 'sh.memo' 'TYPES'; do
		install -Dm0644 "src/cmd/${_pkgname}/${_doc}" "${pkgdir}/usr/share/doc/ksh/${_doc}"
	done

	# Create relevant relative symlinks for alternate ksh names
	for _kshname in 'ksh93' 'rksh' 'rksh93'; do
		ln -srf "${pkgdir}/usr/bin/ksh" "${pkgdir}/usr/bin/${_kshname}"
		ln -srf "${pkgdir}/usr/share/man/man1/ksh.1" "${pkgdir}/usr/share/man/man1/${_kshname}.1"
	done

	# Move ksh-specific /usr/share/fun to /usr/share/ksh/functions
	mv "${pkgdir}/usr/share/fun" "${pkgdir}/usr/share/ksh/functions"
}
