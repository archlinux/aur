# Maintainer: Your Name <you@example.com>
pkgname=odysseus-ai-git
pkgver=r915.dev
pkgrel=1
pkgdesc="Self-hosted AI workspace with chat, agents, deep research, calendar, email, and more"
arch=('any')
url="https://github.com/pewdiepie-archdaemon/odysseus"
license=('MIT')
depends=(
    'python>=3.11'
    'python-pip'
    'nodejs'
    'npm'
)
optdepends=(
    'tmux: required for Cookbook background model downloads and serving'
    'ollama: local model serving via Ollama'
)
makedepends=('git')
provides=('odysseus-ai')
conflicts=('odysseus-ai')
install=odysseus.install
source=(
    "$pkgname::git+https://github.com/pewdiepie-archdaemon/odysseus.git#branch=dev"
    'odysseus.desktop'
    'odysseus.svg'
    'odysseus.install'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --abbrev-ref HEAD)"
}

build() {
    : # venv is created in post_install as the real user
}

package() {
    cd "$pkgname"

    # Install app to /opt (no venv — built at install time)
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r . "$pkgdir/opt/$pkgname/"

    # Remove stuff not needed at runtime
    rm -rf "$pkgdir/opt/$pkgname/.git"
    rm -rf "$pkgdir/opt/$pkgname/.github"
    rm -rf "$pkgdir/opt/$pkgname/tests"

    # Patch and install the upstream service file
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    sed \
        -e "s|User=YOURUSER|# run as user via systemd --user|" \
        -e "s|WorkingDirectory=.*|WorkingDirectory=/opt/$pkgname|" \
        -e "s|ExecStart=.*|ExecStart=/opt/$pkgname/venv/bin/uvicorn app:app --host 127.0.0.1 --port 7000|" \
        -e "s|EnvironmentFile=.*|EnvironmentFile=-/opt/$pkgname/.env|" \
        odysseus-ui.service > "$pkgdir/usr/lib/systemd/user/odysseus.service"

    # Desktop entry
    install -Dm644 "$srcdir/odysseus.desktop" \
        "$pkgdir/usr/share/applications/odysseus.desktop"

    # Icon
    install -Dm644 "$srcdir/odysseus.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/odysseus.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
