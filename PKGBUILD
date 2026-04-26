# Maintainer: justbispo <aur.fyxy0@slmail.me>

_pkgname="mise"
pkgname="$_pkgname-git"
pkgver=2026.4.23.r0.g9225550
pkgrel=1
pkgdesc='The front-end to your dev env'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
depends=(
    bzip2
    gcc-libs
    glibc
    openssl
)
makedepends=(
    cargo
    clang
    cmake
    git
)
optdepends=(
    'bash-completion: bash completion support'
    'usage: completion support'
)
provides=("$_pkgname")
conflicts=(
    rtx
    "$_pkgname"
)
replaces=(
    rtx
)
options=(
    '!emptydirs'
    '!lto'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"

    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${pkgname}"

    export OPENSSL_NO_VENDOR=true

    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}"

    export OPENSSL_NO_VENDOR=true
    export MISE_EXPERIMENTAL=1

    cargo test --frozen --all-features

    unset MISE_EXPERIMENTAL
}

package() {
    cd "${pkgname}"

    # package
    install --verbose -D --mode=0755 "target/release/${_pkgname}" --target-directory "${pkgdir}/usr/bin"

    # disable self-update
    install --verbose -D --mode=0644 /dev/null "${pkgdir}/usr/lib/mise/.disable-self-update"

    # license
    install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${_pkgname}"

    # docs
    install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${_pkgname}"
    install --verbose -D --mode=0644 man/man1/mise.1 --target-directory "${pkgdir}/usr/share/man/man1"

    # completion support
    install --verbose -D --mode=0644 completions/mise.bash "${pkgdir}/usr/share/bash-completion/completions/mise"
    install --verbose -D --mode=0644 completions/mise.fish "${pkgdir}/usr/share/fish/vendor_completions.d/mise.fish"
    install --verbose -D --mode=0644 completions/_mise "${pkgdir}/usr/share/zsh/site-functions/_mise"
}
