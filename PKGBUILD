pkgname=rs-git-fsmonitor-git
pkgver=0.2.0.20200831.39a9cb0
pkgrel=1
pkgdesc="A fast git core.fsmonitor hook written in Rust"
arch=('x86_64')
url="https://github.com/jgavris/rs-git-fsmonitor"
license=('MIT')
depends=('gcc-libs' 'watchman')
makedepends=('git' 'cargo')
provides=('rs-git-fsmonitor')
conflicts=('rs-git-fsmonitor')
source=("${pkgname}::git+https://github.com/jgavris/rs-git-fsmonitor.git")
sha1sums=('SKIP')

build() {
    cd "${pkgname}"
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
    cd "${pkgname}"

    if [ ! -d "${pkgdir}/usr/bin" ]; then
        mkdir -p "${pkgdir}/usr"
    fi

    CARGO_INCREMENTAL=0 cargo install --path . --root "${pkgdir}/usr" --bins --frozen --offline

    local _f
    for _f in "${pkgdir}"/usr/{.crates.toml,.crates2.json}; do
        [ ! -e "$_f" ] || rm "$_f"
    done

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
