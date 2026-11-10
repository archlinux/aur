# Maintainer: Michael Herstine <sp1ff at pobox dot com>

pkgname=indielinks-git
_pkgname=${pkgname%-git}
pkgver=v0.0.2.r21.g4ba5850
pkgrel=1
pkgdesc="del.icio.us in the Fediverse (git version)"
arch=('x86_64')
url=https://github.com/sp1ff/indielinks
license=('GPL-3.0-or-later')
# https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20#note_172172
options=(!lto)
depends=('openssl' 'glibc' 'gcc-libs' 'bash' 'acl' 'tailwindcss-bin')
optdepends=('scylla-bin')
# `cargo` (and the Rust toolchain generally) is required, but I don't want to require
# the package, since it may have been installed in another way
makedepends=('git' 'protobuf')
conflicts=('indielinks')
install='.INSTALL'
source=("${_pkgname}::git+https://github.com/sp1ff/indielinks.git"
        'indielinks.toml'
        'indielinks.service')
sha256sums=('SKIP'
            '6ce07bf80bf9a31019a41f8bd671b1a4a5fc958bebb3116b6690da4660a83c66'
            '4254ea7c35897861c280e540d2a467227ac66451c3b19730ef59efb512848493')
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
    tailwindcss -i style.css -o tailwind.css
    INDIELINKS_BASE="" INDIELINKS_PAGE_SIZE="20" trunk build --release
}

package() {
    cd "$_pkgname"
    install -Dm755 target/release/indielinksd        "$pkgdir/usr/bin/indielinksd"
    install -Dm755 target/release/indic              "$pkgdir/usr/bin/indic"
    install -Dm755 target/release/indielinks-schemas "$pkgdir/usr/bin/indielinks-schemas"
    install -Dm755 scripts/indielinks-ctl            "$pkgdir/usr/bin/indielinks-ctl"
    install -Dm755 scripts/indielinks-post-install   "$pkgdir/usr/bin/indielinks-post-install"
    
    cd indielinks-fe/dist
    wasm=$(ls -1 indielinks-fe*.wasm)
    js=$(ls -1 indielinks-fe*.js)
    css=$(ls -1 tailwind-*.css)
    mv $wasm indielinks-fe.wasm
    mv $js indielinks-fe.js
    mv $css style.css
    sed -i -e "s@${wasm}@indielinks-fe.wasm@g" index.html
    sed -i -e "s@${js}@indielinks-fe.js@g" index.html
    sed -i -e "s@${css}@style.css@g" index.html

    install -Dm644 index.html         "$pkgdir/usr/share/indielinks/assets/index.html"
    install -Dm644 indielinks-fe.js   "$pkgdir/usr/share/indielinks/assets/indielinks-fe.js"
    install -Dm644 style.css          "$pkgdir/usr/share/indielinks/assets/style.css"
    install -Dm644 indielinks-fe.wasm "$pkgdir/usr/share/indielinks/assets/indielinks-fe.wasm"

    cd ../../..
    install -Dm644 indielinks.service "$pkgdir/usr/lib/systemd/system/indielinks.service"

    if [ -f /etc/indielinks.toml  ]; then
        peppers=$(grep -m1 -A1 -e '^\[pepper.peppers\]' /etc/indielinks.toml 2>/dev/null || true)
        keys=$(grep -m1 -A1 -e '^\[signing-keys.signing-keys.keys\]' /etc/indielinks.toml 2>/dev/null || true)
        content=$(cat indielinks.toml; printf x)
        content=${content%x}
        rendered=${content//PEPPER/"$peppers"}
        rendered=${rendered//SIGNINGKEYS/"$keys"}
        printf '%s' "$rendered" > "$pkgdir/etc/indielinks.toml"
        chmod 600 "$pkgdir/etc/indielinks.toml"
    else
        install -Dm600 indielinks.toml "$pkgdir/etc/indielinks.toml"
        $pkgdir/usr/bin/indielinks-schemas secrets "$pkgdir/etc/indielinks.toml"
    fi
}

backup=('etc/indielinks.toml')
