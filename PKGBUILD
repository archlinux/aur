# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_wayland=false
_branch=dev
_pkgname=espanso
pkgname=${_pkgname}-git
pkgver=2.0.0.r53.g8f291f4
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst" "libnotify")
makedepends=("rust" "git" "cmake" "cargo-make" "rust-script")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/federico-terzi/espanso.git#branch=${_branch}")
sha512sums=('SKIP')

if [ "$_wayland" == "true" ]; then  # setcap "cap_dac_override+p" after install; See https://espanso.org/docs/next/install/linux/#adding-the-required-capabilities
  install="${pkgname}-wayland.install"
fi

pkgver() {
    cd "$_pkgname"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    # don't change the original service file, as it will be embedded in the binary
    cp "espanso/src/res/linux/systemd.service" "systemd.service"
    sed -i "s|{{{espanso_path}}}|/usr/bin/espanso|g" "systemd.service"
}

build() {
    cd "$_pkgname"

    cargo make build-binary --profile release --env NO_X11=$_wayland
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
