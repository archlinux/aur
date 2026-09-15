# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Sean Anderson <seanga2@gmail.com>
pkgname='genmc'
pkgver=0.18.0
pkgrel=1
pkgdesc='Generic model checker for concurrent C/C++ programs'
arch=('x86_64')
url='https://github.com/MPI-SWS/genmc'
license=(
	'Apache-2.0 OR MIT'
	'NCSA'
	'GPL-3.0-or-later'
	'LGPL-2.1-or-later'
	'GPL-2.0-or-later'
)
depends=(
	'clang'
	'hwloc'
	'libffi'
	'llvm'
	'llvm-libs'
)
makedepends=('cmake')
checkdepends=(
	'bc'
	'diffutils'
	'ncurses'
)
options=('staticlibs')
_googletest_version='1.14.0'
_rapidcheck_commit='6e8dadfdafa3a74eabb52ead87f8787f72eccd0b'
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"googletest-${_googletest_version}.zip::https://github.com/google/googletest/archive/refs/tags/v${_googletest_version}.zip"
	"rapidcheck-${_rapidcheck_commit}.tar.gz::https://github.com/emil-e/rapidcheck/archive/${_rapidcheck_commit}.tar.gz"
	'libffi-regression.c'
)
b2sums=(
	'a674d91a9a11547ff01b352039743b55a9f17aa13e5a328991f7d5fbb0ccda38f7e4208e5786f7c8a6638937468bef8da226b5023e9ad8543ddbcdace11363b4'
	'9f7371ea015ea93531a5bf24ef07645623671f5eada672c6d84e90493a9acf7895126c09242739a4293352974e1c00d3c2ee69150c93933853c25af8834a06e6'
	'5ca0b4ab08f47111e1925c68adb29c7e4302f455b0ce6f717757a6f0334172ff51a3d65ab1d877c54f86a684a0597e432c7b315f6b8c702a138a6f6b42ae0961'
	'6a707bcc189dbddc2052ea58fcf95e7c09cdcec76394259103b485853e2db4d5c2810e832054bfdb91dbfa60d476c7137f711faba75911fa165e259adb584a41'
)

prepare() {
	cd -- "${pkgname}-${pkgver}" || return 1

	# Upstream installs the executable as /usr/bin/genmc/genmc, which is not
	# directly executable from PATH and regresses the pre-CMake install layout.
	local _old='install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}/${PROJECT_NAME})'
	local _new='install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})'
	grep -Fqx -- "${_old}" lli/CMakeLists.txt || return 1
	sed -i "s|${_old}|${_new}|" lli/CMakeLists.txt

	# Do not embed the build-tree runtime-header path in the installed binary.
	local _src_include='set(SRC_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/lli/runtime-include/c")'
	local _installed_include='set(SRC_INCLUDE_DIR "${INCLUDE_DIR}")'
	grep -Fqx -- "${_src_include}" CMakeLists.txt || return 1
	sed -i "s|${_src_include}|${_installed_include}|" CMakeLists.txt

	# GCC 16 no longer provides std::uint8_t transitively through <memory>.
	grep -Fqx '#include <memory>' genmc/genmc/Execution/Consistency/BoundDecider.hpp || return 1
	sed -i '/#include <memory>/i #include <cstdint>' genmc/genmc/Execution/Consistency/BoundDecider.hpp

	# The CMake migration kept linking hwloc but dropped Autoconf's
	# HAVE_LIBHWLOC definition. Require hwloc and expose the feature through
	# the installed public config so library consumers get the same ABI.
	local _hwloc='find_library(HWLOC hwloc)'
	local _hwloc_required='find_library(HWLOC hwloc REQUIRED)'
	grep -Fqx -- "${_hwloc}" genmc/CMakeLists.txt || return 1
	sed -i "s|${_hwloc}|${_hwloc_required}|" genmc/CMakeLists.txt

	grep -Fqx '#cmakedefine01 EMIT_NA_LABELS' config.h.in || return 1
	sed -i '/#cmakedefine01 EMIT_NA_LABELS/a #define HAVE_LIBHWLOC 1' config.h.in

	grep -Fqx '#include <thread>' genmc/genmc/Support/ThreadPinner.hpp || return 1
	sed -i '/#include <thread>/i #include <genmc/config.h>' genmc/genmc/Support/ThreadPinner.hpp

	# The CMake migration also dropped the libffi feature definitions. Without
	# them ExternalFunctions.cpp compiles out the generic external-call fallback.
	local _ffi_link='target_link_libraries(${PROJECT_NAME} PRIVATE genmc_config_includes genmc_lib genmc_passes ffi dl LLVM)'
	grep -Fqx -- "${_ffi_link}" lli/CMakeLists.txt || return 1
	sed -i '/^target_link_libraries(${PROJECT_NAME} PRIVATE genmc_config_includes genmc_lib genmc_passes ffi dl LLVM)$/a target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_LIBFFI HAVE_FFI_H)' lli/CMakeLists.txt

	# ffiInvoke() takes &args[0] even for zero-argument functions. Use data() so
	# libffi receives a valid null pointer when NumArgs is zero.
	local _ffi_prep='	if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, NumArgs, rtype, &args[0]) == FFI_OK) {'
	grep -Fqx -- "${_ffi_prep}" lli/Runtime/ExternalFunctions.cpp || return 1
	sed -i 's|&args\[0\]|args.data()|' lli/Runtime/ExternalFunctions.cpp

	# Keep FetchContent test dependencies out of the package install rules. The
	# sources themselves are supplied by makepkg and selected below at configure time.
	grep -Fqx '  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip' tests/unit/CMakeLists.txt || return 1
	sed -i '/googletest\/archive\/refs\/tags\/v1\.14\.0\.zip/a\  EXCLUDE_FROM_ALL' tests/unit/CMakeLists.txt
	grep -Fqx '  GIT_TAG        master' tests/unit/CMakeLists.txt || return 1
	sed -i '/^  GIT_TAG        master$/a\  EXCLUDE_FROM_ALL' tests/unit/CMakeLists.txt
}

