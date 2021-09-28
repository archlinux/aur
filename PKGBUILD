# Maintainer: Noa (coolreader18)
pkgname=ndless-sdk-git
pkgver=r528.6d6fcd2
pkgrel=1
pkgdesc="SDK for programs targeting Ndless on the TI-Nspire"
arch=(x86_64)
url="https://github.com/ndless-nspire/Ndless"
license=('MPL-1.1')
groups=()
depends=(gmp mpfr libmpc zlib boost-libs)
makedepends=(git gcc binutils boost wget)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('!strip')
install=$pkgname.install
source=('ndless::git+https://github.com/ndless-nspire/Ndless' ndless.patch ndless-env.sh)
noextract=()
md5sums=('SKIP'
         '9559c5c65d9e0956d78b0cf30dd40051'
         'e33970015b5fa585787e29f7966aaf82'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

# Submodules
source+=(nspire-io::git+https://github.com/Vogtinator/nspire-io.git)
source+=(zlib::git+https://github.com/madler/zlib.git)
source+=(git://git.sv.nongnu.org/freetype/freetype2.git)
source+=(luna::git+https://github.com/ndless-nspire/luna.git)

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/ndless"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/ndless"
	git submodule init
	git config submodule.nspire-io.url "$srcdir/nspire-io"
	git config submodule.zlib.url "$srcdir/zlib"
	git config submodule.freetype2.url "$srcdir/freetype2"
	git config submodule."ndless-sdk/tools/luna".url "$srcdir/luna"
	git clean -f
	patch --forward --strip=1 --input="$srcdir"/ndless.patch
}

build() {
	cd "$srcdir"/ndless/ndless-sdk
	pushd toolchain
	unset CFLAGS CPPFLAGS
	echo -e "\033[1mBuilding Ndless C toolchain, expect this to take a while\033[0m"
	sleep 2
	./build_toolchain.sh
	popd
	git submodule init && git submodule update
	export PATH="$PWD/toolchain/install/bin:$PWD/bin:$PATH"
	make
}

package() {
	cd "$srcdir/ndless/ndless-sdk"
	local sdkdir="$pkgdir"/usr/share/ndless-sdk
	mkdir -p "$sdkdir"
	cp -r toolchain/install/* "$sdkdir"
	for dir in bin lib include system; do
		mkdir -p "$sdkdir/$dir"
		cp -r ./"$dir"/* "$sdkdir/$dir"
	done
	cp --remove-destination tools/zehn_loader/zehn_loader*.tns "$sdkdir"/lib
	mkdir -p "$pkgdir"/usr/bin
 	cd "$pkgdir"/usr/bin
	for exe in ../share/ndless-sdk/bin/{nspire-*,genzehn,make-prg}; do
		[[ -x $exe ]] && ln -s "$exe" .
	done
	local profiled="$pkgdir"/etc/profile.d
	mkdir -p "$profiled"
	cp "$srcdir"/ndless-env.sh "$profiled"
}
