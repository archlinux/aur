# Maintainer: Mike Lei <mikelei@duck.com>

pkgname=sublime-keygen-git
pkgver=1.0.r4.g6e0dc44
pkgrel=1
pkgdesc="Cross-platform KEYGEN for Sublime products"
arch=("x86_64" "aarch64")
url="https://github.com/Antibioticss/sublime-keygen"
license=("MIT")
depends=()
makedepends=("git" "zig")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i -r '/\.os_tag = \.(macos|windows),/d' build.zig
    sed -i '/\.cpu_arch = \.'$([[ $CARCH == x86_64 ]] && echo aarch64 || echo x86_64)',/d' build.zig
}

build() {
    cd "$srcdir/${pkgname%-git}"
    zig build -Doptimize=ReleaseSmall
}

package() {
    install -Dm755 "$srcdir/${pkgname%-git}/zig-out/$CARCH-linux-musl/subkg" "$pkgdir/usr/bin/subkg"
}
