# Maintainer: Sri Rang <sri@shapemachine.xyz>
pkgname=castword-gnome
# pkgver uses dots; the git tag uses hyphens (e.g. v2026-04-04-00)
pkgver=2026.04.04.01
pkgrel=1
pkgdesc="GNOME overlay for LLM-powered text tone rewriting"
arch=('any')
url="https://shapemachine.xyz/castword"
license=('custom')
depends=(
    'python'
    'python-gobject'
    'libadwaita'
    'libsecret'
    'gtk4'
)
makedepends=(
    'python-pip'
    'python-setuptools'
)
# Derive git tag from pkgver by replacing dots with hyphens: 2026.04.04.00 -> v2026-04-04-00
_pkgtag="v${pkgver//./-}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Shape-Machine/castword-gnome/archive/refs/tags/${_pkgtag}.tar.gz")
sha256sums=('505c5504f60ab028d97f12f4c4a9b887064abd89243e5e0c0fdc89246df1fbfe')

build() {
    cd "${pkgname}-${pkgver}"
    # Nothing to compile
    :
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install Python package and castword console script
    pip install \
        --no-deps \
        --ignore-installed \
        --prefix="${pkgdir}/usr" \
        --root=/ \
        .

    # Install pip runtime dependencies
    pip install \
        --no-compile \
        --prefix="${pkgdir}/usr" \
        --root=/ \
        httpx openai anthropic google-genai

    # Install data files
    make install \
        DESTDIR="${pkgdir}" \
        PREFIX=/usr

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
