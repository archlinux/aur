# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname"
pkgver=0.16.12
pkgrel=2
pkgdesc="The memory-first coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs' 'org.freedesktop.secrets' 'imagemagick>=7')
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
	"$_pkgname-$pkgver.tar.gz::$url/archive/v"$pkgver".tar.gz"
	"letta"
	"https://patch-diff.githubusercontent.com/raw/letta-ai/letta-code/pull/1200.patch")
noextract=()
options=(!strip)
sha256sums=('dfe0397888daa2fa132372a1cba5cb592393163eb89fd36243e71ce8d7402946'
            'c9350b744337f0a0b0c51e1a8661e8c7bc757fcc753bddaef872b0ef626228e8'
            'ffdb0db45f74d72dac367cfc0013656b274c16758fdcc9c47c2a6c1361171a71')

prepare() {
    if ! command -v bun &> /dev/null; then
        echo "Bun was not found. Please install bun from https://bun.com/, or install the bun AUR package."
        exit 1
    fi
    bunversion=$(bun --version | sed 's/[^0-9]*//g')
    if (( $bunversion < 130 )); then
        echo "Upgrading bun"
        bun upgrade
    fi
}

build() {
	cd "${_pkgname}-${pkgver}"

	# Temp patch to be removed next update
	patch -Np1 < "$srcdir/1200.patch" || true
	
	export USE_MAGICK=1
	bun install
	bun run build
}

package() {
    install -Dm755 "${_pkgname}-${pkgver}/letta.js" "${pkgdir}/usr/share/letta/letta.js"
    install -Dm755 "${srcdir}/letta" "${pkgdir}/usr/bin/letta"
}
