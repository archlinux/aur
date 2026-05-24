# Maintainer: Mark Austin <ganthore@gmail.com>

pkgname=(gaia-amd gaia-amd-webui)
pkgver=0.19.0
pkgrel=2
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

sha256sums=(ecac14989bb17ba6f07fe8dc274df8458195b7ef16504b3301bcbf707066ae3c
            04f4f7fa7584d8a5deb6e1f9b8e1f2d8c2267cdb95cdd9d208ead9825ae2ac44
            a5aa7651b2b13e5161e98fb231cb4a12cc451ee09bce0d5822824913573daa97
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
    ./node_modules/.bin/electron-builder --linux dir --x64 \
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
