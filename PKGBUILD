# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname-bin"
pkgver=0.13.11
pkgrel=2
pkgdesc="The memory-first coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs' 'org.freedesktop.secrets' 'libvips')
conflicts=(
    "$_pkgname"
    # "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
	"letta.js::$url/releases/download/v${pkgver}/letta.js"
)
noextract=()
options=(!strip)
sha256sums=('3758031d5f10c76085e5232a490d96006b48647e8247cf4a8f47ffd579bab68b')

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

    cd "${srcdir}"
    chmod +x ./letta.js
    
}

package() {
    cd "${srcdir}"
    install -Dm755 ./letta.js "$pkgdir/usr/bin/letta"
}
