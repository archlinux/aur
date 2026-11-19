# Maintainer: Mark Austin <ganthore@gmail.com>

pkgname=(gaia-amd gaia-amd-cli gaia-amd-webui)
pkgver=0.26.0
pkgrel=1
pkgdesc="AI-powered inference engine for AMD hardware"
arch=(x86_64)
url="https://github.com/amd/gaia"
license=(MIT)

# Dependencies follow upstream's own split (setup.py at this version):
#
#   depends    = everything in upstream's core install_requires, plus the
#                part of its [ui] extra that the Agent UI needs to start,
#                because this package's gaia.service and gaia-amd-webui
#                both run `gaia --ui`.
#   optdepends = upstream's other extras, each labelled with the feature it
#                enables, and external tools GAIA only calls when asked.
#
# Required packages that come from the AUR: python-apscheduler,
# python-discord, python-tavily-python, python-faiss (faiss-cpu or faiss-gpu).
#
# Runtime deps for gaia-amd; gaia-amd-cli and gaia-amd-webui override with
# their own depends=().
depends=(
    python
    # upstream core (install_requires)
    python-openai
    python-anthropic
    python-pydantic
    python-yaml
    python-numpy
    python-psutil
    python-dateutil
    python-dotenv
    python-aiohttp
    python-rich
    python-requests
    python-charset-normalizer
    python-idna
    python-httpx
    python-truststore
    python-beautifulsoup4
    python-watchdog
    python-pillow
    python-apscheduler
    python-tzlocal
    python-tomli-w
    python-keyring
    python-discord
    python-tavily-python
    python-cryptography
    # Agent UI server (from upstream's [ui] extra; faiss is imported at startup)
    python-fastapi
    uvicorn
    python-python-multipart
    python-faiss
    # model server; upstream refuses anything older
    'lemonade-server>=2026.44.1'
)
optdepends=(
    # upstream [ui]/[rag] extras: document formats
    'python-pypdfium2: PDF indexing for document chat (AUR)'
    'python-pypdf: PDF reading for document chat'
    'python-docx: Word document indexing and generation'
    'python-pptx: PowerPoint indexing and generation (AUR)'
    'python-openpyxl: Excel (xlsx) document skill'
    'python-reportlab: PDF generation document skill'
    # upstream [mcp], [browser], [image], [media-url], [notify], [slack] extras
    'python-mcp: MCP servers and the gaia-mcp bridge'
    'python-playwright: browser automation tools'
    'python-term-image: inline images in the terminal'
    'yt-dlp: reading media from URLs'
    'python-plyer: desktop notifications (AUR)'
    'python-slack-sdk: Slack messaging integration (AUR)'
    # upstream [talk], [diarize], [eval] extras
    'python-sounddevice: microphone and speaker I/O for gaia talk (AUR)'
    'python-websockets: realtime transcription for gaia talk'
    'python-sherpa-onnx: speaker diarization (AUR)'
    'python-pyarrow: gaia eval retrieval benchmarks'
    # external tools GAIA runs on demand
    'ffmpeg: transcribing audio and video recordings'
    'npm: MCP servers started with npx'
    'uv: MCP servers started with uvx'
)
makedepends=(
    git
    cmake
    ninja
    go
    python-setuptools
    python-wheel
    python-build
    python-installer
    nodejs
    npm
    electron44
    libappindicator
)

sha256sums=(1dbd95a6608bb41f7de66128318eaa38e04a763608fca67a71ac7fffd67f3dfe
            037ab4a7275fa111521ffb8d02c3e55cc7173fb7ff59431cd279d13ed7c22575
            2dc78e16a4f806faf9d58f8fd1e2608a8269f422a8bdd5787f71ff9bfe7e3de7
            3d185692ac7bd9834643052cb570a6a214878bf74f9e6e14b8c5115493bc7c7e)

source=("gaia-amd-$pkgver.tar.gz::https://github.com/amd/gaia/archive/refs/tags/v$pkgver.tar.gz"
        "gaia.service"
        "gaia-user.service"
        "gaia.sysusers")

