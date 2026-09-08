# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Evert Vorster <evorster@gmail.com>
# Contributor: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>

pkgname=openclaw
_pkgver=2026.9.2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Multi-channel AI gateway with extensible messaging integrations'
arch=(x86_64 aarch64)
url=https://github.com/openclaw/openclaw
license=(MIT)

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
source=($pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
sha256sums=(3431f4cd2d8dbd6b936def2694ac27e19fa0256295cf4ada0f652ecf1c9ee520)
options=(!debug !strip)
install=$pkgname.install
noextract=($pkgname-$pkgver.tgz)

package() {
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    npm install --silent --global --cache "$srcdir"/npm-cache \
        --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # workaround: npm's postinstall fails openclaw's argv[1] check, leaving the
    # lifecycle marker uncleared and the cli erroring EACCES at runtime
    node "$pkgdir"/usr/lib/node_modules/$pkgname/scripts/postinstall-bundled-plugins.mjs

    cat > $pkgname <<'EOF'
#!/bin/sh
export SHARP_IGNORE_GLOBAL_LIBVIPS=1
exec node /usr/lib/node_modules/openclaw/openclaw.mjs "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname

    cd "$pkgdir"/usr/lib/node_modules/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md CHANGELOG.md
    for f in docs/*
    do ln -s /usr/lib/node_modules/$pkgname/"$f" "$pkgdir"/usr/share/doc/$pkgname/
    done
}
