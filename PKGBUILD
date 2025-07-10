# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maretf
pkgver=0.6.4
pkgrel=1
pkgdesc="A work in progress command-line utility to work with VTF files."
arch=('x86_64')
url="https://github.com/craftablescience/MareTF"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('ninja' 'cmake' 'git')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
	"git+https://github.com/craftablescience/cmake-helpers.git#commit=a22e0998c61aaebe8a52c062eb52eb08d8b8223d"
	"git+https://github.com/craftablescience/sourcepp.git#commit=84b708786a594821afe5c616dc5eafaa7304e565"
	"git+https://github.com/p-ranav/argparse.git#commit=d924b84eba1f0f0adf38b20b7b4829f6f65b6570"
	"discord::git+https://github.com/craftablescience/discord-rpc-clean.git#commit=45f36ee0615bca5be496f1cc2e62b7774fd21324"
	"git+https://github.com/SpartanJ/efsw.git#commit=f4ec910175a2abcd8aaa193e7643739a1efad321"
	"git+https://github.com/p-ranav/indicators.git#commit=3872f37abd90d7557bac5f834bfb45bd6c75259a"
	"git+https://github.com/craftablescience/bufferstream.git#commit=d468baf2bcdfb99cf7c426dd1565e6f23ac4c2fa"
	"cryptopp::git+https://github.com/abdes/cryptopp-cmake.git#commit=edb9a71bed2b663c996fded6a104714e05a113f9"
	"git+https://github.com/Tessil/hat-trie.git#commit=25fdf359711eb27e9e7ec0cfe19cc459ec6488d7"
	"git+https://github.com/webmproject/libwebp.git#commit=0cd0b7a7013723985156989f0772e3cb8c4ce49f"
	"git+https://github.com/richgel999/miniz.git#commit=89d7a5f6c3ce8893ea042b0a9d2a2d9975589ac9"
	"git+https://github.com/craftablescience/minizip-ng.git#commit=2c0dc5d82c22df373515f890a656b5394285493c"
	"git+https://github.com/phoboslab/qoi.git#commit=4461cc37ef08b24f157a5ab7c3f7d6c9e6caa6c0"
	)
sha256sums=('083303b9037c9658d5e88f0fb2ce560ed86bed924fe86d37f4eea868a66d585d'
            '8510317b204d5c8722252c2a2c01532a76ff7d196902546ddad2ff239fcf961e'
            '3f0e4218e858ad461ab70b7c77371d57a9305281e33d86e55de3576d1ce20723'
            '42b2b012a0724cfe279a79a520e63602d0dc7d549e8e56ea626018ffcc3f0bc9'
            '0d3b99c83877d433a793e2d1f60dcc2b376c40561ffc4276c7a3ca836afbe6df'
            '3950bb988897f593a3d97093eb2cc41c11a89290f36ae39854ab108c4e9f862b'
            '91c88da51a60cf533a95aaa0838cfba311a00579c3377a11ccf32141dc93eb93'
            '8fe0e77441a851589cf8a435290ff537842c19b2265eae62dfb9b397e159887e'
            '0eddee044b59813498ed7d4495546d8abb670d233209c0fbf73812ea33d5f447'
            '8f71a0140aab6196d1d841b1a572115e5794f9c81cf5ce86eb482fbb45ed3751'
            'b61afdd82c38b77be7c164184148769b8c68469ff6cfa6ed6b4a6505872c30b6'
            '48d22e721409ac5bcebc9dd22f62fb844a3e92770cda7288ef960db6c2a71da1'
            '10610704d953d8c141c0e9cdb45a1467b4985122e5468ffbbb1a610054558885'
            '66de5b97b90e59243f8b6c22a83071dcef3a54c58f631c93c30e8d3414c71dbd')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	for submodule in {sourcepp,argparse,efsw,indicators,discord};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git config submodule.cmake/helpers.url "$srcdir/cmake-helpers"
	git -c protocol.file.allow=always submodule update

	cd "$srcdir/$pkgname/ext/sourcepp"
	git submodule init
	for submodule in {bufferstream,cryptopp,hat-trie,libwebp,miniz,minizip-ng,qoi};
	do
		git config submodule.ext/${submodule}.url "$srcdir/$submodule"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DZLIBNG_ENABLE_TESTS=OFF \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
