# Maintainer: 5unekku <swagalicious@awesomsauce.net>
_pkgname=gfake
pkgname=${_pkgname}-git
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI to rewrite git commit author and committer dates"
arch=("any")
url="https://gitlab.com/5unekku/gfake"
license=("BSD-3-Clause")
depends=('git' 'fontconfig' 'libxkbcommon')
optdepends=('vulkan-icd-loader: GPU rendering via Vulkan' 'libglvnd: GPU rendering via OpenGL' 'wayland: Wayland session support' 'libx11: X11 session support')
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local version count hash
    version=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
    count=$(git rev-list --count HEAD)
    hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.%s" "${version}" "${count}" "${hash}"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
