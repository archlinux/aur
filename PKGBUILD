# Maintainer: Callum Parsey <callum@neoninteger.au>
# Contributor: [object Object] <objekt-Objekt@proton.me>

pkgname=libquotient-encryption
pkgver=0.7.2
pkgrel=2
pkgdesc="A Qt library to write cross-platform clients for Matrix (with experimental encryption support)"
arch=("x86_64" "aarch64")
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2.1")
depends=("gcc-libs" "glibc" "libolm" "openssl" "qt5-base" "qt5-multimedia" "qtkeychain-qt5")
makedepends=("cmake")
provides=("libQuotientE2EE.so=${pkgver%.*}-64")
source=("https://github.com/quotient-im/libQuotient/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "namespace.patch")
sha256sums=("62ff42c8fe321e582ce8943417c1d815ab3f373a26fa0d99a5926e713f6a9382"
            "cfb01b1855ac31fdfa614b3802b0cfc9890b92b7a4dade71f5f94f775773a94e")

prepare() {
	# This patch makes the following changes to CMakeLists.txt:
	# - Adds a new variable called `${LIBRARY_NAME}` which is currently set
	#   to `QuotientE2EE`, which will replace `${PROJECT_NAME}` in all cases
	#   where the name needs to be changed
	# - Replaces the name of the library target with `${LIBRARY_NAME}` so that
	#   the generated shared objects are called `libQuotientE2EE.so*`
	# - All references to `${PROJECT_NAME}` which really refer to the library
	#   target instead of the CMake project as a whole have been changed
	# - Changed the output names of the `pkg-config` script and the output
	#   CMake files (i.e. `QuotientE2EEConfig.cmake`,
	#   `QuotientE2EETargets.cmake` and so on)
	# - Changed the install directories for the config files and headers to use
	#   `QuotientE2EE` instead of `Quotient`
	# - Disable generating files for integration with the Android Native
	#   Development Kit, as these files have generic names which will conflict
	#   with the official Arch `libquotient` package
	# Also, the template files for the `pkg-config` script (`Quotient.pc.in`)
	# and CMake script (`QuotientConfig.cmake.in`) have been adjusted to use
	# `${LIBRARY_NAME}` where necessary instead of hard-coding `Quotient`.
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
	# - Places where a forward slash needs to be part of the expression or
	#   replacement text are escaped with a backslash, i.e. `\/`
	# - So the expression reads: match all instances of text which are of the
	#   form `# include <Quotient/`, with everything but the final forward
	#   slash contained in a sub-expression, and with an arbitrary amount of
	#   white-space allowed
	# - And the replacement text will be whatever text matched the first
	#   sub-expression (i.e. `# include <Quotient` but with the right amount
	#   of white-space) followed by `E2EE/`.
	find "${pkgdir}/usr/include/QuotientE2EE" -name '*.h' -exec sed -i \
		's/\(#[[:blank:]]*include[[:blank:]]*<Quotient\)\//\1E2EE\//g' '{}' \;
}
