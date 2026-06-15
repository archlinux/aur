# Maintainer: taotieren <admin@taotieren.com>

pkgname=autofilm-git
pkgver=1.5.1.r141.gef93942
pkgrel=3
pkgdesc="A small project to provide Strm direct-link playback for Emby and Jellyfin servers, recommended for use with MediaWarp."
arch=($CARCH)
url="https://github.com/Akimio521/AutoFilm"
license=('AGPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(
    glibc
    libgcc
)
makedepends=(
    git
    rust
)
optdepends=(
    'openlist: A new AList Fork to Anti Trust Crisis'
    'mediawarp: EmbyServer API Optimization: Optimize playback of Strm files, customize the front-end style, customize the allowed access to the client, embedded scripts, work with Alist to realize Emby playback of web resources, recommended to use with AutoFilm.'
    'emby-server: Bring together your videos, music, photos, and live television'
    'jellyfin-server: Jellyfin server backend'
)
backup=(etc/${pkgname%-git}/config.yaml)
options=('!strip' '!debug' '!lto')
# install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git"
    "alist-client-rs::git+https://github.com/AkimioJR/alist-client-rs.git"
    "${pkgname%-git}.service"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

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
    git submodule init
    git config submodule.alist-client-rs.url "$srcdir/alist-client-rs"
    git -c protocol.file.allow=always submodule update
    sed -i -e 's|/fonts/ch.ttf|/usr/share/fonts/TTF/FZFengYaSongS-GB.ttf|g' \
        -e 's|/fonts/en.otf|/usr/share/fonts/OTF/Melete-UltraLight.otf|g' \
        config/config.example.yaml

    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}"

    cargo build  --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}"
   
    install -vDm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
    install -vDm644 "config/config.example.yaml" "${pkgdir}/etc/${pkgname%-git}/config.yaml"
    install -vDm644 fonts/ch.ttf ${pkgdir}/usr/share/fonts/TTF/FZFengYaSongS-GB.ttf
    install -vDm644 fonts/en.otf ${pkgdir}/usr/share/fonts/OTF/Melete-UltraLight.otf
    install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 "${srcdir}/${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
