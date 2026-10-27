# Maintainer: wuxxin <wuxxin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

pkgname=moltis-git
pkgver=20261023.01.r1.g8a12400dc
pkgrel=1
pkgdesc="A personal AI gateway written in Rust. One binary, sandboxed, secure. (Git VCS version)"
arch=('x86_64' 'aarch64')
url="https://github.com/moltis-org/moltis"
license=('MIT')
provides=("moltis")
conflicts=("moltis")
replaces=()
depends=(
    gcc-libs
    glibc
    zlib
)
optdepends=(
    'systemd: for cgroup sandboxing (systemd-run) and service management'
)
makedepends=(
    clang
    cargo
    cmake
    git
    nodejs
    npm
    just
)
backup=()
options=(!lto !debug)
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"

    # Pre-fetch npm dependencies for web UI
    (
        cd crates/web/ui
        npm ci --ignore-scripts
    )

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/build"

    # Build web UI assets
    just build-web-assets

    # Build release binary (portable feature set per upstream release packaging guidelines)
    cargo build --release -p moltis --no-default-features --features portable
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm0755 target/release/moltis -t "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/moltis/web"
    cp -R --no-preserve=mode crates/web/src/assets/* "${pkgdir}/usr/share/moltis/web/"
    install -d "${pkgdir}/usr/share/moltis/docs"
    cp -R -L --no-preserve=mode docs/src/* "${pkgdir}/usr/share/moltis/docs/"
    install -Dm0644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
