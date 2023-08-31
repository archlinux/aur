# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgver=2.1.8
pkgname=espanso-wayland
pkgver=2.1.8
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("libnotify" "wxwidgets-gtk3" "libxkbcommon" "wl-clipboard")
makedepends=("rust" "git" "cmake" "cargo-make" "rust-script")
provides=("${pkgname%-wayland}")
conflicts=("${pkgname%-wayland}")
options=("!lto")  # fails with LTO as of 2022-03
install=espanso-wayland.install
source=("git+https://github.com/federico-terzi/espanso.git#tag=v${_pkgver}")
sha512sums=('SKIP')


prepare() {
    cd "espanso"

    # don't change the original service file, as it will be embedded in the binary
    cp "espanso/src/res/linux/systemd.service" "systemd.service"
    sed -i "s|{{{espanso_path}}}|/usr/bin/espanso|g" "systemd.service"
}

build() {
    cd "espanso"

    cargo make --env NO_X11=true --profile release build-binary
}

package() {
    cd "espanso"

    install -Dm755 "target/release/espanso" "${pkgdir}/usr/bin/espanso"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/espanso.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/espanso/README.md"
}
