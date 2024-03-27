# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=wox
pkgname=$_pkgname-git
pkgver=2.0.0_nightly
pkgrel=1
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('GPL3')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib' 'libkeybinder3')
makedepends=('git' 'go' 'just' 'nodejs' 'pnpm' 'python' 'cargo' 'libsoup' 'python-loguru' 'python-websockets' 'upx' 'lefthook' 'python-pip' 'cmake' 'ninja' 'clang')
provides=(${_pkgname})
options=(!strip)
conflicts=(${_pkgname}-bin ${_pkgname})
source=(
    "git+https://github.com/Wox-launcher/Wox.git"
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.4-stable.tar.xz"
)
sha256sums=(
    "SKIP"
    "SKIP"
)

pkgver() {
    cd "$srcdir/Wox"
    printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
    cd "${srcdir}"
    export PATH="$PATH:${srcdir}/flutter/bin"
    dart pub global activate flutter_distributor
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    export CHANNEL=prod
    flutter config --no-analytics
    flutter config --enable-linux-desktop
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
}
