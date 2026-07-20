# Maintainer: Mark Austin <ganthore@gmail.com>

pkgname=(gaia-amd gaia-amd-webui)
pkgver=0.22.0
pkgrel=1
pkgdesc="AI-powered inference engine for AMD hardware"
arch=(x86_64)
url="https://github.com/amd/gaia"
license=(MIT)

# AUR-only deps (must be installed via an AUR helper or manually):
#   lemonade-server, python-faiss, python-sentence-transformers,
#   python-transformers, python-accelerate

# Runtime deps for gaia-amd; gaia-amd-webui overrides with its own depends=()
depends=(
    python
    python-requests
    python-aiohttp
    python-pydantic
    python-dotenv
    python-rich
    python-fastapi
    uvicorn
    python-psutil
    python-pymupdf
    python-pypdf
    python-torchvision
    python-joblib
    python-cloudpickle
    python-prompt_toolkit
    python-typer
    python-async-lru
    python-fsspec
    python-pyarrow
    python-cryptography
    python-lz4
    python-orjson
    python-cachetools
    python-lxml
    python-greenlet
    python-msgpack
    python-toml
    python-fastjsonschema
    python-python-multipart
    python-httpx
    python-keyring
    python-numpy
    python-beautifulsoup4
    python-faiss
    python-sentence-transformers
    python-transformers
    'python-tokenizers<0.23'  # python-transformers fails to build against tokenizers 0.23+
    python-accelerate
    python-aiodns
    python-openai
    lemonade-server
)
makedepends=(
    git
    cmake
    ninja
    python-setuptools
    python-wheel
    python-build
    python-installer
    nodejs
    npm
    electron40
    libappindicator
)

sha256sums=(284031c728e9c189d08a7831dfd41f691a1f79304bdaba0d19facf25821e2fd5
            96ab23bd2b0d3d402a6c3160f0f5016f582994533723b503098deb042ebbcb03
            13598d2e9294b09ac7cf26739a0ae42acc4993fc2e63ac94a7867ec3d22c99df
            3d185692ac7bd9834643052cb570a6a214878bf74f9e6e14b8c5115493bc7c7e)

