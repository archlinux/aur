# Maintainer: irmluity <irmluity@proton.me>

_pkgname=wox
pkgname=$_pkgname-git
pkgver=2.0.0_alpha.1
pkgrel=1
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('MIT')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib')
makedepends=('git' 'go' 'just' 'nodejs' 'pnpm' 'python' 'cargo' 'libsoup')
provides=("wox")
options=(!strip)
source=(
    "git+https://github.com/Wox-launcher/Wox.git"
)
sha256sums=(
    "SKIP"
)

pkgver() {
    cd "$srcdir/Wox"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
    cd "${srcdir}"
    python -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip
}

build() {
    cd "${srcdir}/Wox"
    just release linux
}

package() {
    install -Dm755 "${srcdir}/Wox/Release/wox-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
    
    install -D -m644 "${srcdir}/Wox/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
