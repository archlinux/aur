# shellcheck shell=bash
# shellcheck disable=SC2034
# Maintainer: Chinmay Dalal <~chinmay/public-inbox@lists.sr.ht>

declare pkgdir
pkgname=n2-git
pkgver=0.1.0.r557.b1fead5
pkgrel=1
pkgdesc='n2 ("into"), a ninja compatible build system'
arch=('x86_64' 'aarch64')
url='https://github.com/evmar/n2'
license=('Apache-2.0')
makedepends=(git cargo coreutils sed gcc)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}" 'ninja')
provides=("${pkgname%-git}" 'ninja')
_git_dir="${pkgname%-git}"
source=("${_git_dir}::git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd "${_git_dir}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
    cd "${_git_dir}" || exit 1
    printf "%s.r%s.%s" \
        "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_git_dir}" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${_git_dir}" || exit 1
    cargo test --frozen
}

package() {
    cd "${_git_dir}" || exit 1
    install -Dm755 target/release/"${pkgname%-git}" -t "$pkgdir/usr/bin/"
    ln -sf "/usr/bin/n2" "${pkgdir}/usr/bin/ninja"
}
