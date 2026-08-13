# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=openclaw
pkgname=$_pkgname-esr
pkgver=2026.6.33
pkgrel=1
pkgdesc="Multi-channel AI gateway with extensible messaging integrations (extended stable release)"
arch=(x86_64 aarch64)
url=https://github.com/openclaw/openclaw
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
depends=('nodejs>=22')
makedepends=(npm)
optdepends=(
    '1password-cli: 1password skill'
    'curl: weather, openai-whisper-api skills'
    'ffmpeg: video-frames skill'
    'github-cli: github, gh-issues skills'
    'jq: session-logs, trello skills'
    'python-openai-whisper: openai-whisper skill'
    'ripgrep: session-logs skill'
    'tmux: tmux skill'
    'uv: nano-pdf skill'
    'go: for installing skill tools not packaged for Arch'
)
source=($_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
sha256sums=(96880d5a9fe3ef6b3d2ec0ac016e48f99fff7b1af4e22b7c814db6357c163952)
options=(!debug !strip)
install=$pkgname.install
noextract=($_pkgname-$pkgver.tgz)

package() {
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    npm install --silent --global --cache "$srcdir"/npm-cache \
        --prefix "$pkgdir"/usr "$srcdir"/$_pkgname-$pkgver.tgz

    cat > $_pkgname <<'EOF'
#!/bin/sh
export SHARP_IGNORE_GLOBAL_LIBVIPS=1
exec node /usr/lib/node_modules/openclaw/openclaw.mjs "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin $_pkgname

    cd "$pkgdir"/usr/lib/node_modules/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md CHANGELOG.md
    for f in docs/*
    do ln -s /usr/lib/node_modules/$_pkgname/"$f" "$pkgdir"/usr/share/doc/$pkgname/
    done
}
