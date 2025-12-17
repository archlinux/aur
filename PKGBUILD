pkgname=hdas-git
pkgver=1.0.0.r0.g22f96e5
pkgrel=1
pkgdesc="Track which packages create files in your home directory using eBPF"
arch=('x86_64')
url="https://github.com/adelmonte/hdas"
license=('GPL-3.0-only')
depends=('libbpf')
makedepends=('rust' 'clang' 'git')
provides=('hdas')
conflicts=('hdas')
options=(!lto)
install=hdas.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd hdas
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd hdas
    cargo build --release
}

package() {
    cd hdas
    install -Dm755 "target/release/hdas" "$pkgdir/usr/bin/hdas"
    install -Dm644 "hdas@.service" "$pkgdir/usr/lib/systemd/system/hdas@.service"
}
