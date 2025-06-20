# Maintainer: Johnothan King <johnothanking dot protonmail at com>
# Contributor: Adrien Wu <adrien.sf.wu dot gmail at com>
# Contributor: Head_on_a_Stick <matthew.t.hoare dot gmail at com>

_pkgname='ksh93'
pkgname="${_pkgname}-git"
pkgver=r1976.11981f5f
pkgrel=1
pkgdesc="KornShell 93u+m, fork based on ksh 93u+"
arch=('x86_64' 'i686' 'pentium4' 'powerpc64le' 'powerpc64' 'powerpc' 'riscv64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ksh93/ksh/'
license=('EPL')
depends=('libmd')
makedepends=('git' 'linux-api-headers')
conflicts=('ksh' 'ksh93')
provides=('ksh' 'ksh93')
install='ksh93.install'
source=("${_pkgname}::git+https://github.com/ksh93/ksh#branch=dev"
	'sample.kshrc')
sha512sums=('SKIP'
	'252e3253b663dcee91f775d6164b84952e3c4602d9b921c25204bca7d66bc32fc28cf718a8a3ad4f114dabfc70fb8faa5ecf092a0fc893159ce4acb0ddf48ed4')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# 'bin/package install' requires that the file(1) command be functional.
	# The package() function in all PKGBUILD scripts is run in a fakeroot
	# environment, which by default has seccomp restrictions that stop
	# file from operating. To work around this, file is passed the --no-sandbox
	# flag via an alias inserted into the bin/package script.
	sed -i '1s/^/alias file="file --no-sandbox" /' bin/package

	# Notice to the few who actually read the diffs in the PKGBUILDs:
	# The bugfix to patch out the ACE vulnerability has been merged upstream:
	# https://github.com/ksh93/ksh/commit/970812e39c236ff385e440ac6d458d196c237667
}

build() {
	cd "${srcdir}/${_pkgname}"
	# Get rid of any leftover build files (in case makepkg.conf changed).
	rm -rf ./arch
	if ! [[ ${_ksh_pgo} == 1 || ${_ksh_pgo} == yes || ${_ksh_pgo} == true ]] || [[ $CC == clang ]]; then
		export CCFLAGS=${CFLAGS}  # bin/package uses CCFLAGS rather than CFLAGS.
		./bin/package make        # Build ksh (no -j flag because that's still experimental).
	else
		# Optional and experimental: Compile ksh with profile guided optimization (making
		# use of the regression tests) if ${_ksh_pgo} is enabled.
		# Only GCC has been successfully tested; Clang is completely unsupported.
		local save_ccflags=${CFLAGS}
		local save_ldflags=${LDFLAGS}
		# Obtain the number of CPU cores.
		local -i cores=$(bin/package host cpu)
		# Create a temporary directory to use for PGO
		local tmpdir=$(mktemp -d)
		# Build with profiling flags set (-fno-unroll-loops increases overall
		# performance slightly according to my results from shbench).
		local generation_flags="-fprofile-dir=\"${tmpdir}\" -fprofile-generate=\"${tmpdir}\" -fno-unroll-loops"
		local use_flags="-fprofile-dir=\"${tmpdir}\" -fprofile-use=\"${tmpdir}\" -fprofile-correction -fno-unroll-loops -Wno-error=coverage-mismatch"
		export CCFLAGS="${save_ccflags} ${generation_flags}"
		export LDFLAGS="${save_ldflags} ${generation_flags}"
		bin/package make -j${cores}
		# Run the regression tests to profile ksh
		local -i status=0
		./arch/*/bin/ksh bin/shtests -u || status=$?
		# For any curious script readers, the only reason
		# some test failures are tolerated is because ksh's
		# test suite suffers from intermittent test failures
		# (see: https://github.com/ksh93/ksh/issues/344).
		# Regardless, only a few expected possible test failures
		# should be tolerated. Abort if there are too many (or
		# if ksh instantly exited with SIGSEGV/SIGABRT etc.).
		if ((status > 9)); then
			echo "Too many test failures; aborting build..."
			false
		fi
		# Second build after obtaining profiling data
		export CCFLAGS="${save_ccflags} ${use_flags}"
		export LDFLAGS="${save_ldflags} ${use_flags}"
		rm -rf ./arch
		./bin/package make -j${cores}
		# Cleanup PGO artefacts
		rm -r "${tmpdir}"
	fi
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
	local _doc
	for _doc in 'builtins.mm' 'COMPATIBILITY' 'DESIGN' 'OBSOLETE' 'PROMO.mm' 'README' 'README-AUDIT.md' \
			'RELEASE' 'RELEASE88' 'RELEASE93' 'sh.memo' 'TYPES'; do
		install -Dm0644 "src/cmd/${_pkgname}/${_doc}" "${pkgdir}/usr/share/doc/ksh/${_doc}"
	done

	# Create relevant relative symlinks for alternate ksh names
	local _kshname
	for _kshname in 'ksh93' 'rksh' 'rksh93'; do
		ln -sr "${pkgdir}/usr/bin/ksh" "${pkgdir}/usr/bin/${_kshname}"
		ln -sr "${pkgdir}/usr/share/man/man1/ksh.1" "${pkgdir}/usr/share/man/man1/${_kshname}.1"
	done

	# Move ksh-specific /usr/share/fun to /usr/share/ksh/functions
	mv "${pkgdir}/usr/share/fun" "${pkgdir}/usr/share/ksh/functions"
}
