# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2155,SC2164,SC2291
# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on `zed-git`
# Original Maintainer: Caleb Maclennan <caleb@alerque.com>
# Original Contributor: Marcell Pardavi <marcell.pardavi@gmail.com>

_binname=gram-editor
_appid=gram
_pkgname='gram'
pkgname="${_pkgname}-git"
pkgver=.r0.geb4318f
pkgrel=1
pkgdesc='A code editor for humanoid apes and grumpy toads'
arch=(x86_64)
url='https://gram.liten.app/'
_url='https://codeberg.org/GramEditor/gram'
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
depends=(alsa-lib libasound.so
         curl libcurl.so
         fontconfig
         gcc-libs # libgcc_s.so libstdc++.so
         glibc # libc.so libm.so
         # libgit2 libgit2.so
         # libxau libXau.so
         libxcb # libxcb.so libxcb-xkb.so
         # libxdmcp libXdmcp.so
         libxkbcommon # libxkbcommon.so
         libxkbcommon-x11 # libxkbcommon-x11.so
         netcat
         'nodejs>=18'
         npm
         openssl libcrypto.so libssl.so
         sqlite
         vulkan-driver
         vulkan-icd-loader
         vulkan-tools
         wayland
         zlib libz.so
         zstd libzstd.so)
makedepends=(cargo
             cargo-about
             clang
             cmake
             git
             protobuf
             vulkan-headers
             vulkan-validation-layers)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${_url}.git")
sha256sums=('SKIP')

prepare() {
    cd                  "${srcdir}/${_pkgname}"
    cargo               fetch --locked --target "$(rustc --print host-tuple)"
    export              DO_STARTUP_NOTIFY="true"
    export              APP_ICON="gram"
    export              APP_NAME="Gram"
    export              APP_CLI="$_binname"
    export              APP_ID="$_appid"
    export              APP_ARGS="%U"
    envsubst < "crates/gram/resources/gram.desktop.in" > $_appid.desktop
    ./script/generate-licenses
}

pkgver() {
    cd                  "${srcdir}/${_pkgname}"
    local               lasttag="$(git tag --sort=-v:refname | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+-pre$' | head -1)"
    echo -n             "$(sed 's/^v//;s/-pre$//' <<< "$lasttag")"
    echo -n             ".r$(git rev-list "$(git merge-base HEAD "$lasttag")..HEAD" --count)"
    echo -n             ".g$(git log --pretty=format:'%h' --abbrev=7 -n1 HEAD)"
}

_srcenv() {
    cd                  "${srcdir}/${_pkgname}"
    export              RUSTUP_TOOLCHAIN=stable
    export              CARGO_TARGET_DIR=target
    CFLAGS+=' -ffat-lto-objects'
    CXXFLAGS+=' -ffat-lto-objects'
    RUSTFLAGS+=" --remap-path-prefix $PWD=/"
}

build() {
    _srcenv
    export              ZED_UPDATE_EXPLANATION='Updates are handled by pacman'
    export              RELEASE_VERSION="$pkgver"
    export              PROTOC=/usr/bin/protoc
    export              PROTOC_INCLUDE=/usr/include
    cargo               build --release --frozen --package gram --package cli
}

# Tests assume access to vulkan video drivers, Wayland window creation,
# detecting system keymaps, etc. Until there is something sensical for
# a package to test in the suite, just skip it by default.
check() {
    _srcenv
    # cargo             test --frozen --all-features
}

package() {
    cd                  "${srcdir}/${_pkgname}"
    install -Dm0755     target/release/cli                  "$pkgdir/usr/bin/$_binname"
    install -Dm0755     target/release/gram                 "$pkgdir/usr/lib/gram/gram-editor"
    install -Dm0644 -t  "$pkgdir/usr/share/applications/"   "$_appid.desktop"
    install -Dm0644     crates/gram/resources/app-icon.png  "$pkgdir/usr/share/icons/gram.png"
}
