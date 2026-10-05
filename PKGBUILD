# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='gcc17'
pkgver='17.0.0.snapshot20261004'
_snapshot='17-20261004'
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
	'autogen'
	'dejagnu'
	'expect'
	'gdb'
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
	'0b033d6a618594bd70eb887e79affb9a7c77427438afdb3bd42286be4ad2231c2238d65c6e632e7e75d3869cd471185e49d4148455d7982b264b937539aae5d2'
	'SKIP'
)
b2sums=(
	'SKIP'
	'bc20b249bc2aaf014832e3cb4f57e4d2b2be6b386ace28d561d4370587770ef667b0aa5063ac49bd5d222b2e1bbc81f3815e16906d5a02c7e3a661e98cae8b39'
)

_expected_failure_tests=(
	# GCC PR testsuite/125766 and other known guality failures.
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
	'g++.dg/guality/pr86687.C'

	# GCC PR diagnostics/121876.
	'gcc.dg/plugin/crash-test-nested-ice.c'
	'gcc.dg/plugin/crash-test-nested-write-through-null.c'

	# Known upstream x86_64 failures.
	'c-c++-common/analyzer/omp-parallel-for-1.c'
	'gcc.target/i386/pr115102.c'
	'gcc.target/i386/xchg-4.c'
	'gcc.dg/tree-ssa/ssa-sink-18.c'

	# Reproduced by GCC's official 2026-10-06 x86_64-pc-linux-gnu results:
	# https://gcc.gnu.org/pipermail/gcc-testresults/2026-October/888761.html
	'g++.dg/tree-ssa/ssa-dse-1.C'

	# Known libstdc++ pretty-printer failure on some test environments.
	'libstdc++-prettyprinters/chrono.cc'
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

prepare() {
	local _default_option_test _fixinc_count _has_include_error_line _libbacktrace_count _libbacktrace_file _multilib_count
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
	cd -- "${srcdir}/gcc-${_snapshot}" || return 1

	# Do not run fixincludes. Fail closed if upstream changes the generated
	# invocation instead of silently carrying a no-op rewrite into a new snapshot.
	_fixinc_count=$(grep -cF './fixinc.sh' gcc/Makefile.in || true)
	if (( _fixinc_count != 1 )); then
		printf 'Expected exactly one fixinc.sh invocation, found %d\n' "${_fixinc_count}" >&2
		return 1
	fi
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in || return 1
	if grep -qF './fixinc.sh' gcc/Makefile.in; then
		printf 'Failed to disable fixinc.sh invocation\n' >&2
		return 1
	fi

	# Arch Linux installs 64-bit libraries in /usr/lib. Guard the exact upstream
	# layout so an automated snapshot update cannot silently miss this rewrite.
	_multilib_count=$(grep -cFx 'MULTILIB_OSDIRNAMES = m64=../lib64$(call if_multiarch,:x86_64-linux-gnu)' gcc/config/i386/t-linux64 || true)
	if (( _multilib_count != 1 )); then
		printf 'Expected exactly one x86_64 lib64 multilib mapping, found %d\n' "${_multilib_count}" >&2
		return 1
	fi
	sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64 || return 1
	if ! grep -qxF 'MULTILIB_OSDIRNAMES = m64=../lib$(call if_multiarch,:x86_64-linux-gnu)' gcc/config/i386/t-linux64; then
		printf 'Failed to rewrite x86_64 multilib mapping to /usr/lib\n' >&2
		return 1
	fi

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

	# PR preprocessor/121508 can cause spurious test failures while
	# builtin_has_include_1 returns immediately after diagnosing use outside a
	# directive, leaving parser state uninitialized. Skip only while that exact
	# buggy early-return shape is present. Once upstream removes the return, the
	# test automatically runs again and becomes the verification of the fix.
	# Proposed upstream fix:
	# https://gcc.gnu.org/pipermail/gcc-patches/2026-September/733109.html
	_has_include_error_line=$(grep -nF '"%qs used outside of preprocessing directive", name);' libcpp/macro.cc | cut -d: -f1)
	if [[ ${_has_include_error_line} =~ ^[0-9]+$ ]] \
		&& sed -n "$((_has_include_error_line + 1))p" libcpp/macro.cc | grep -qxF '      return NULL;'; then
		_insert_test_skip \
			'/* { dg-skip-if "spurious test failures; include after upstream patch is merged" { *-*-* } } */' \
			gcc/testsuite/c-c++-common/cpp/has-include-1.c || return 1
	else
		printf 'PR preprocessor/121508 early-return marker absent; running has-include-1.c\n' >&2
	fi

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
	local _check_cflags _check_cxxflags _check_target_cflags _check_target_cxxflags
	local _automake_log _entry _expected_test _known_failure _memlock_status _result _sum _symbols
	local _libbacktrace_summary='libbacktrace/test-suite.log'
	local -a _automake_logs _suites _unexpected_results
	local _memlock_skip='/* { dg-skip-if "mlock unavailable in test environment" { *-*-* } } */'
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
	local _required_suites=(
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

	# fixincludes uses AutoGen and does not produce a DejaGNU summary. Check it
	# separately so its harness status is explicit even if top-level wiring changes.
	make -O -C fixincludes check || return 1

	# Run the complete testsuite apart from the environment-only memlock skips.
	# DejaGNU itself exits successfully even when individual tests report FAIL, so
	# a non-zero top-level make status represents a harness/build failure and must
	# never be discarded. Known test FAILs are classified from the summaries below.
	# Aggregate PASS/XFAIL/UNSUPPORTED counts are deliberately not pinned so a
	# new GCC snapshot can add, remove, or reclassify tests without manual edits.
	# Remove every prior summary first so a failed rerun cannot reuse stale data.
	find . -type f \( -name '*.sum' -o -name 'test-suite.log' \) -delete || return 1
	make -O -k \
		CFLAGS="${_check_cflags}" \
		CXXFLAGS="${_check_cxxflags}" \
		CFLAGS_FOR_TARGET="${_check_target_cflags}" \
		CXXFLAGS_FOR_TARGET="${_check_target_cxxflags}" \
		check || return 1

	for _sum in "${_required_suites[@]}"; do
		if [[ ! -s "${_sum}" ]]; then
			printf 'Missing required GCC testsuite summary: %s\n' "${_sum}" >&2
			return 1
		fi
	done
	if [[ ! -s "${_libbacktrace_summary}" ]]; then
		printf 'Missing libbacktrace testsuite summary: %s\n' "${_libbacktrace_summary}" >&2
		return 1
	fi

	mapfile -d '' -t _automake_logs < <(find . -type f -name 'test-suite.log' -print0 | sort -z)
	for _automake_log in "${_automake_logs[@]}"; do
		if ! grep -Eq '^# TOTAL:[[:space:]]+[1-9][0-9]*$' "${_automake_log}"; then
			printf 'Incomplete Automake testsuite summary: %s\n' "${_automake_log}" >&2
			return 1
		fi
		if grep -Eq '^# (FAIL|ERROR):[[:space:]]+[1-9][0-9]*$' "${_automake_log}"; then
			printf 'Unexpected Automake testsuite result in %s:\n' "${_automake_log}" >&2
			grep -E '^# (FAIL|ERROR):' "${_automake_log}" >&2
			return 1
		fi
	done

	mapfile -d '' -t _suites < <(find . -type f -name '*.sum' -print0 | sort -z)

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

	_unexpected_results=()
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

		while IFS= read -r _result; do
			_known_failure=0
			if [[ ${_result} == FAIL:* ]]; then
				for _expected_test in "${_expected_failure_tests[@]}"; do
					if [[ ${_result} == "FAIL: ${_expected_test}" || ${_result} == "FAIL: ${_expected_test}"[[:space:]]* ]]; then
						_known_failure=1
						printf 'Accepting known GCC testsuite failure: %s\n' "${_result}" >&2
						break
					fi
				done
			fi
			if (( ! _known_failure )); then
				_unexpected_results+=("${_sum}: ${_result}")
			fi
		done < <(grep -E '^(FAIL|ERROR|UNRESOLVED):' "${_sum}" || true)
	done

	if (( ${#_unexpected_results[@]} != 0 )); then
		printf 'Unexpected GCC testsuite results:\n' >&2
		printf '%s\n' "${_unexpected_results[@]}" >&2
		return 1
	fi

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