source=("gaia-amd-$pkgver.tar.gz::https://github.com/amd/gaia/archive/refs/tags/v$pkgver.tar.gz"
        "gaia.service"
        "gaia-user.service"
        "gaia.sysusers")

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    cd "$srcdir/gaia-$pkgver/cpp"
    cmake -B "$srcdir/build" -S . \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    # Upstream bug: tray-manager passes the raw 4096x4096 app icon to the Tray
    # constructor. The pixel data (~67MB uncompressed RGBA) exceeds the D-Bus
    # session bus message limit, so KDE's StatusNotifierWatcher silently drops
    # the registration and no tray icon appears. Resize to 22px at load time
    # (standard KDE Plasma tray icon size) before handing it to Electron.
    sed -i \
        's#return nativeImage\.createFromPath(iconPath);#return nativeImage.createFromPath(iconPath).resize({ width: 22, height: 22 });#' \
        "$srcdir/gaia-$pkgver/src/gaia/apps/webui/services/tray-manager.cjs"

    local _webui="$srcdir/gaia-$pkgver/src/gaia/apps/webui"

    # With system Electron the binary is at /usr/bin/electron40, so
    # process.resourcesPath resolves to /usr/lib/electron40/resources/ rather
    # than our install dir. The wrapper script exports GAIA_RESOURCES_PATH so
    # these two services find agents/ and vendor/uv/ in the right place.
    # Use # as delimiter to avoid conflicts with | in the replacement strings.
    sed -i \
        's#path\.join(process\.resourcesPath, "agents")#path.join(process.env.GAIA_RESOURCES_PATH || process.resourcesPath, "agents")#' \
        "$_webui/services/agent-seeder.cjs"
    sed -i \
        's#const resourcesPath = process\.resourcesPath;#const resourcesPath = process.env.GAIA_RESOURCES_PATH || process.resourcesPath;#' \
        "$_webui/services/backend-installer.cjs"

    # lemond v10.6.0 passes bare --flash-attn (no value) to llama-server for
    # Gemma-4 models; llama-server requires --flash-attn on. Explicitly supply
    # the arg so the default model loads on first run.
    sed -i \
        's/prompt=False$/prompt=False, llamacpp_args="--flash-attn on"/' \
        "$srcdir/gaia-$pkgver/src/gaia/ui/server.py"

    # The lifespan calls keyring (via tripwire_check) which blocks until
    # kwalletd responds — up to 7+ minutes if KWallet isn't running yet.
    # Port 4200 never opens until the lifespan yields. Bypass the system
    # keyring for the Electron-spawned backend; OAuth connectors fall back
    # to prompting for credentials at first use.
    # Also set GAIA_SKIP_DEVICE_CHECK: the device support check is Windows-only;
    # on Linux it always returns false and shows a warning banner.
    sed -i \
        's/env: { \.\.\.process\.env }/env: { ...process.env, PYTHON_KEYRING_BACKEND: "keyring.backends.null.Keyring", GAIA_SKIP_DEVICE_CHECK: "1" }/' \
        "$srcdir/gaia-$pkgver/src/gaia/apps/webui/main.cjs"

    # The onboarding wizard installs lemonade via Ubuntu PPA — useless on Arch.
    # Mark the install as initialized on any non-Windows platform so the UI
    # opens directly to the chat interface rather than the setup wizard.
    sed -i \
        's/status\.initialized = init_marker\.exists()/status.initialized = init_marker.exists() or sys.platform != "win32"/' \
        "$srcdir/gaia-$pkgver/src/gaia/ui/routers/system.py"

    # lemond v10+ returns ctx_size=0 in its health response when it does not
    # track context size. The status endpoint guards the sufficiency check with
    # `is not None`, so 0 passes through and triggers a false "context window
    # too small" banner. Treat 0 the same as None (not reported).
    sed -i \
        's/if status\.model_context_size is not None:/if status.model_context_size:/' \
        "$srcdir/gaia-$pkgver/src/gaia/ui/routers/system.py"

    # The ConnectionBanner shows "Cannot connect" on the very first health-check
    # because the React frontend fires immediately on mount while gaia's Python
    # server is still starting (port 4200 not yet open). Apply the same 3-
    # consecutive-failure threshold already used for the lemonade check so
    # startup noise is suppressed without hiding genuine outages.
    local _app="$srcdir/gaia-$pkgver/src/gaia/apps/webui/src/App.tsx"
    sed -i \
        '/const LEMONADE_FAIL_THRESHOLD = 3;/a\    const backendFailCountRef = useRef(0);\n    const BACKEND_FAIL_THRESHOLD = 3; // require 3 consecutive failures before showing banner' \
        "$_app"
    sed -i \
        's/const status = await api\.getSystemStatus();/const status = await api.getSystemStatus();\n            backendFailCountRef.current = 0;/' \
        "$_app"
    python3 -c '
import sys
path = sys.argv[1]
with open(path) as f: s = f.read()
s = s.replace(
    "            setBackendConnected(false);\n            setSystemStatus(null);",
    "            backendFailCountRef.current += 1;\n            if (backendFailCountRef.current >= BACKEND_FAIL_THRESHOLD) {\n                setBackendConnected(false);\n                setSystemStatus(null);\n            }"
)
with open(path, "w") as f: f.write(s)
' "$_app"
}

build() {
    cmake --build "$srcdir/build" -j$(nproc)

    # Build browser frontend first so package_data picks up dist/
    cd "$srcdir/gaia-$pkgver/src/gaia/apps/webui"
    npm install --quiet
    npm run build

    cd "$srcdir/gaia-$pkgver"
    python -m build --wheel --no-isolation

    local _electronver
    _electronver=$(cat /usr/lib/electron40/version)
    cd "$srcdir/gaia-$pkgver/src/gaia/apps/webui"
    ELECTRON_BUILDER_OFFLINE=true \
    ./node_modules/.bin/electron-builder --linux dir --x64 \
        --publish never \
        -c.electronDist=/usr/lib/electron40 \
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

package_gaia-amd-webui() {
    pkgdesc="Electron desktop UI for the AMD Gaia inference engine"
    depends=(gaia-amd electron40 libappindicator)
    optdepends=('ngrok: mobile access / remote tunnel feature')

    local _resources="$srcdir/gaia-$pkgver/src/gaia/apps/webui/dist-app/linux-unpacked/resources"

    install -dm755 "$pkgdir/usr/lib/gaia-amd-webui"
    cp -r --no-preserve=mode "$_resources/." "$pkgdir/usr/lib/gaia-amd-webui/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/gaia-amd-webui" <<'EOF'
#!/bin/sh
export GAIA_RESOURCES_PATH=/usr/lib/gaia-amd-webui
exec /usr/bin/electron40 --no-sandbox /usr/lib/gaia-amd-webui/app.asar "$@"
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
