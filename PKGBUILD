# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="ollamamodelupdater"
pkgname="$_pkgname"
pkgver=1.0.1
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
sha256sums=('810dabad221ba04e301d5ad028ea8bceb9f9de96c13506712ecf8815a4ac0c1b')

prepare() {
    if ! command -v bun &> /dev/null; then
        echo "Bun was not found. Please install bun from https://bun.sh"
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
