# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=deepclaude-git
pkgver=r15.70518b6
pkgrel=3
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
    # Fix: hoist system-role messages out of the messages array into the
    # top-level `system` field. Claude Code sometimes emits a {role:"system"}
    # entry mid-conversation; Anthropic tolerates it but stricter backends
    # (DeepSeek's serde deserializer) reject it with
    # "messages[N].role: unknown variant `system`". Folding it into `system`
    # is the Anthropic-canonical, lossless representation.
    cat >> proxy/model-proxy.js <<'NORMALIZE_SYSTEM'

function normalizeSystemMessages(body) {
    if (!body || !Array.isArray(body.messages)) return false;
    let found = false;
    const extracted = [];
    const kept = [];
    for (const msg of body.messages) {
        if (msg && msg.role === 'system') {
            found = true;
            let text = '';
            if (typeof msg.content === 'string') {
                text = msg.content;
            } else if (Array.isArray(msg.content)) {
                text = msg.content
                    .filter(b => b && b.type === 'text' && typeof b.text === 'string')
                    .map(b => b.text)
                    .join('\n');
            }
            if (text) extracted.push(text);
        } else {
            kept.push(msg);
        }
    }
    if (!found) return false;
    body.messages = kept;
    if (extracted.length) {
        const merged = extracted.join('\n\n');
        if (body.system == null) {
            body.system = merged;
        } else if (typeof body.system === 'string') {
            body.system = body.system + '\n\n' + merged;
        } else if (Array.isArray(body.system)) {
            body.system.push({ type: 'text', text: merged });
        }
    }
    return true;
}
NORMALIZE_SYSTEM
    # Invoke alongside the existing thinking-block strips (covers every
    # forwarding path: non-anthropic backends and anthropic fallback).
    sed -i 's/stripAllThinkingBlocks(parsed);/stripAllThinkingBlocks(parsed); normalizeSystemMessages(parsed);/g' proxy/model-proxy.js
    sed -i 's/stripUnsignedThinkingBlocks(parsed);/stripUnsignedThinkingBlocks(parsed); normalizeSystemMessages(parsed);/g' proxy/model-proxy.js
}

package() {
    cd "$pkgname"
    install -Dm755 deepclaude.sh "$pkgdir/usr/bin/deepclaude"
    install -Dm644 proxy/start-proxy.js "$pkgdir/usr/lib/deepclaude/proxy/start-proxy.js"
    install -Dm644 proxy/model-proxy.js "$pkgdir/usr/lib/deepclaude/proxy/model-proxy.js"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
