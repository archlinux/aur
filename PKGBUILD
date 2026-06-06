# Maintainer: your name <your@email.com>
pkgname=odysseus-ai-git
pkgver=r915.dev
pkgrel=1
pkgdesc="Self-hosted AI workspace (chat, agents, deep research, email, calendar)"
arch=('x86_64' 'aarch64')
url="https://github.com/pewdiepie-archdaemon/odysseus"
license=('MIT')
depends=(
    'python'
    'python-pip'
    'tmux'
)
optdepends=(
    'searxng: web search backend'
    'ntfy: desktop/push notifications'
    'ollama: local model serving'
)
makedepends=('git')
provides=('odysseus-ai')
conflicts=('odysseus-ai')
backup=('etc/odysseus/env')
install=odysseus-ai-git.install
source=(
    "odysseus::git+https://github.com/pewdiepie-archdaemon/odysseus.git#branch=dev"
    "odysseus.service"
    "odysseus.desktop"
    "odysseus-ai-git.svg"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/odysseus"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --abbrev-ref HEAD)"
}

build() {
    cd "$srcdir/odysseus"
    python3 -m venv "$srcdir/venv"
    "$srcdir/venv/bin/pip" install --quiet --upgrade pip
    "$srcdir/venv/bin/pip" install --quiet -r requirements.txt
}

package() {
    cd "$srcdir/odysseus"

    # --- App source → /opt/odysseus ---
    install -dm755 "$pkgdir/opt/odysseus"
    cp -r . "$pkgdir/opt/odysseus/"

    # Drop things that must NOT ship
    rm -rf \
        "$pkgdir/opt/odysseus/.git" \
        "$pkgdir/opt/odysseus/data" \
        "$pkgdir/opt/odysseus/logs" \
        "$pkgdir/opt/odysseus/.env" \
        "$pkgdir/opt/odysseus/venv"

    # --- Relocate the venv → /opt/odysseus/venv ---
    cp -r "$srcdir/venv" "$pkgdir/opt/odysseus/venv"

    # Fix venv shebangs to point at installed path, not srcdir
    find "$pkgdir/opt/odysseus/venv/bin" -type f | \
        xargs -r grep -rlI "$srcdir/venv" | \
        xargs -r sed -i "s|$srcdir/venv|/opt/odysseus/venv|g"

    # --- Runtime data dirs ---
    local dirs=(
        var/lib/odysseus
        var/lib/odysseus/data
        var/lib/odysseus/data/uploads
        var/lib/odysseus/data/personal_docs
        var/lib/odysseus/data/personal_uploads
        var/lib/odysseus/data/tts_cache
        var/lib/odysseus/data/generated_images
        var/lib/odysseus/data/deep_research
        var/lib/odysseus/data/chroma
        var/lib/odysseus/data/rag
        var/lib/odysseus/data/memory_vectors
        var/lib/odysseus/logs
    )
    for d in "${dirs[@]}"; do
        install -dm755 "$pkgdir/$d"
    done

    # --- Config → /etc/odysseus/env ---
    install -dm755 "$pkgdir/etc/odysseus"
    install -Dm644 .env.example "$pkgdir/etc/odysseus/env"
    sed -i \
        -e 's|^#\s*DATABASE_URL=.*|DATABASE_URL=sqlite:////var/lib/odysseus/data/app.db|' \
        -e 's|^#\s*APP_BIND=.*|APP_BIND=127.0.0.1|' \
        -e 's|^#\s*APP_PORT=.*|APP_PORT=7000|' \
        -e 's|^#\s*AUTH_ENABLED=.*|AUTH_ENABLED=true|' \
        "$pkgdir/etc/odysseus/env"

    # --- systemd user service ---
    install -Dm644 "$srcdir/odysseus.service" \
        "$pkgdir/usr/lib/systemd/user/odysseus.service"

    # --- Desktop entry ---
    install -Dm644 "$srcdir/odysseus.desktop" \
        "$pkgdir/usr/share/applications/odysseus.desktop"

    # --- Icon ---
    install -Dm644 "$srcdir/odysseus-ai-git.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/odysseus.svg"

    # --- License ---
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
