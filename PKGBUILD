# Maintainer: decipher <decipher3114@gmail.com>

_package_name=capter
pkgname="$_package_name"
pkgver=4.0.1
pkgrel=1
epoch=
pkgdesc="Cross-Platform Screen Capture and Annotation Tool"
arch=('x86_64')
url="https://github.com/decipher3114/Capter"
license=('Apache-2.0')

makedepends=(
    base-devel
    clang
    libxcb
    libxrandr
    dbus
    libpipewire
    xdotool
    gtk3
)
depends=(
    libayatana-appindicator
)
provides=("${_package_name}")
conflicts=("${_package_name}-bin")
replaces=("${_package_name}")

source=(
    "${_package_name}::git+${url}.git"
)
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$_package_name"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_package_name"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$_package_name"

    install -Dm755 "target/release/$_package_name" "${pkgdir}/usr/bin/$_package_name"

    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -r "assets/resources/linux/hicolor"/* "$pkgdir/usr/share/icons/hicolor/"

    install -Dm644 "assets/resources/linux/capter.desktop" "${pkgdir}/usr/share/applications/${_package_name}.desktop"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_package_name}/LICENSE"
}
