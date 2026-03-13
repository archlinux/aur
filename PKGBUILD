# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname"
pkgver=0.18.3
pkgrel=1
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
)
noextract=()
options=(!strip)
sha256sums=('c9847db4a232094f13f834d8681421bd3fcf8e8045632c8a70c582dad7340657'
            'c9350b744337f0a0b0c51e1a8661e8c7bc757fcc753bddaef872b0ef626228e8')

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
	
	export USE_MAGICK=1
	bun install
	bun run build
}

package() {
    install -Dm755 "${_pkgname}-${pkgver}/letta.js" "${pkgdir}/usr/share/letta/letta.js"
    install -Dm755 "${srcdir}/letta" "${pkgdir}/usr/bin/letta"
}
