# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=deepclaude-git
pkgver=r15.70518b6
pkgrel=2
pkgdesc='Use Claude Code with DeepSeek, OpenRouter, or any Anthropic-compatible backend'
arch=('any')
url='https://github.com/aattaran/deepclaude'
license=('MIT')
depends=('claude-code' 'nodejs')
makedepends=('git')
provides=('deepclaude')
conflicts=('deepclaude')
source=("${pkgname}::git+https://github.com/aattaran/deepclaude.git"
        'route-through-proxy.patch::https://github.com/aattaran/deepclaude/commit/710a7fb5a61ecf98c2b32271e61fc496d94d844f.patch')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    # PR #9: route default launch through proxy
    # (fixes thinking blocks, cost tracking, auth override)
    git apply "$srcdir/route-through-proxy.patch"
    sed -i 's|^SCRIPT_DIR=.*|SCRIPT_DIR="/usr/lib/deepclaude"|' deepclaude.sh
    # Don't set ANTHROPIC_API_KEY — conflicts with claude.ai OAuth login.
    # Proxy handles auth in-flight; OAuth alone is enough for Claude Code to start.
    sed -i 's|export ANTHROPIC_API_KEY=.*|unset ANTHROPIC_API_KEY|' deepclaude.sh
    # Fix: proxy log messages go to stderr, not stdout (stdout is for port number).
    # Bash script redirects stderr to log file so it doesn't pollute Claude Code's TUI.
    sed -i '/MODEL-PROXY/s/console\.log/console.error/' proxy/model-proxy.js
    sed -i 's|> "$port_file" &|> "$port_file" 2>/tmp/deepclaude-proxy.log \&|g' deepclaude.sh
    # Fix: legacy mode must not pass backends — causes default mode 'anthropic'
    # which routes everything to api.anthropic.com instead of the target URL
    sed -i 's/backends: hasBackends ? backends : undefined/backends: undefined/' proxy/start-proxy.js
}

package() {
    cd "$pkgname"
    install -Dm755 deepclaude.sh "$pkgdir/usr/bin/deepclaude"
    install -Dm644 proxy/start-proxy.js "$pkgdir/usr/lib/deepclaude/proxy/start-proxy.js"
    install -Dm644 proxy/model-proxy.js "$pkgdir/usr/lib/deepclaude/proxy/model-proxy.js"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
