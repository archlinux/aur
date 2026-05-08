# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)

_name=codex-proxy
pkgname=codex-proxy
pkgver=2.0.70
pkgrel=1
pkgdesc="Local headless proxy exposing ChatGPT Codex Responses API as OpenAI/Anthropic/Gemini-compatible endpoints"
arch=('x86_64')
url="https://github.com/icebear0828/codex-proxy"
license=('custom:non-commercial')
depends=('nodejs')
makedepends=('npm' 'rust')
backup=()
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "codex-proxy.sh"
        "codex-proxy.service")
sha256sums=('143a7ad861ff83974ae32ca5960fb27ee0e1dfc9329e3064930a9b576c3a71c3'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir/$_name-$pkgver"
    npm ci --include=dev
    (cd web && npm ci --include=dev)
    # Build native addon. makepkg's CFLAGS/LDFLAGS/RUSTFLAGS interfere
    # with how ring links its C/asm objects into the cdylib. Clear them
    # for the napi build to match a plain user-shell build.
    (cd native && npm ci --include=dev && \
     env -u CFLAGS -u CXXFLAGS -u LDFLAGS -u RUSTFLAGS -u CPPFLAGS \
         npm run build)
    npm run build
    npm prune --omit=dev
    (cd web && npm prune --omit=dev)
}

package() {
    cd "$srcdir/$_name-$pkgver"

    install -dm755 "$pkgdir/usr/lib/codex-proxy"
    cp -r dist node_modules package.json package-lock.json config "$pkgdir/usr/lib/codex-proxy/"

    install -dm755 "$pkgdir/usr/lib/codex-proxy/native"
    cp native/*.node native/index.js native/index.d.ts native/package.json \
        "$pkgdir/usr/lib/codex-proxy/native/"

    if [ -d public ]; then
        cp -r public "$pkgdir/usr/lib/codex-proxy/public"
    fi

    install -Dm755 "$srcdir/codex-proxy.sh" "$pkgdir/usr/bin/codex-proxy"
    install -Dm644 "$srcdir/codex-proxy.service" \
        "$pkgdir/usr/lib/systemd/user/codex-proxy.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