# Apply a sed expression and fail the build unless it changes exactly one line,
# so a patch that stops matching upstream (or starts matching twice) is noticed
# instead of silently dropped or misapplied.
_sed_checked() {
    local _expr=$1 _file=$2 _changed
    cp "$_file" "$_file.orig"
    sed -i "$_expr" "$_file"
    _changed=$(diff "$_file.orig" "$_file" | grep -c '^>')
    if [[ $_changed != 1 ]]; then
        echo "==> ERROR: patch changed $_changed lines (expected 1) in ${_file#"$srcdir"/}: $_expr" >&2
        return 1
    fi
    rm "$_file.orig"
}

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    cd "$srcdir/gaia-$pkgver/cpp"
    cmake -B "$srcdir/build" -S . \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    # The desktop app runs only the `gaia` backend it ships, which it looks for
    # under process.resourcesPath. With system Electron that is
    # /usr/lib/electron44/resources, so let the wrapper script point it at our
    # install dir, where core/gaia links to /usr/bin/gaia. Without this the app
    # looks for ~/.gaia/venv, then `gaia` on PATH, and pip-installs its own copy
    # of GAIA into ~/.gaia/venv whenever that lookup or its version check fails.
    _sed_checked \
        's#path\.join(process\.resourcesPath, "core",#path.join(process.env.GAIA_RESOURCES_PATH || process.resourcesPath, "core",#' \
        "$srcdir/gaia-$pkgver/src/gaia/apps/webui/services/backend-installer.cjs"

    # Upstream turns Chromium's sandbox off on Linux because its AppImage and
    # .deb strip the chrome-sandbox helper. System Electron ships that helper
    # and Arch allows unprivileged user namespaces, so keep the sandbox on and
    # leave GAIA_NO_SANDBOX=1 as an explicit opt-out.
    _sed_checked \
        's#switches\.push(\["no-sandbox"\]);#if (TRUTHY.has(String(env.GAIA_NO_SANDBOX || "").trim().toLowerCase())) switches.push(["no-sandbox"]);#' \
        "$srcdir/gaia-$pkgver/src/gaia/apps/webui/services/chromium-switches.cjs"

    # Fetch the terminal UI's Go modules here so build() needs no network.
    cd "$srcdir/gaia-$pkgver/tui"
    export GOPATH="$srcdir/gopath"
    GOTOOLCHAIN=local GOFLAGS=-modcacherw go mod download

    # Likewise the Agent UI's npm modules. The build packs against system
    # Electron, so skip npm's own Electron binary.
    cd "$srcdir/gaia-$pkgver/src/gaia/apps/webui"
    ELECTRON_SKIP_BINARY_DOWNLOAD=1 npm ci --no-audit --no-fund
}

build() {
    cmake --build "$srcdir/build" -j$(nproc)

    # Terminal UI (gaia-cli)
    cd "$srcdir/gaia-$pkgver/tui"
    local _gopkg=github.com/amd/gaia/tui/internal/cli
    local _date
    _date=$(date -u -d "@${SOURCE_DATE_EPOCH:-0}" +%Y-%m-%dT%H:%M:%SZ)
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    # Everything was fetched in prepare(); never download here.
    export GOPROXY=off GOTOOLCHAIN=local
    go build \
        -ldflags "-linkmode=external -X $_gopkg.version=$pkgver -X $_gopkg.commit=v$pkgver -X $_gopkg.date=$_date" \
        -o "$srcdir/build-tui/gaia-cli" ./cmd/gaia

    # Build browser frontend first so package_data picks up dist/
    cd "$srcdir/gaia-$pkgver/src/gaia/apps/webui"
    npm run build

    cd "$srcdir/gaia-$pkgver"
    python -m build --wheel --no-isolation

    local _electronver
    _electronver=$(cat /usr/lib/electron44/version)
    cd "$srcdir/gaia-$pkgver/src/gaia/apps/webui"
    ELECTRON_BUILDER_OFFLINE=true \
    ./node_modules/.bin/electron-builder --linux dir --x64 \
        --publish never \
        -c.electronDist=/usr/lib/electron44 \
        -c.electronVersion="$_electronver"
}

