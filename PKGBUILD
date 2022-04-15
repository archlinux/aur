# Maintainer: pinks <aur at papepati dot page>
pkgname=rome-git
pkgver=0.4.2.r56.g03c946ed9c
pkgrel=1
pkgdesc="Formatter, linter, bundler, and more for Javascript, Typescript, JSON, HTML, Markdown, and CSS."
arch=('any')
url='https://rome.tools'
license=('MIT')
makedepends=('cargo' 'git')
provides=('rome')
conflicts=('rome')
source=("${pkgname}::git+https://github.com/rome/tools.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc
    export CARGO_PROFILE_RELEASE_LTO='true'
    export RUSTFLAGS='-C strip=symbols'
    export CARGO_TARGET_DIR=target
    cargo build -p rome_lsp -p rome_cli --release
}

package() {
    cd "$pkgname"
    install -Dm0755 "target/release/rome" "${pkgdir}/usr/bin/rome"
    install -Dm0755 "target/release/rome_lsp" "${pkgdir}/usr/bin/rome_lsp"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