build() {
	cd -- "${pkgname}-${pkgver}" || return 1

	# Keep compile-time source locations reproducible and out of the package.
	CFLAGS+=" -ffile-prefix-map=${srcdir}=."
	CXXFLAGS+=" -ffile-prefix-map=${srcdir}=."

	# makepkg strips static archives. With GCC LTO, fat objects retain native
	# code as well, so the installed archive remains usable after stripping.
	if [[ ${CXXFLAGS} == *-flto* ]]; then
		CXXFLAGS+=' -ffat-lto-objects'
	fi

	cmake -B build -S . \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DLLVM_DIR=/usr/lib/cmake/llvm \
		-DBUILD_TESTS=ON \
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
		-DFETCHCONTENT_SOURCE_DIR_GOOGLETEST="${srcdir}/googletest-${_googletest_version}" \
		-DFETCHCONTENT_SOURCE_DIR_RAPIDCHECK="${srcdir}/rapidcheck-${_rapidcheck_commit}" \
		-DGENMC_TCMALLOC=OFF
	cmake --build build
}

check() {
	cd -- "${pkgname}-${pkgver}" || return 1

	build/bin/genmc --version
	build/bin/genmc -- -Illi/runtime-include/c -DN=2 tests/correct/synthetic/ainc/variants/ainc0.c
	build/bin/genmc -- -Illi/runtime-include/c tests/correct/infr/cpp-mp/variants/cpp-mp.cpp

	# Regression test for the CMake libffi feature-detection bug. getpid() has
	# no built-in GenMC wrapper, so success proves the generic libffi path works.
	build/bin/genmc -- "${srcdir}/libffi-regression.c"

	# Run upstream's unit tests plus its broader fast integration suite.
	build/bin/unit_tests
	if ! CFLAGS="-I${PWD}/lli/runtime-include/c" \
		GenMC="${PWD}/build/bin/genmc" TERM=xterm \
		ctest --test-dir build --output-on-failure -R '^fast-driver$'; then
		[[ -f scripts/fast-driver.log ]] && cat -- scripts/fast-driver.log
		return 1
	fi
}

package() {
	cd -- "${pkgname}-${pkgver}" || return 1

	DESTDIR="${pkgdir}" cmake --install build

	# Upstream's CMake install rule only matches *.h and therefore omits its
	# extensionless C++ runtime shims. Install all five explicitly; cassert is
	# a symlink upstream, so install(1) materializes it as normal package data.
	install -Dm644 lli/runtime-include/c/{atomic,cassert,cstdio,cstdlib,thread} \
		-t "${pkgdir}/usr/include/${pkgname}/runtime"

	local _runtime_header
	for _runtime_header in atomic cassert cstdio cstdlib thread; do
		[[ -f "${pkgdir}/usr/include/${pkgname}/runtime/${_runtime_header}" ]] || return 1
	done

	# Exercise the staged package layout instead of masking installation bugs
	# with the source-tree runtime headers used by check().
	"${pkgdir}/usr/bin/genmc" -- \
		-I"${pkgdir}/usr/include/${pkgname}/runtime" \
		tests/correct/infr/cpp-mp/variants/cpp-mp.cpp

	install -Dm644 LICENSE-APACHE LICENSE-MIT LLVMLICENSE \
		-t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 README.md CHANGELOG.md doc/development.md \
		-t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 doc/manual/*.md \
		-t "${pkgdir}/usr/share/doc/${pkgname}/manual"
}
