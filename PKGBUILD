# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_branch=dev
_pkgname=espanso
pkgname=${_pkgname}-git
pkgver=r245.fddc498
pkgrel=1
pkgdesc="Cross-platform Text Expander written in Rust"
arch=(x86_64)
url="https://espanso.org/"
license=("GPL3")
depends=("xdotool" "xclip" "libxtst" "libnotify")
makedepends=("rust" "git" "cmake")
provides=($_pkgname)
conflicts=($_pkgname)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/federico-terzi/espanso.git#branch=${_branch}")
sha512sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"

    # don't change the original service file, as it will be embedded in the binary
    cp "src/res/linux/systemd.service" "systemd.service"
    sed -i "s|{{{espanso_path}}}|/usr/bin/espanso|g" "systemd.service"
}

build() {
    cd "$_pkgname"

    cargo build --release --locked
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "systemd.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
