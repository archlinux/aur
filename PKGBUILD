# Maintainer: Michael Herstine <sp1ff at pobox dot com>

pkgname=indielinks-git
_pkgname=${pkgname%-git}
pkgver=r110.fb1a20e
pkgrel=1
pkgdesc="del.icio.us in the Fediverse (git version)"
arch=('x86_64')
url=https://github.com/sp1ff/indielinks
license=('GPL-3.0-or-later')
# https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20#note_172172
options=(!lto)
depends=('openssl' 'glibc' 'gcc-libs' 'scylla-bin' 'bash')
# `cargo` (and the Rust toolchain generally) is required, but I don't want to require
# the package, since it may have been installed in another way
makedepends=('git' 'protobuf')
provides=('indielinks')
conflicts=('indielinks')
source=("${_pkgname}::git+https://github.com/sp1ff/indielinks.git"
        'indielinks.toml')
sha256sums=('SKIP'
            'fe997211c5c3b5aaed864228bb6c6b0344de0296e73e912db742ddcb6e255d12')
_nproc=$(($(nproc)/4))
if [ $_nproc -eq 0 ]; then
    _nproc=1
fi

pkgver() {
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$_pkgname"
    cargo build --release -j ${_nproc}
    cd indielinks-fe
    INDIELINKS_FE_API="http://localhost:20676" INDIELINKS_BASE="/fe" INDIELINKS_PAGE_SIZE="20" trunk build --release
}

package() {
    cd "$_pkgname"
    install -Dm755 target/release/indielinksd        "$pkgdir/usr/bin/indielinksd"
    install -Dm755 target/release/indic              "$pkgdir/usr/bin/indic"
    install -Dm755 target/release/indielinks-schemas "$pkgdir/usr/bin/indielinks-schemas"
    install -Dm755 scripts/indielinks-post-install   "$pkgdir/usr/bin/indielinks-post-install"
    
    cd indielinks-fe/dist
    wasm=$(ls -1 indielinks-fe*.wasm)
    js=$(ls -1 indielinks-fe*.js)
    css=$(ls -1 style-*.css)
    mv $wasm indielinks-fe.wasm
    mv $js indielinks-fe.js
    mv $css style.css
    sed -i -e s@$wasm@fe/indielinks-fe.wasm@g index.html
    sed -i -e s@$js@fe/indielinks-fe.js@g index.html
    sed -i -e s@$css@fe/style.css@g index.html

    install -Dm644 index.html         "$pkgdir/usr/share/indielinks/assets/index.html"
    install -Dm644 indielinks-fe.js   "$pkgdir/usr/share/indielinks/assets/indielinks-fe.js"
    install -Dm644 style.css          "$pkgdir/usr/share/indielinks/assets/style.css"
    install -Dm644 indielinks-fe.wasm "$pkgdir/usr/share/indielinks/assets/indielinks-fe.wasm"

    cd ../../..
    install -Dm644 indielinks.toml "$pkgdir/etc/indielinks.toml"
}
