# Maintainer: taotieren <admin@taotieren.com>

pkgname=autofilm
_tagname=1.5.1
pkgver="${_tagname//-/+}"
pkgrel=1
pkgdesc="A small project to provide Strm direct-link playback for Emby and Jellyfin servers, recommended for use with MediaWarp."
arch=($CARCH)
url="https://github.com/Akimio521/AutoFilm"
license=('AGPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
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
    'alist: File list program that supports multiple storage'
    'mediawarp: EmbyServer API Optimization: Optimize playback of Strm files, customize the front-end style, customize the allowed access to the client, embedded scripts, work with Alist to realize Emby playback of web resources, recommended to use with AutoFilm.'
    'emby-server: Bring together your videos, music, photos, and live television'
    'jellyfin-server: Jellyfin server backend')
backup=(etc/${pkgname}/config.yaml)
options=('!strip' '!debug' '!lto')
# install=${pkgname}.install
source=(
    "${pkgname}::git+${url}.git"
    "alist-client-rs::git+https://github.com/AkimioJR/alist-client-rs.git"
    "${pkgname}.service"
)
sha256sums=('SKIP'
            'SKIP'
            '17a27a4544f1b7db4a14c971425ae2be9c48db57e8410513e5df187070ebe7f3')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.alist-client-rs.url "$srcdir/alist-client-rs"
    git -c protocol.file.allow=always submodule update
  
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
   
    install -vDm755 "target/release/${pkgname}" -t "$pkgdir/usr/bin/"
    install -vDm644 "config/config.example.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
    install -vDm644 fonts/ch.ttf -t ${pkgdir}/usr/share/fonts/TTF/
    install -vDm644 fonts/en.otf -t ${pkgdir}/usr/share/fonts/OTF/
    install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
