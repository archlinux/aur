# Maintainer: jin <mail@nvimer.org>
pkgname=deepseek-reasonix-desktop
_pkgname=reasonix-desktop
pkgver=1.24.1
pkgrel=1
pkgdesc="Reasonix desktop — a Wails shell around the DeepSeek-native AI coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('go' 'pnpm' 'wails')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/esengine/DeepSeek-Reasonix/archive/refs/tags/desktop-v$pkgver.tar.gz")
sha256sums=('d3ea997ba55a5369549a014d540457cba980b8a7591e30e2abb9decea4e8a074')

prepare() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"

    # Upstream pins engines.pnpm ">=10 <11" in the frontend manifest, and pnpm
    # enforces its own engines range unconditionally (engine-strict=false does
    # not disable it), so the `pnpm install` wails runs aborts against Arch's
    # pnpm 11. Drop the pin — the lockfile is lockfileVersion 9, which pnpm 11
    # reads natively. engines.node (">=24") is left in place and satisfied.
    node -e '
      const fs = require("fs");
      const f = "desktop/frontend/package.json";
      const p = JSON.parse(fs.readFileSync(f, "utf8"));
      delete p.engines.pnpm;
      fs.writeFileSync(f, JSON.stringify(p, null, 2) + "\n");
    '
}

build() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver/desktop"
    wails build -clean -trimpath -tags webkit2_41 \
        -ldflags "-s -w -X main.version=v$pkgver"
}

package() {
    cd "DeepSeek-Reasonix-desktop-v$pkgver"
    install -Dm755 "desktop/build/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 desktop/build/linux/reasonix.desktop \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 desktop/build/appicon.png \
        "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
