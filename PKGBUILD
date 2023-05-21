# Maintainer: poly000 <1348292515@qq.com>
pkgname=yas-scanner-git
_pkgname=yas
pkgver=v0.1.13.29.gb54f765
pkgrel=1
pkgdesc="fast Artifact scanner for a specific anime game"
url="https://github.com/wormtql/${_pkgname}"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
conflicts=('yas-scanner' 'yas-scanner-bin')

license=('custom')
depends=('xorg-xwininfo' 'xdotool' 'libx11' 'libxrandr' 'libxcb' 'dbus')
makedepends=('cargo' 'git' 'git-lfs' 'jq')
optdepends=('xdg-desktop-portal: screenshot on wayland compositors other than GNOME')

source=('https://github.com/wormtql/yas/raw/main/models/model_acc100-epoch49.onnx')
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    if [ -d "${_pkgname}" ]; then
        cd "${_pkgname}"
        git pull
        cd ..
    else
        git clone "${url}"
    fi
}

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git describe --always) | tr '-' '.'
}

build() {
    cp model_acc100-epoch49.onnx "${srcdir}/${_pkgname}/models"
    cd "$srcdir/$_pkgname"

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --release --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"
    install -vDm755 target/release/yas_scanner ${pkgdir}/usr/bin/${pkgname%-git}
}
