# Maintainer: Callum Parsey <callum@neoninteger.au>
# Contributor: [object Object] <objekt-Objekt@proton.me>

pkgname=libquotient-encryption
pkgver=0.8.0
pkgrel=1
pkgdesc="A Qt library to write cross-platform clients for Matrix (with experimental encryption support)"
arch=("x86_64" "aarch64")
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2.1")
depends=("gcc-libs" "glibc" "libolm" "openssl" "qt5-base" "qt5-multimedia" "qtkeychain-qt5")
makedepends=("cmake")
provides=("libQuotientE2EE.so=${pkgver%.*}-64")
source=("https://github.com/quotient-im/libQuotient/archive/${pkgver}/source.tar.gz"
        "namespace.patch")
sha256sums=('40d84c2a1ed8c57605836dd175aabd069aed33c77b6bd841391631607b8c3a76'
            'd1a40852adb19ba5ce132f1c1ff680c198e7e1cd9b2a36c2cc278907525f4d4e')

prepare() {
	# This patch makes the following changes:
	# - There is existing logic in `CMakeLists.txt` to change the name of the
	#   library to `QuotientQt6` when the relevant build option is enabled, I
	#   extend this to also add `E2EE` to the name if that option is enabled.
	#   This will change the name of the generated library (i.e. it becomes
	#   `libQuotientE2EE.so`) as well as the `pkg-config` description file (it
	#   will be installed to `<prefix>/lib/pkgconfig/QuotientE2EE.pc`) and
	#   CMake package description files (which will go to
	#   `<prefix>/lib/cmake/QuotientE2EE/QuotientE2EE-*.cmake`). The
	#   aforementioned CMake files also internally use the correct name.
	# - In both `CMakeLists.txt` and the template `<target>Config.cmake` file,
	#   I change the install location for the headers from
	#   `<prefix>/include/Quotient` to `<prefix>/include/QuotientE2EE` so that
	#   this package does not need to conflict with or depend on the official
	#   `libquotient` Arch package.
	# - Corrected the `pkg-config` description file so that it takes the
	#   correct name, description and linker directives for the selected build
	#   configuration. These changes are not Arch-specific and should be
	#   upstreamed at some point.
	patch -Np0 -d . -i namespace.patch
}

build() {
	cmake -B build -S "libQuotient-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=1 \
		-DBUILD_TESTING=OFF \
		-DQuotient_ENABLE_E2EE=ON

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "libQuotient-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# The header files expect to be installed in a system directory called
	# `Quotient` as evidenced by their nested include statements. Since we
	# install the headers to `/usr/include/QuotientE2EE` to prevent conflicts
	# with software that use the official non-encryption package, we need to
	# adjust the include statements in the headers to make sure that the right
	# ones are used. We can't do this in the `prepare()` step because the build
	# system stores the headers alongside the source code in a directory called
	# `Quotient` and we therefore cannot change the include statements without
	# also moving the entire source tree. So we have to let the library compile
	# with unmodified headers, and then change them after CMake has installed
	# them to the right place.
	#
	# Reference:
	# - `s/<expression>/<replacement>/g` means to replace all instances of text
	#   which match the provided basic regular expression with the provided
	#   replacement text
	# - The content of the expression between `\(` and `\)` represents a
	#   sub-expression. The `\1` in the replacement means to include the text
	#   which matched the first sub-expression verbatim.
	# - `[[:blank:]]*` matches an arbitrary amount of white-space (space or
	#   horizontal tab characters)
	# - `[<"]` matches a single instance of either the quote or left angle
	#   bracket characters
	# - Places where a forward slash needs to be part of the expression or
	#   replacement text are escaped with a backslash, i.e. `\/`
	# - So the expression reads: match all instances of text which are of the
	#   form `# include <Quotient/`, with everything but the final forward
	#   slash contained in a sub-expression, and with an arbitrary amount of
	#   white-space allowed
	# - And the replacement text will be whatever text matched the first
	#   sub-expression (i.e. `# include <Quotient` or `# include "Quotient` but
	#   with the right amount of white-space) followed by `E2EE/`.
	find "${pkgdir}/usr/include/QuotientE2EE" -name '*.h' -exec sed -i \
		's/\(#[[:blank:]]*include[[:blank:]]*[<"]Quotient\)\//\1E2EE\//g' '{}' \;
}
