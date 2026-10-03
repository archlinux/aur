# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='gcc17'
pkgver='17.0.0.snapshot20260927'
_snapshot='17-20260927'
_testsuite_contract_snapshot='17-20260927'
pkgrel=1
pkgdesc='GNU Compiler Collection 17 C/C++ development snapshot for parallel compiler validation'
arch=('x86_64')
license=(
	'GPL-3.0-or-later WITH GCC-exception-3.1'
	'GFDL-1.3-or-later'
)
url='https://gcc.gnu.org'
depends=(
	'gmp'
	'libisl.so'
	'libmpc'
	'mpfr'
	'zlib'
	'zstd'
)
makedepends=(
	'doxygen'
	'graphviz'
	'patchelf'
	'python'
)
checkdepends=(
	'dejagnu'
	'expect'
	'inetutils'
	'python-pytest'
	'tcl'
)
options=(
	'!emptydirs'
	'!lto'
	'staticlibs'
)
_libdir="usr/lib/gcc/${CHOST}/${pkgver%%.snapshot*}"
source=(
	"gcc-${_snapshot}.tar.xz::https://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.xz"
	'check-memlock.py'
)
sha512sums=(
	'14526b6287dfa0197ebb4c5b56c6a68c92f44062cdc87d2391c8d5d04b0e01fcda94ac370f70c4f13a11a110f04a36ed2b792b64f791ca996c4e1df646ec71b6'
	'SKIP'
)
b2sums=(
	'SKIP'
	'bc20b249bc2aaf014832e3cb4f57e4d2b2be6b386ace28d561d4370587770ef667b0aa5063ac49bd5d222b2e1bbc81f3815e16906d5a02c7e3a661e98cae8b39'
)

_insert_test_skip() {
	local _dg_do_count
	local _directive=$1
	local _file=$2

	if grep -qxF -- "${_directive}" "${_file}"; then
		return 0
	fi

	_dg_do_count=$(grep -cF '{ dg-do ' "${_file}")
	if (( _dg_do_count != 1 )); then
		printf 'Expected exactly one dg-do directive in %s, found %d\n' "${_file}" "${_dg_do_count}" >&2
		return 1
	fi
	sed -i "/{ dg-do /a\\${_directive}" "${_file}" || return 1
}

_insert_implicit_compile_skip() {
	local _directive=$1
	local _file=$2

	if grep -qxF -- "${_directive}" "${_file}"; then
		return 0
	fi
	if grep -qF '{ dg-do ' "${_file}"; then
		printf 'Expected no dg-do directive in implicit-compile test: %s\n' "${_file}" >&2
		return 1
	fi
	sed -i "1i\\${_directive}" "${_file}" || return 1
}

_insert_test_additional_options() {
	local _dg_options_count
	local _directive=$1
	local _file=$2

	if grep -qxF -- "${_directive}" "${_file}"; then
		return 0
	fi
	_dg_options_count=$(grep -cF '{ dg-options ' "${_file}")
	if (( _dg_options_count != 1 )); then
		printf 'Expected exactly one dg-options directive in %s, found %d\n' "${_file}" "${_dg_options_count}" >&2
		return 1
	fi
	sed -i "/{ dg-options /a\\${_directive}" "${_file}" || return 1
}

_require_testsuite_count() {
	local _actual _matches
	local _file=$1
	local _label=$2
	local _expected=$3

	_matches=$(grep -Ec "^# of ${_label}[[:space:]]+[0-9]+$" "${_file}" || true)
	if (( _matches == 0 )); then
		_actual=0
	elif (( _matches == 1 )); then
		_actual=$(awk -v label="# of ${_label}" '$0 ~ "^" label "[[:space:]]+" { print $NF }' "${_file}")
	else
		printf 'Expected at most one testsuite count for %s in %s, found %d\n' "${_label}" "${_file}" "${_matches}" >&2
		return 1
	fi
	if [[ ! ${_actual} =~ ^[0-9]+$ ]] || (( _actual != _expected )); then
		printf 'Unexpected testsuite count in %s: %s=%s, expected %d\n' \
			"${_file}" "${_label}" "${_actual}" "${_expected}" >&2
		return 1
	fi
}

