pkgname=wait-tray-ready-git
pkgver=0.1.0.20231212.0e08d9b
pkgrel=1
pkgdesc="A small utility to wait for a system tray to be ready"
arch=('x86_64')
url="https://gitlab.com/ssfdust/wait-tray-ready"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('wait-tray-ready')
conflicts=('wait-tray-ready')
source=("$pkgname::git+https://gitlab.com/ssfdust/wait-tray-ready.git")
sha1sums=('SKIP')

build() {
    cd "$pkgname"
    CARGO_INCREMENTAL=0 cargo build --release --locked
}

pkgver () {
    cd "${srcdir}/${pkgname}"
    printf "%s.%s.%s" \
        "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2)" \
        "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    if [ ! -d "$pkgdir/usr/bin" ]; then
        mkdir -p "$pkgdir/usr"
    fi

    CARGO_INCREMENTAL=0 cargo install --path . --root "$pkgdir/usr" --bins --frozen --offline

    local _f
    for _f in "$pkgdir"/usr/{.crates.toml,.crates2.json}; do
        [ ! -e "$_f" ] || rm "$_f"
    done

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
