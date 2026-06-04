# Maintainer: taotieren <admin@taotieren.com>

pkgname=adguardvpn-web-git
pkgver=r5.6a17fde
pkgrel=1
pkgdesc="AdGuard VPN Web Controller"
arch=($CARCH)
url="https://github.com/xaoyao/adguardvpn-web"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    libgcc
)
makedepends=(
    cargo-zigbuild
    git
)
optdepends=(
    "adguardvpn-cli-bin: Fast, flexible and reliable VPN solution for command-line enthusiasts."
)
backup=(etc/adguardvpn-web/config.toml)
options=('!lto' '!debug' '!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export RUSTUP_TOOLCHAIN=stable
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable

    install -Dm0755 target/release/adguardvpn-web -t "$pkgdir/usr/bin/"
    sed -i -e 's|/usr/local/|/usr/|g' config.toml

    sed -i -e 's|/opt/adguardvpn-web/config.toml|/etc/adguardvpn-web/config.toml|g' \
         -e 's|/opt/adguardvpn-web/adguardvpn-web|/usr/bin/adguardvpn-web|g' \
         -e 's|/opt/adguardvpn-web|/var/lib/adguardvpn-web|g' \
        deploy/adguardvpn-web.service
    
    install -vDm644 config.toml -t "$pkgdir/etc/${pkgname%-git}/"
    install -vDm644 deploy/adguardvpn-web.service -t "$pkgdir/usr/lib/systemd/system/"
    install -vdm755 "$pkgdir/var/lib/${pkgname%-git}/"
    cp -R static templates "$pkgdir/var/lib/${pkgname%-git}/"
    # install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
