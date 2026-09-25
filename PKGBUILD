# Maintainer: Lemuel De Los Santos <aur@lemueldls.dev>
pkgname=typbase
pkgver=0.2.2
pkgrel=1
pkgdesc="Local-first knowledge base made for Typst and the Atmosphere."
arch=('x86_64')
url="https://github.com/lemueldls/typbase"
license=('AGPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'openssl')
makedepends=('cargo' 'nodejs' 'pnpm' 'git' 'file' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'rustup' 'wasm-pack')
options=('!strip' '!emptydirs')
source=("typbase-v$pkgver.tar.gz::https://github.com/lemueldls/typbase/archive/refs/tags/typbase-v$pkgver.tar.gz")
sha256sums=('fd40f61270c69b9c8829e7e3de8f096fd33c53b808243e333c037196e3e2dfc6')
_builddir="$pkgname-typbase-v$pkgver"

prepare() {
    cd "$srcdir/$_builddir" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    rustup toolchain install $RUSTUP_TOOLCHAIN --profile minimal --no-self-update
    rustup target add wasm32-unknown-unknown
    pnpm install --frozen-lockfile
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_builddir" || exit 1
    export RUSTUP_TOOLCHAIN=stable
    # LTO flags from makepkg.conf break linking for some native deps; clear them.
    export CFLAGS="${CFLAGS//-flto=auto//}"
    export NUXT_PUBLIC_APP_URL="https://typbase.at"
    cd apps/native || exit 1
    # tauri.package.conf.json points beforeBuildCommand at
    # `pnpm -w run generate:direct`, so the frontend builds without moon and
    # the tarball's missing git metadata is fine.
    pnpm tauri build -b deb -c tauri.package.conf.json
}

package() {
    cd "$srcdir/$_builddir" || exit 1
    install -Dm755 target/release/typbase "$pkgdir"/usr/bin/typbase

    cd "target/release/bundle/deb/Typbase_${pkgver}_amd64/data" || exit 1
    install -Dm644 usr/share/applications/Typbase.desktop "$pkgdir"/usr/share/applications/Typbase.desktop
    install -Dm644 usr/share/icons/hicolor/32x32/apps/typbase.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/typbase.png
    install -Dm644 usr/share/icons/hicolor/128x128/apps/typbase.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/typbase.png
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/typbase.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/typbase.png
    install -Dm644 usr/share/licenses/typbase/LICENSE "$pkgdir"/usr/share/licenses/typbase/LICENSE
}
