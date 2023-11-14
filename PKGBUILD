# Maintainer: rtkay <dev at kanjala dot com>
_pkgname="mirro-rs"
pkgname="${_pkgname}-git"
pkgver=r158.d3c3066
pkgrel=1
makedepends=('git' 'cargo')
url=https://github.com/rtkay123/mirro-rs
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="An Arch Linux mirrorlist management tool with a TUI"
source=("git+$url")
license=('MIT' 'Apache')
md5sums=('SKIP')


pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked
}

check() {
    cd "$_pkgname"
    cargo test --frozen --all-features
}

build() {
    cd "$_pkgname"
    cargo build --frozen --release --features toml
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    out_dir=$(find target/release/build/ -wholename "*build/${_pkgname}*/out")
    install -Dm644 $out_dir/completions/${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
    install -Dm644 $out_dir/completions/${_pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 $out_dir/completions/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 $out_dir/man/${_pkgname}.1 "${pkgdir}/usr/share/man/man1/_${_pkgname}.1"
    install -Dm644 systemd/mirro-rs.service "${pkgdir}/usr/lib/systemd/system/mirro-rs.service"
    install -Dm644 systemd/mirro-rs.timer "${pkgdir}/usr/lib/systemd/system/mirro-rs.timer"
}
