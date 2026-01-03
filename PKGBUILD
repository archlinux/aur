# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="letta-code"
pkgname="$_pkgname"
pkgver=0.11.1
pkgrel=1
pkgdesc="The memory-first coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/letta-ai/letta-code"
license=('Apache-2.0')
depends=('nodejs' 'org.freedesktop.secrets')
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v"$pkgver".tar.gz")
noextract=()
options=(!strip)
sha256sums=('0234a2f870bba9ffaa460b9c73b2099203bc971895f9b007e17c1706c26e5283')

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

package() {
    cd "${_pkgname}-${pkgver}"
    bun install
    bun run build
    install -Dm755 ./letta.js "$pkgdir/usr/bin/letta"
}
