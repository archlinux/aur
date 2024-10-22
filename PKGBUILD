# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname"
pkgver=1.1.2
pkgrel=1
pkgdesc="Tool to help you update your Ollama models"
arch=('any')
url="https://github.com/thatonecalculator/ollamamodelupdater"
license=('MIT')
makedepends=('git')
optdepends=(
    'ollama: Ollama'
)
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v"$pkgver".tar.gz")
noextract=()
options=(!strip)
sha256sums=('a5e02ba4d19c1c1c63523a5f5933bb69b9897cf1092f46ac3bd721df180757aa')

prepare() {
    if ! command -v bun &> /dev/null; then
        echo "Bun was not found. Please install bun from https://bun.sh, or install the bun-bin or bun-git AUR package."
        exit 1
    fi
    bunversion=$(bun --version | sed 's/[^0-9]*//g')
    if (( $bunversion < 1022 )); then
        echo "Upgrading bun"
        bun upgrade
    fi
}

package() {
    cd "${_pkgname}-${pkgver}"
    bun install
    bun build ./update.ts --compile --minify --outfile "${srcdir}/${_pkgname}-${pkgver}/$_pkgname"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