prepare() {
	local _default_option_test _guality_skip _libbacktrace_count _libbacktrace_file
	local _libbacktrace_assignment='strippedtest_LDFLAGS = $(libbacktrace_testing_ldflags) -static -Wl,-Bstatic'
	local _default_pie_options='/* { dg-additional-options "-fno-pie -no-pie" } */'
	local _default_pie_ssp_options='/* { dg-additional-options "-fno-pie -no-pie -fno-stack-protector" } */'
	local _default_ssp_options='/* { dg-additional-options "-fno-stack-protector" } */'
	local _default_pie_tests=(
		'gcc.target/i386/builtin-memmove-12.c'
		'gcc.target/i386/memset-pr70308-1b.c'
		'gcc.target/i386/postreload-implicit-set-1.c'
		'gcc.target/i386/pr122343-4a.c'
		'gcc.target/i386/pr125355-2.c'
		'gcc.target/i386/pr125355.c'
		'gcc.target/i386/pr125893-2.c'
		'gcc.target/i386/pr125893-4.c'
		'gcc.target/i386/pr125893-5.c'
		'gcc.target/i386/pr125893-6.c'
		'gcc.target/i386/pr126784-4.c'
		'gcc.target/i386/preserve-none-31a.c'
		'gcc.target/i386/preserve-none-33a.c'
		'gcc.target/i386/preserve-none-34a.c'
		'gcc.target/i386/preserve-none-36a.c'
		'gcc.target/i386/preserve-none-36b.c'
		'gcc.target/i386/preserve-none-36c.c'
		'gcc.target/i386/preserve-none-36d.c'
		'gcc.target/i386/preserve-none-36e.c'
		'gcc.target/i386/preserve-none-36f.c'
		'gcc.target/i386/preserve-none-36g.c'
		'gcc.target/i386/preserve-none-37a.c'
		'gcc.target/i386/preserve-none-37b.c'
		'gcc.target/i386/preserve-none-37c.c'
		'gcc.target/i386/preserve-none-37d.c'
		'gcc.target/i386/preserve-none-37e.c'
		'gcc.target/i386/preserve-none-37f.c'
		'gcc.target/i386/preserve-none-37g.c'
		'gcc.target/i386/preserve-none-37h.c'
		'gcc.target/i386/preserve-none-37i.c'
		'gcc.target/i386/preserve-none-37j.c'
		'g++.target/i386/mvc-symbols1.C'
		'g++.target/i386/mvc-symbols3.C'
		'g++.target/i386/mv-symbols1.C'
		'g++.target/i386/mv-symbols3.C'
		'g++.target/i386/mv-symbols4.C'
		'g++.target/i386/mv-symbols5.C'
	)
	local _default_pie_ssp_tests=(
		'gcc.target/i386/preserve-none-35a.c'
		'gcc.target/i386/preserve-none-35b.c'
		'gcc.target/i386/preserve-none-35c.c'
		'gcc.target/i386/preserve-none-35d.c'
		'gcc.target/i386/preserve-none-35e.c'
		'gcc.target/i386/preserve-none-35f.c'
		'gcc.target/i386/preserve-none-35g.c'
	)
	local _default_ssp_tests=(
		'g++.target/i386/pr112824-2.C'
	)
	local _guality_skips=(
		'gcc.dg/guality/loop-1.c'
		'gcc.dg/guality/pr43051-1.c'
		'gcc.dg/guality/pr43593.c'
		'gcc.dg/guality/pr54519-1.c'
		'gcc.dg/guality/pr54519-2.c'
		'gcc.dg/guality/pr54519-3.c'
		'gcc.dg/guality/pr54519-4.c'
		'gcc.dg/guality/pr54519-5.c'
		'gcc.dg/guality/pr54519-6.c'
		'gcc.dg/guality/pr54693-2.c'
		'gcc.dg/guality/pr54796.c'
		'gcc.dg/guality/pr56154-1.c'
		'gcc.dg/guality/pr59776.c'
		'gcc.dg/guality/sra-1.c'
		'gcc.dg/guality/vla-1.c'
		'gcc.dg/guality/vla-2.c'
		'g++.dg/guality/pr55665.C'
	)

	cd -- "${srcdir}/gcc-${_snapshot}" || return 1

	# This package carries snapshot-specific test classifications. Force an
	# explicit review whenever the upstream snapshot changes instead of silently
	# carrying forward skips, XFAILs, or expected-XPASS assumptions.
	if [[ ${_snapshot} != "${_testsuite_contract_snapshot}" ]]; then
		printf 'GCC testsuite contract needs review for snapshot %s (validated for %s)\n' \
			"${_snapshot}" "${_testsuite_contract_snapshot}" >&2
		return 1
	fi

	# Do not run fixincludes.
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

	# Arch Linux installs 64-bit libraries in /usr/lib.
	sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

	# libbacktrace's strippedtest asks libtool for -static and also passes
	# -Wl,-Bstatic. With GCC configured for default PIE, libtool consumes the
	# driver-level -static and leaves GCC to create a PIE containing static
	# glibc plus PT_INTERP, which crashes before main(). Force only this test
	# to non-PIE so it becomes the fully static ET_EXEC upstream intended.
	for _libbacktrace_file in libbacktrace/Makefile.am libbacktrace/Makefile.in; do
		if grep -qF -- "${_libbacktrace_assignment} -no-pie" "${_libbacktrace_file}"; then
			continue
		fi
		_libbacktrace_count=$(grep -cF -- "${_libbacktrace_assignment}" "${_libbacktrace_file}")
		if (( _libbacktrace_count != 1 )); then
			printf 'Expected exactly one libbacktrace strippedtest LDFLAGS assignment in %s, found %d\n' \
				"${_libbacktrace_file}" "${_libbacktrace_count}" >&2
			return 1
		fi
		sed -i '/strippedtest_LDFLAGS = /s/$/ -no-pie/' "${_libbacktrace_file}" || return 1
	done

	# Do not run longstanding upstream guality failures during package QA.
	# GCC PR testsuite/125766 tracks this class of failures:
	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=125766
	for _guality_skip in "${_guality_skips[@]}"; do
		_insert_test_skip \
			'/* { dg-skip-if "Known upstream guality failure; GCC PR testsuite/125766" { *-*-* } } */' \
			"gcc/testsuite/${_guality_skip}" || return 1
	done

	# These nested-crash diagnostics tests are tracked by GCC PR diagnostics/121876.
	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121876
	for _guality_skip in \
		'gcc.dg/plugin/crash-test-nested-ice.c' \
		'gcc.dg/plugin/crash-test-nested-write-through-null.c'; do
		_insert_test_skip \
			'/* { dg-skip-if "Known upstream nested-crash diagnostics failure; GCC PR diagnostics/121876" { *-*-* } } */' \
			"gcc/testsuite/${_guality_skip}" || return 1
	done

	# Three additional failures are still present in GCC's x86_64 result for the
	# 20260927 snapshot track, independent of this package's build environment:
	# https://gcc.gnu.org/pipermail/gcc-testresults/2026-September/888222.html
	_insert_implicit_compile_skip \
		'/* { dg-skip-if "Known upstream 17-20260927 x86_64 testsuite failure" { *-*-* } } */' \
		gcc/testsuite/c-c++-common/analyzer/omp-parallel-for-1.c || return 1
	for _guality_skip in \
		'gcc.target/i386/pr115102.c' \
		'gcc.target/i386/xchg-4.c'; do
		_insert_test_skip \
			'/* { dg-skip-if "Known upstream 17-20260927 x86_64 testsuite failure" { *-*-* } } */' \
			"gcc/testsuite/${_guality_skip}" || return 1
	done

	# This compiler intentionally enables default PIE and SSP. A small set of
	# upstream tests assumes those defaults are off when checking exact assembly
	# or stack layout. Adapt only those tests; a global TEST_ALWAYS_FLAGS override
	# breaks tests such as -fhardened that are explicitly meant to observe the
	# configured defaults.
	for _default_option_test in "${_default_pie_tests[@]}"; do
		_insert_test_additional_options \
			"${_default_pie_options}" \
			"gcc/testsuite/${_default_option_test}" || return 1
	done
	for _default_option_test in "${_default_pie_ssp_tests[@]}"; do
		_insert_test_additional_options \
			"${_default_pie_ssp_options}" \
			"gcc/testsuite/${_default_option_test}" || return 1
	done
	for _default_option_test in "${_default_ssp_tests[@]}"; do
		_insert_test_additional_options \
			"${_default_ssp_options}" \
			"gcc/testsuite/${_default_option_test}" || return 1
	done

	# ssa-sink-18 currently has no GCC Bugzilla PR. Upstream explicitly records
	# that the architecture-independent ivopts change makes this test fail and
	# discusses marking it XFAIL here:
	# https://gcc.gnu.org/pipermail/gcc-patches/2026-June/719949.html
	_insert_test_skip \
		'/* { dg-skip-if "Known upstream ssa-sink-18 testsuite failure; see gcc-patches/719949" { *-*-* } } */' \
		gcc/testsuite/gcc.dg/tree-ssa/ssa-sink-18.c || return 1

	mkdir -p -- "${srcdir}/gcc-build"
}

