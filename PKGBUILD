# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=openclaw
pkgname=$_pkgname-esr
pkgver=2026.8.34
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
sha256sums=(39e80e7d2952362317d431f62c6d9fecff3b48e2de26482078378b6d6ba05f1f)
options=(!debug !strip)
install=$pkgname.install
noextract=($_pkgname-$pkgver.tgz)

package() {
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    npm install --silent --global --cache "$srcdir"/npm-cache \
        --prefix "$pkgdir"/usr "$srcdir"/$_pkgname-$pkgver.tgz

    # workaround: npm's postinstall fails openclaw's argv[1] check, leaving the
    # lifecycle marker uncleared and the cli erroring EACCES at runtime
    node "$pkgdir"/usr/lib/node_modules/$_pkgname/scripts/postinstall-bundled-plugins.mjs

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
