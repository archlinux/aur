# Maintainer: winlogon <walker84837 at gmail.com>
pkgname=openjai-git
pkgver=0.0.0.r264ba53
pkgrel=2
pkgdesc="Open-source Jai-style systems programming language and compiler."
arch=('x86_64')
url="https://github.com/withlang-dev/open-jai"
license=('MIT')
# openjai links libLLVM (llvm-libs) at runtime, runs `cc` (gcc) to link user programs,
# and execs `clang++` at runtime for C++ dylib interop.
#
# libffi is linked into the compiler itself.
depends=('llvm-libs' 'libffi' 'gcc' 'clang')
# Zig compiles the bootstrap, while clang++/lld do the final link.
#
# Then, llvm-config is requested at build time for LLVM flags/paths.
makedepends=('git' 'zig' 'lld' 'llvm')
provides=('openjai')
conflicts=('openjai')
options=(!debug)

# Pinned upstream rev.
_commit=264ba53218bf0e55bbc328197b312fe704496224

source=(
	"git+https://github.com/withlang-dev/open-jai.git#commit=$_commit"
	"0001-build-ignore-generated-libffi-include-shim.patch"
	"0002-build-add-local-include-dir-for-libffi-on-arch.patch"
	"0003-chore-add-upstream-license-text.patch"
	"0004-fix-bootstrap-disable-_FORTIFY_SOURCE-in-Linux-C-imp.patch"
	"openjai.sh"
)
sha256sums=('SKIP'
	'70f995b8e5e2cdebee6240826171753b4798c7a108b18f7411a3628b1d75050d'
	'd15708ee35393a1dca48a2ddb014eceb6be1ae890d24b2244db69921674fb384'
	'f08e43bc828fdc9ef9668fd63ad7df02c6f4b3d3852966b458ef4088de3ee761'
	'161a388d68cb144291d879efc68bdcb924ac21bb431e35748fc4471165e9793e'
	'17adc580681f43cefdcc378218917cafcb32331f3128341dd9484b2b30fbe4d1')

pkgver() {
	cd "$srcdir/open-jai"
	printf "0.0.0.r%s" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/open-jai"

	# Reset any previous `git apply` so rebuilds (makepkg without --clean)
	# don't fail on the already-patched repo.
	git reset --hard HEAD
	git clean -fd

	# Portability patches
	git apply "../0001-build-ignore-generated-libffi-include-shim.patch"
	git apply "../0002-build-add-local-include-dir-for-libffi-on-arch.patch"
	git apply "../0003-chore-add-upstream-license-text.patch"
	git apply "../0004-fix-bootstrap-disable-_FORTIFY_SOURCE-in-Linux-C-imp.patch"

	# Arch ships libffi headers flat at /usr/include/ffi.h, but the compiler's
	# @cImport expects the namespaced <ffi/ffi.h>.
	#
	# Provide a local shim include dir that redirects to the system header.
	mkdir -p bootstrap/include/ffi
	ln -sf /usr/include/ffi.h bootstrap/include/ffi/ffi.h
	ln -sf /usr/include/ffitarget.h bootstrap/include/ffi/ffitarget.h
}

build() {
	cd "$srcdir/open-jai/bootstrap"
	export LLVM_CONFIG=/usr/bin/llvm-config
	export OPENJAI_CXX=/usr/bin/clang++
	zig build --prefix "$srcdir/open-jai-prefix" \
		--cache-dir "$srcdir/zig-cache/bootstrap" \
		--global-cache-dir "$srcdir/zig-cache/global" \
		-Doptimize=ReleaseSafe
}

check() {
	cd "$srcdir/open-jai"
	# Compile and run a representative hello-world example with the freshly built
	# compiler, installed runtime, and stdlib.
	"$srcdir/open-jai-prefix/bin/openjai-macos" \
		examples/03/3.1_hello_sailor.jai \
		-o "$srcdir/hello_test" \
		--runtime "$srcdir/open-jai-prefix/lib/openjai_runtime.manifest" \
		-import_dir modules
	"$srcdir/hello_test"
}

package() {
	cd "$srcdir/open-jai"
	local _rt="$srcdir/open-jai-prefix/lib"

	# Rename openjai-macos to openjai.
	install -Dm755 "$srcdir/open-jai-prefix/bin/openjai-macos" \
		"$pkgdir/usr/lib/openjai/openjai"

	install -Dm644 "$_rt/openjai_runtime.manifest" \
		"$pkgdir/usr/lib/openjai/openjai_runtime.manifest"
	for o in "$_rt"/openjai_rt_*.o "$_rt"/openjai_runtime.o; do
		install -Dm644 "$o" "$pkgdir/usr/lib/openjai/$(basename "$o")"
	done

	# Jai standard-library modules (the #import "Basic" etc. tree).
	install -dm755 "$pkgdir/usr/share/openjai/modules"
	cp -a modules/. "$pkgdir/usr/share/openjai/modules/"

	# User-facing command.
	install -Dm755 "$srcdir/openjai.sh" "$pkgdir/usr/bin/openjai"

	# Upstream declares the project MIT-licensed in README.md, but does not
	# include the actual license text. Add the standard MIT license text so
	# the package contains the declared license.
	install -Dm644 "$srcdir/open-jai/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