_build_gcc() {
	local _file_prefix_map="-ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}"
	local _confflags=(
		'--prefix=/usr'
		'--libdir=/usr/lib'
		'--libexecdir=/usr/lib'
		'--mandir=/usr/share/man'
		'--infodir=/usr/share/info'
		'--with-bugurl=https://aur.archlinux.org/packages/gcc17'
		'--with-linker-hash-style=gnu'
		'--with-system-zlib'
		'--enable-__cxa_atexit'
		'--enable-cet=auto'
		'--enable-checking=release'
		'--enable-clocale=gnu'
		'--enable-default-pie'
		'--enable-default-ssp'
		'--enable-gnu-indirect-function'
		'--enable-gnu-unique-object'
		'--enable-libstdcxx-backtrace'
		'--enable-link-serialization=1'
		'--enable-linker-build-id'
		'--enable-lto'
		'--with-build-config=bootstrap-lto-lean'
		'--disable-multilib'
		'--enable-plugin'
		'--enable-shared'
		'--enable-threads=posix'
		'--disable-libssp'
		'--disable-libstdcxx-pch'
		'--disable-werror'
		'--program-suffix=-17'
		'--enable-version-specific-runtime-libs'
		"--with-specs=%{!static:-Wl,-rpath,/${_libdir}}"
	)

	cd -- "${srcdir}/gcc-build" || return 1

	CFLAGS=${CFLAGS/-Werror=format-security/}
	CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
	# GCC runtimes such as libitm and libsanitizer deliberately add
	# -fno-exceptions. A global -fexceptions appears later in their compile
	# command and overrides that component-specific requirement.
	CXXFLAGS=${CXXFLAGS/-fexceptions/}
	CFLAGS+=" ${_file_prefix_map}"
	CXXFLAGS+=" ${_file_prefix_map}"

	"../gcc-${_snapshot}/configure" \
		--enable-languages=c,c++ \
		--enable-bootstrap \
		"${_confflags[@]:?_confflags unset}"

	make -O \
		STAGE1_CFLAGS="-O2 ${_file_prefix_map}" \
		BOOT_CFLAGS="${CFLAGS}" \
		BOOT_LDFLAGS="${LDFLAGS}" \
		LDFLAGS_FOR_TARGET="${LDFLAGS}" \
		profiledbootstrap

	make -O -C "${CHOST}/libstdc++-v3/doc" doc-man-doxygen
}