package_gaia-amd() {
    options=(!strip)
    install=gaia-amd.install

    DESTDIR="$pkgdir" cmake --install "$srcdir/build"

    cd "$srcdir/gaia-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm755 "$srcdir/build/vlm_agent" "$pkgdir/usr/bin/gaia-vlm"
    install -Dm755 "$srcdir/build/security_demo" "$pkgdir/usr/bin/gaia-security-demo"

    install -Dm644 "$srcdir/gaia.service"      "$pkgdir/usr/lib/systemd/system/gaia.service"
    install -Dm644 "$srcdir/gaia-user.service" "$pkgdir/usr/lib/systemd/user/gaia.service"
    install -Dm644 "$srcdir/gaia.sysusers"     "$pkgdir/usr/lib/sysusers.d/gaia.conf"

    install -Dm644 "$srcdir/gaia-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    if [[ -f "$srcdir/gaia-$pkgver/scripts/gaia.bash-completion" ]]; then
        install -Dm644 "$srcdir/gaia-$pkgver/scripts/gaia.bash-completion" \
            "$pkgdir/usr/share/bash-completion/completions/gaia"
    fi
    if [[ -f "$srcdir/gaia-$pkgver/share/man/man1/gaia.1" ]]; then
        install -Dm644 "$srcdir/gaia-$pkgver/share/man/man1/gaia.1" \
            "$pkgdir/usr/share/man/man1/gaia.1"
    fi
}

package_gaia-amd-cli() {
    pkgdesc="Terminal UI for the AMD Gaia inference engine"
    # The GAIA agent it talks to is not packaged: first-run setup (`gaia init`,
    # which gaia-cli runs through gaia-amd) downloads it into ~/.gaia.
    depends=("gaia-amd=$pkgver" glibc hicolor-icon-theme)
    optdepends=('wl-clipboard: paste images from the clipboard (Wayland)'
                'xclip: paste images from the clipboard (X11)')

    install -Dm755 "$srcdir/build-tui/gaia-cli" "$pkgdir/usr/bin/gaia-cli"

    local _linux="$srcdir/gaia-$pkgver/installer/tui/linux"
    install -Dm644 "$_linux/gaia-tui.desktop" "$pkgdir/usr/share/applications/gaia-tui.desktop"
    install -Dm644 "$_linux/gaia-cli.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gaia-cli.png"

    install -Dm644 "$srcdir/gaia-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_gaia-amd-webui() {
    pkgdesc="Electron desktop UI for the AMD Gaia inference engine"
    # Same version: the app treats /usr/bin/gaia as the backend it ships.
    depends=("gaia-amd=$pkgver" electron44 libappindicator hicolor-icon-theme)
    optdepends=('ngrok: mobile access / remote tunnel feature')

    local _resources="$srcdir/gaia-$pkgver/src/gaia/apps/webui/dist-app/linux-unpacked/resources"

    install -dm755 "$pkgdir/usr/lib/gaia-amd-webui"
    cp -r --no-preserve=mode "$_resources/." "$pkgdir/usr/lib/gaia-amd-webui/"
    # Electron's own default app, copied in from the system Electron at pack
    # time, and the bundled-agents folder, which holds only a README in a source
    # build (first-run setup downloads the GAIA agent instead).
    rm -f "$pkgdir/usr/lib/gaia-amd-webui/default_app.asar"
    rm -rf "$pkgdir/usr/lib/gaia-amd-webui/agents"

    # The backend the app "ships" is the gaia-amd package (see prepare()).
    install -dm755 "$pkgdir/usr/lib/gaia-amd-webui/core"
    ln -s /usr/bin/gaia "$pkgdir/usr/lib/gaia-amd-webui/core/gaia"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/gaia-amd-webui" <<'EOF'
#!/bin/sh
export GAIA_RESOURCES_PATH=/usr/lib/gaia-amd-webui
# Updates come from pacman, not from the app's own updater.
export GAIA_DISABLE_UPDATE=1
# Chromium's sandbox is on. If the window never appears on a kernel that
# forbids unprivileged user namespaces, run with GAIA_NO_SANDBOX=1.
exec /usr/bin/electron44 /usr/lib/gaia-amd-webui/app.asar "$@"
EOF

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/gaia-amd.desktop" <<EOF
[Desktop Entry]
Name=GAIA Agent UI
Comment=Privacy-first agentic AI interface
Exec=/usr/bin/gaia-amd-webui %U
Icon=gaia-amd
Terminal=false
Type=Application
Categories=Development;Utility;
StartupWMClass=gaia-desktop
EOF

    install -Dm644 "$srcdir/gaia-$pkgver/installer/linux/gaia-agent-ui.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/gaia-amd.png"

    install -Dm644 "$srcdir/gaia-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