build() {
	_build_gcc
}

check() {
	local _check_cflags _check_cxxflags _check_target_cflags _check_target_cxxflags _entry _memlock_status _sum _symbols _xpass_count _xpass_index
	local -a _actual_xpass
	local _memlock_skip='/* { dg-skip-if "mlock unavailable in test environment" { *-*-* } } */'
	local _expected_xpass=(
		'XPASS: gcc.dg/guality/example.c -O0 execution test'
		'XPASS: gcc.dg/guality/example.c -O1 -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/example.c -Og -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -O0 execution test'
		'XPASS: gcc.dg/guality/guality.c -O1 -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -O2 -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -O2 -flto -fno-use-linker-plugin -flto-partition=none -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -O2 -flto -fuse-linker-plugin -fno-fat-lto-objects -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -O3 -g -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -Og -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/guality.c -Os -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/inline-params.c -O2 -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/inline-params.c -O2 -flto -fno-use-linker-plugin -flto-partition=none -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/inline-params.c -O2 -flto -fuse-linker-plugin -fno-fat-lto-objects -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/inline-params.c -O3 -g -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/inline-params.c -Os -DPREVENT_OPTIMIZATION execution test'
		'XPASS: gcc.dg/guality/pr41353-1.c -O1 -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.dg/guality/pr41353-1.c -O2 -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.dg/guality/pr41353-1.c -O2 -flto -fno-use-linker-plugin -flto-partition=none -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.dg/guality/pr41353-1.c -O2 -flto -fuse-linker-plugin -fno-fat-lto-objects -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.dg/guality/pr41353-1.c -O3 -g -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.dg/guality/pr41353-1.c -Og -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.dg/guality/pr41353-1.c -Os -DPREVENT_OPTIMIZATION line 28 j == 28 + 37'
		'XPASS: gcc.target/i386/pr89618-2.c scan-tree-dump vect "loop vectorized using 16 byte vectors"'
	)
	local _no_gxx_shared=(
		"${CHOST}/libitm/.libs/libitm.so"
		"${CHOST}/libsanitizer/asan/.libs/libasan.so"
		"${CHOST}/libsanitizer/hwasan/.libs/libhwasan.so"
		"${CHOST}/libsanitizer/lsan/.libs/liblsan.so"
		"${CHOST}/libsanitizer/tsan/.libs/libtsan.so"
		"${CHOST}/libsanitizer/ubsan/.libs/libubsan.so"
	)
	local _no_gxx_static=(
		"${CHOST}/libitm/.libs/libitm.a"
		"${CHOST}/libsanitizer/asan/.libs/libasan.a"
		"${CHOST}/libsanitizer/hwasan/.libs/libhwasan.a"
		"${CHOST}/libsanitizer/lsan/.libs/liblsan.a"
		"${CHOST}/libsanitizer/tsan/.libs/libtsan.a"
		"${CHOST}/libsanitizer/ubsan/.libs/libubsan.a"
	)
	local _pinned_tests=(
		'libgomp.c/alloc-pinned-1.c'
		'libgomp.c/alloc-pinned-2.c'
		'libgomp.c/alloc-pinned-5.c'
		'libgomp.c/alloc-pinned-8.c'
		'libgomp.c++/allocator-1.C'
		'libgomp.c++/allocator-2.C'
	)
	local _suites=(
		'gcc/testsuite/gcc/gcc.sum'
		'gcc/testsuite/g++/g++.sum'
		"${CHOST}/libatomic/testsuite/libatomic.sum"
		"${CHOST}/libgomp/testsuite/libgomp.sum"
		"${CHOST}/libitm/testsuite/libitm.sum"
		"${CHOST}/libstdc++-v3/testsuite/libstdc++.sum"
	)

	cd -- "${srcdir}/gcc-build" || return 1

	# The pinned allocator tests require a working mlock syscall. Sandboxes such
	# as makechrootpkg's systemd-nspawn can deny @memlock via seccomp even when
	# RLIMIT_MEMLOCK is sufficient. Probe the required capability directly
	# instead of guessing from container markers so this remains correct for
	# other sandboxes and future nspawn configurations.
	# Always remove our environment-specific directive first. This makes check()
	# safe to rerun in a reused srcdir after moving between restricted and
	# unrestricted environments.
	for _entry in "${_pinned_tests[@]}"; do
		sed -i '/dg-skip-if "mlock unavailable in test environment"/d' \
			"${srcdir}/gcc-${_snapshot}/libgomp/testsuite/${_entry}" || return 1
	done

	if python "${srcdir}/check-memlock.py"; then
		_memlock_status=0
	else
		_memlock_status=$?
	fi
	case ${_memlock_status} in
		0)
			;;
		77)
			printf 'Skipping libgomp pinned allocator tests: mlock is unavailable in this test environment\n' >&2
			for _entry in "${_pinned_tests[@]}"; do
				_insert_test_skip \
					"${_memlock_skip}" \
					"${srcdir}/gcc-${_snapshot}/libgomp/testsuite/${_entry}" || return 1
			done
			;;
		*)
			printf 'Unexpected memlock probe failure: exit status %d\n' "${_memlock_status}" >&2
			return 1
			;;
	esac

	# Package build flags describe the shipped compiler build, not the testsuite
	# programs. Keep test helpers and target runtimes on a neutral optimization
	# baseline. Tests that require upstream's non-PIE/non-SSP defaults are
	# adapted individually in prepare() so tests of configured defaults remain
	# meaningful.
	_check_cflags='-O2'
	_check_cxxflags='-O2'
	_check_target_cflags='-g -O2'
	_check_target_cxxflags='-g -O2 -D_GNU_SOURCE -Wno-aggressive-loop-optimizations'

	# Run every test except the explicitly documented upstream-known and
	# environment-specific skips. Any remaining FAIL, ERROR, or UNRESOLVED is a
	# package QA failure. Known upstream XPASS results are tracked separately
	# below so a new unexpected-success class also requires review.
	# Remove previous summaries first so a failed rerun cannot satisfy the QA
	# contract with stale evidence from an older test execution.
	rm -f -- "${_suites[@]}"
	make -O -k \
		CFLAGS="${_check_cflags}" \
		CXXFLAGS="${_check_cxxflags}" \
		CFLAGS_FOR_TARGET="${_check_target_cflags}" \
		CXXFLAGS_FOR_TARGET="${_check_target_cxxflags}" \
		check || true

	# Restore the extracted source tree after the environment-specific test
	# adaptation. The pre-run cleanup above still protects interrupted reruns.
	for _entry in "${_pinned_tests[@]}"; do
		sed -i '/dg-skip-if "mlock unavailable in test environment"/d' \
			"${srcdir}/gcc-${_snapshot}/libgomp/testsuite/${_entry}" || return 1
	done

	for _entry in "${_no_gxx_shared[@]}"; do
		if [[ ! -s "${_entry}" ]]; then
			printf 'Missing GCC runtime for C++ personality check: %s\n' "${_entry}" >&2
			return 1
		fi
		if ! _symbols=$(readelf -Ws "${_entry}"); then
			printf 'Unable to read GCC runtime symbols: %s\n' "${_entry}" >&2
			return 1
		fi
		if grep -q 'UND __gxx_personality_v0' <<<"${_symbols}"; then
			printf 'GCC runtime unexpectedly depends on the C++ exception personality: %s\n' "${_entry}" >&2
			return 1
		fi
	done
	for _entry in "${_no_gxx_static[@]}"; do
		if [[ ! -s "${_entry}" ]]; then
			printf 'Missing static GCC runtime for C++ personality check: %s\n' "${_entry}" >&2
			return 1
		fi
		if ! _symbols=$(nm -u "${_entry}"); then
			printf 'Unable to read static GCC runtime symbols: %s\n' "${_entry}" >&2
			return 1
		fi
		if grep -q ' U __gxx_personality_v0$' <<<"${_symbols}"; then
			printf 'Static GCC runtime unexpectedly depends on the C++ exception personality: %s\n' "${_entry}" >&2
			return 1
		fi
	done

	for _entry in "${_suites[@]}"; do
		_sum=${_entry}
		if [[ ! -s "${_sum}" ]]; then
			printf 'Missing GCC testsuite summary: %s\n' "${_sum}" >&2
			return 1
		fi
		if ! grep -q '^# of expected passes' "${_sum}"; then
			printf 'Incomplete GCC testsuite summary: %s\n' "${_sum}" >&2
			return 1
		fi
		if grep -Eq '^(FAIL|ERROR|UNRESOLVED):' "${_sum}"; then
			printf 'Unexpected GCC testsuite result in %s:\n' "${_sum}" >&2
			grep -E '^(FAIL|ERROR|UNRESOLVED):' "${_sum}" >&2
			return 1
		fi
	done

	# Pin the aggregate outcome counts for this exact snapshot. This catches
	# harness or dependency drift that silently turns large parts of a suite
	# into UNSUPPORTED while still producing a superficially successful summary.
	_require_testsuite_count gcc/testsuite/g++/g++.sum 'expected passes' 280053 || return 1
	_require_testsuite_count gcc/testsuite/g++/g++.sum 'expected failures' 2534 || return 1
	_require_testsuite_count gcc/testsuite/g++/g++.sum 'unsupported tests' 2071 || return 1
	_require_testsuite_count gcc/testsuite/gcc/gcc.sum 'expected passes' 228642 || return 1
	_require_testsuite_count gcc/testsuite/gcc/gcc.sum 'unexpected successes' 24 || return 1
	_require_testsuite_count gcc/testsuite/gcc/gcc.sum 'expected failures' 1641 || return 1
	_require_testsuite_count gcc/testsuite/gcc/gcc.sum 'unsupported tests' 4324 || return 1
	_require_testsuite_count "${CHOST}/libatomic/testsuite/libatomic.sum" 'expected passes' 54 || return 1
	_require_testsuite_count "${CHOST}/libatomic/testsuite/libatomic.sum" 'expected failures' 0 || return 1
	_require_testsuite_count "${CHOST}/libatomic/testsuite/libatomic.sum" 'unsupported tests' 0 || return 1
	if (( _memlock_status == 77 )); then
		_require_testsuite_count "${CHOST}/libgomp/testsuite/libgomp.sum" 'expected passes' 6376 || return 1
		_require_testsuite_count "${CHOST}/libgomp/testsuite/libgomp.sum" 'unsupported tests' 510 || return 1
	else
		# The unrestricted baseline executes the six pinned allocator tests:
		# compared with the sandboxed result this adds 12 PASS and removes
		# six UNSUPPORTED entries.
		_require_testsuite_count "${CHOST}/libgomp/testsuite/libgomp.sum" 'expected passes' 6388 || return 1
		_require_testsuite_count "${CHOST}/libgomp/testsuite/libgomp.sum" 'unsupported tests' 504 || return 1
	fi
	_require_testsuite_count "${CHOST}/libgomp/testsuite/libgomp.sum" 'expected failures' 47 || return 1
	_require_testsuite_count "${CHOST}/libitm/testsuite/libitm.sum" 'expected passes' 44 || return 1
	_require_testsuite_count "${CHOST}/libitm/testsuite/libitm.sum" 'expected failures' 3 || return 1
	_require_testsuite_count "${CHOST}/libitm/testsuite/libitm.sum" 'unsupported tests' 1 || return 1
	_require_testsuite_count "${CHOST}/libstdc++-v3/testsuite/libstdc++.sum" 'expected passes' 20021 || return 1
	_require_testsuite_count "${CHOST}/libstdc++-v3/testsuite/libstdc++.sum" 'expected failures' 129 || return 1
	_require_testsuite_count "${CHOST}/libstdc++-v3/testsuite/libstdc++.sum" 'unsupported tests' 831 || return 1

	# Compare every normalized XPASS line for this snapshot. Pinning only the
	# total and file names would allow a newly introduced XPASS to replace a
	# resolved one in the same source file without failing QA.
	mapfile -t _actual_xpass < <(
		grep '^XPASS:' gcc/testsuite/gcc/gcc.sum |
			sed -E 's/[[:space:]]+/ /g; s/ $//' |
			LC_ALL=C sort
	)
	_xpass_count=${#_actual_xpass[@]}
	if (( _xpass_count != ${#_expected_xpass[@]} )); then
		printf 'Expected %d known GCC XPASS results, found %d\n' \
			"${#_expected_xpass[@]}" "${_xpass_count}" >&2
		printf 'Actual normalized XPASS results:\n' >&2
		printf '%s\n' "${_actual_xpass[@]}" >&2
		return 1
	fi
	for (( _xpass_index = 0; _xpass_index < _xpass_count; ++_xpass_index )); do
		if [[ ${_actual_xpass[${_xpass_index}]} != "${_expected_xpass[${_xpass_index}]}" ]]; then
			printf 'Unexpected GCC XPASS at index %d:\nexpected: %s\nactual:   %s\n' \
				"${_xpass_index}" \
				"${_expected_xpass[${_xpass_index}]}" \
				"${_actual_xpass[${_xpass_index}]}" >&2
			return 1
		fi
	done
	
	for _sum in \
		gcc/testsuite/g++/g++.sum \
		"${CHOST}/libatomic/testsuite/libatomic.sum" \
		"${CHOST}/libgomp/testsuite/libgomp.sum" \
		"${CHOST}/libitm/testsuite/libitm.sum" \
		"${CHOST}/libstdc++-v3/testsuite/libstdc++.sum"; do
		if grep -q '^XPASS:' "${_sum}"; then
			printf 'Unexpected XPASS result in %s:\n' "${_sum}" >&2
			grep '^XPASS:' "${_sum}" >&2
			return 1
		fi
	done

	if (( _memlock_status == 77 )); then
		for _entry in "${_pinned_tests[@]}"; do
			if ! grep -qFx -- "UNSUPPORTED: ${_entry}" "${CHOST}/libgomp/testsuite/libgomp.sum"; then
				printf 'Expected libgomp pinned allocator test to be unsupported: %s\n' "${_entry}" >&2
				return 1
			fi
		done
	fi

	"${srcdir}/gcc-${_snapshot}/contrib/test_summary"
}


package() {
	local binary _manpage _py_count _pyc_count _runtime _tool

	cd -- "${srcdir}/gcc-build" || return 1

	make -C gcc DESTDIR="${pkgdir}" \
		install-driver \
		install-cpp \
		install-gcc-ar \
		c++.install-common \
		install-headers \
		install-plugin \
		install-lto-wrapper

	# Keep GCC's user-facing auxiliary tools parallel-installable as well.
	for _tool in gcov gcov-tool gcov-dump lto-dump; do
		install -Dm755 -- "gcc/${_tool}" "${pkgdir}/usr/bin/${_tool}-17"
		[[ -s "${pkgdir}/usr/bin/${_tool}-17" ]] || return 1
	done

	# install-man applies --program-suffix=-17 to command manpages. GCC also
	# installs generic license man7 pages; keep those owned by the system GCC.
	make -C gcc DESTDIR="${pkgdir}" install-man
	rm -f -- "${pkgdir}/usr/share/man/man7/"{fsf-funding,gfdl,gpl}.7
	if find "${pkgdir}/usr/share/man/man7" -type f -print -quit | grep -q .; then
		printf 'Unexpected unversioned GCC man7 page installed\n' >&2
		return 1
	fi
	rmdir -- "${pkgdir}/usr/share/man/man7" || return 1
	for _manpage in gcc g++ cpp gcov gcov-tool gcov-dump lto-dump; do
		[[ -s "${pkgdir}/usr/share/man/man1/${_manpage}-17.1" ]] || return 1
	done
	if find "${pkgdir}/usr/share/man/man1" -type f ! -name '*-17.1' -print -quit | grep -q .; then
		printf 'Unexpected unversioned GCC man1 page installed\n' >&2
		return 1
	fi

	install -m755 -t "${pkgdir}/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1,gcov,gcov-tool}

	make -C "${CHOST}/libgcc" DESTDIR="${pkgdir}" install
	mv -- "${pkgdir}/${_libdir}"/../lib/* "${pkgdir}/${_libdir}"
	rmdir -- "${pkgdir}/${_libdir}"/../lib

	make -C "${CHOST}/libstdc++-v3/src" DESTDIR="${pkgdir}" install
	make -C "${CHOST}/libstdc++-v3/include" DESTDIR="${pkgdir}" install
	make -C "${CHOST}/libstdc++-v3/libsupc++" DESTDIR="${pkgdir}" install
	make -C "${CHOST}/libstdc++-v3/python" DESTDIR="${pkgdir}" install

	# Keep GCC 17's shared runtimes in its compiler-specific directory. This is
	# the layout provided by --enable-version-specific-runtime-libs.
	make -C "${CHOST}/libatomic" DESTDIR="${pkgdir}" install-asneeded
	[[ -s "${pkgdir}/${_libdir}/libatomic_asneeded.so" ]] || return 1
	[[ -L "${pkgdir}/${_libdir}/libatomic_asneeded.a" ]] || return 1
	make -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES
	make -C "${CHOST}/libitm" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES
	make -C "${CHOST}/libsanitizer/asan" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES
	make -C "${CHOST}/libsanitizer/hwasan" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES
	make -C "${CHOST}/libsanitizer/lsan" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES
	make -C "${CHOST}/libsanitizer/tsan" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES
	make -C "${CHOST}/libsanitizer/ubsan" DESTDIR="${pkgdir}" install-toolexeclibLTLIBRARIES

	# Private GCC runtimes depend on each other. Give every installed shared
	# object a self-relative RUNPATH so indirect dependencies stay within GCC 17.
	while IFS= read -r -d '' _runtime; do
		if readelf -h "${_runtime}" >/dev/null 2>&1; then
			patchelf --set-rpath '$ORIGIN' "${_runtime}" || return 1
		fi
	done < <(find "${pkgdir}/${_libdir}" -type f -name '*.so.*' -print0)

	make DESTDIR="${pkgdir}" install-fixincludes
	make -C gcc DESTDIR="${pkgdir}" install-mkheaders

	make -C lto-plugin DESTDIR="${pkgdir}" install
	install -dm755 -- "${pkgdir}/${_libdir}/bfd-plugins/"
	ln -s -- "/${_libdir}/liblto_plugin.so" "${pkgdir}/${_libdir}/bfd-plugins/"
	rm -rf -- "${pkgdir}/usr/lib/bfd-plugins"

	make -C "${CHOST}/libgomp" DESTDIR="${pkgdir}" install-nodist_{libsubinclude,toolexeclib}HEADERS
	make -C "${CHOST}/libitm" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
	make -C "${CHOST}/libsanitizer" DESTDIR="${pkgdir}" install-nodist_{saninclude,toolexeclib}HEADERS
	make -C "${CHOST}/libsanitizer/asan" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
	make -C "${CHOST}/libsanitizer/tsan" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS
	make -C "${CHOST}/libsanitizer/lsan" DESTDIR="${pkgdir}" install-nodist_toolexeclibHEADERS

	make -C "${CHOST}/libstdc++-v3/doc" DESTDIR="${pkgdir}" doc-install-man
	while IFS= read -r -d '' _manpage; do
		sed -i -E 's@^(\.so[[:space:]]+man3/.*)\.3$@\1-17.3@' "${_manpage}" || return 1
		mv -- "${_manpage}" "${_manpage%.3}-17.3" || return 1
	done < <(find "${pkgdir}/usr/share/man/man3" -type f -name '*.3' -print0)

	make -C libcpp DESTDIR="${pkgdir}" install
	make -C gcc DESTDIR="${pkgdir}" install-po

	ln -s -- 'gcc-17' "${pkgdir}/usr/bin/cc-17"

	for binary in c++ g++ gcc gcc-ar gcc-nm gcc-ranlib; do
		ln -s -- "/usr/bin/${binary}-17" "${pkgdir}/usr/bin/${CARCH}-linux-gnu-${binary}-17"
	done

	env -u PYTHONPYCACHEPREFIX python -m compileall \
		-o 0 \
		-o 2 \
		-s "${pkgdir}" \
		-p / \
		"${pkgdir}/usr/share/gcc-${pkgver%%.snapshot*}/"

	_py_count=$(find "${pkgdir}/usr/share/gcc-${pkgver%%.snapshot*}/" -type f -name '*.py' -print | wc -l)
	_pyc_count=$(find "${pkgdir}/usr/share/gcc-${pkgver%%.snapshot*}/" -type f -name '*.pyc' -print | wc -l)
	if (( _pyc_count != _py_count * 2 )); then
		printf 'Expected two bytecode files per Python source, found %d for %d sources\n' "${_pyc_count}" "${_py_count}" >&2
		return 1
	fi

	install -Dm644 \
		"${srcdir}/gcc-${_snapshot}/COPYING.RUNTIME" \
		"${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION"

	rm -rf -- "${pkgdir}/usr/share/locale"
}
