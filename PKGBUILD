# Maintainer: Samuel Paredes <sam.paredes.g@gmail.com>
pkgname=franki-os-git
pkgver=r1045.694d730
pkgrel=1
pkgdesc="Federated Recursive Artificial Neural Knowledge Interface - Neural OS"
arch=('x86_64')
url="https://gitlab.com/Umbra_HS/franki_os"
license=('custom:BUSL-1.1')
install=franki.install
depends=(
    'python'          # runtime Python 3.11+
    'uv'              # crea y gestiona venv_311 en post-install
    'sqlite'          # db_core (~/.config/franki/franki_core.db)
    'ollama'          # motor de inferencia local (orquestador + modelos SLM)
    'nodejs>=20'      # Tauri runtime (frontend nativo)
    'curl'            # descargas de modelos, APIs externas
    'libsecret'       # vault de secretos del sistema
    'portaudio'       # captura de audio en tiempo real (Oido)
    'poppler'         # extraccion de texto PDF (digest_file core)
    'perl-image-exiftool'  # extraccion GPS/EXIF de imagenes (reflejo geodesico)
    'ripgrep'         # busqueda turbo soberana (f-cerebelo + tool_busqueda_turbo_rust)
    'file'            # deteccion MIME nativa (sentidos/vision pipeline)
    'webkit2gtk-4.1'  # Tauri v2 WebView runtime (binario franki-os linka dinamicamente)
    'gtk3'            # Tauri v2 window system runtime
)
# npm solo se necesita en build() para npm ci — no es una dep de runtime
makedepends=('rust' 'cargo' 'git' 'python-pip' 'npm' 'pkgconf' 'libsoup3')
optdepends=(
    'pandoc: document generation via Scribe engine'
    'typst: native PDF generation via Scribe engine'
    'r: statistical engine (Surco Intraparietal / IPS)'
    'ffmpeg: multimedia processing (Cinema Engine)'
    'yt-dlp: video download from web for Cinema Engine (YouTube, Meta, etc.)'
    'gst-libav: MKV/H.264/AAC codec support for Lienzo video viewer (WebKit2GTK)'
    'tesseract: OCR fallback for vision pipeline'
    'rocm-opencl-runtime: AMD GPU acceleration'
    'cuda: NVIDIA GPU acceleration'
    'obsidian: Knowledge graph and Engramas integration'
    'libreoffice: document format conversion'
    'fenics: physics simulation (optional IPS module)'
    'openscad: 3D model generation (Scribe STL output)'
    'graphviz: diagram generation (Scribe SVG output)'
    'python-tweepy: Twitter/X posting (EXOCRINE_ENGINE)'
    'python-aiogram: Telegram bot (CORTI_ENGINE)'
    'chromium: JS-rendered SPA scraping via f-cerebelo render Motor A (alternativas: google-chrome, brave-browser)'
    'geckodriver: Motor B de f-cerebelo render para usuarios Firefox-only (requiere firefox instalado)'

    'python-evdev: Linux/Wayland raw input device access (hands_engine — wayland_mouse_nerve)'
    'python-torch: layer-wise inference for large models (Red Glial — AirLLM, optional)'
    'python-atspi: AT-SPI accessibility tree for native GUI interaction (hands_engine — Wayland click/fill)'
    'firejail: sandboxing for external process execution (envoltura_lisosomica)'
    'sentrux: architectural quality sensor (Huso Neuromuscular + Area de Broca)'
    'gdal: raster/vector geoprocessing (tool_geo_raster_procesar, tool_geo_vector_convertir, tool_geo_raster_derivados)'
    'python-gdal: Python bindings for GDAL/OGR (osgeo module)'
    'pdal: LiDAR point cloud processing (tool_geo_lidar_info, tool_geo_lidar_dem)'
    'python-pdal: Python bindings for PDAL'
    'grass: real hydrology analysis via r.watershed (tool_geo_hidrologia)'
    'theharvester-git: subdomain/email recon for OSINT plexo (TransductorHarvester, osint/red.py)'
    'maigret: username recon across sites for OSINT plexo (TransductorMaigret, osint/corporativo.py)'
    'phoneinfoga-bin: phone number OSINT scan backup (LaboratorioOSINT.investigar_telefono)'
    'prusa-slicer: real G-code slicing for FAB domain (tool_fab_slice)'
)
options=('!debug' '!strip' '!buildflags')
source=('franki::git+https://gitlab.com/Umbra_HS/franki_os.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/franki"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # Aislar builds Rust de los LDFLAGS/CFLAGS de makepkg (rompen rusqlite --bundled)
    unset LDFLAGS CFLAGS CXXFLAGS CPPFLAGS
    export CARGO_INCREMENTAL=0

    # 1. f-cerebelo (Rust micro-kernel: sentinel, indexer, actuator)
    echo "[FRANKI] Compilando f-cerebelo..."
    cd "$srcdir/franki/backend/f-cerebelo"
    cargo build --release --locked

    # 2. f-vagus (Rust file-system watcher + relay notifier)
    echo "[FRANKI] Compilando f-vagus..."
    cd "$srcdir/franki/backend/f-vagus"
    cargo build --release --locked

    # 3. Frontend Lienzo + Corteza Tauri (app nativa)
    echo "[FRANKI] Construyendo Frontend + Tauri..."
    cd "$srcdir/franki/frontend"
    npm ci
    npm run tauri build -- --no-bundle
}

package() {
    local _lib="$pkgdir/usr/lib/franki"

    # Directorios
    install -dm755 "$_lib/backend"/{bin,tools,sentidos,data,fasciculos,fibras_musculares,prompt_library,templates,osint}
    install -dm755 "$pkgdir/usr/share/franki/frontend"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

    # 0. PKGBUILD instalado en /usr/share/franki/ para que el scanner soberano
    #    (platform_compat.scan_missing_system_deps) lo encuentre en runtime.
    install -Dm644 "$srcdir/franki/PKGBUILD" "$pkgdir/usr/share/franki/PKGBUILD"

    # 1. Nucleo Python (fuentes — venv se crea post-install via franki.install)
    cd "$srcdir/franki/backend"
    cp *.py "$_lib/backend/"
    cp requirements-core.txt "$_lib/backend/"
    cp requirements-extras.txt "$_lib/backend/"
    cp -r tools/. "$_lib/backend/tools/"
    cp -r sentidos/. "$_lib/backend/sentidos/"
    cp -r fasciculos/. "$_lib/backend/fasciculos/"
    cp -r fibras_musculares/. "$_lib/backend/fibras_musculares/"
    cp -r prompt_library/.   "$_lib/backend/prompt_library/"
    cp -r templates/.        "$_lib/backend/templates/"
    cp -r osint/.            "$_lib/backend/osint/"
    # Excluir modelos de voz binarios (descargados por franki.install post-install hook)
    rm -f "$_lib/backend/sentidos/voces/"*.onnx "$_lib/backend/sentidos/voces/"*.onnx.json
    # data/: copiar excluyendo knowledge_graph.json (gitignored, generado en runtime)
    install -dm755 "$_lib/backend/data"
    find data/ -maxdepth 1 -type f ! -name "knowledge_graph.json" | while IFS= read -r f; do
        install -Dm644 "$f" "$_lib/backend/$f"
    done
    cp -r data/manuales "$_lib/backend/data/manuales" 2>/dev/null || true

    # 2. Scripts de arranque y herramientas de sistema
    install -Dm755 bin/run_nexus.sh    "$_lib/backend/bin/run_nexus.sh"
    install -Dm755 bin/corti_nerve.sh  "$_lib/backend/bin/corti_nerve.sh"
    # franki-log: logs unificados de todos los servicios FRANKI (nexus + cerebelo)
    install -Dm755 bin/franki-log "$pkgdir/usr/bin/franki-log"
    # franki-cli: puente CLI/voz/notificacion agnostico al Nucleo (/api/ui/input)
    install -Dm755 bin/franki-cli "$pkgdir/usr/bin/franki-cli"

    # 4. Binarios Rust (f-cerebelo, f-vagus)
    install -Dm755 f-cerebelo/target/release/f-cerebelo "$pkgdir/usr/bin/f-cerebelo"
    install -Dm755 f-vagus/target/release/f-vagus       "$pkgdir/usr/bin/f-vagus"

    # 5. Corteza Tauri (binario nativo — reemplaza el launcher de browser)
    install -Dm755 \
        "$srcdir/franki/frontend/src-tauri/target/release/franki-os" \
        "$pkgdir/usr/bin/franki"

    # 6. Icono + .desktop
    install -Dm644 "$srcdir/franki/frontend/src-tauri/icons/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/franki.png"
    install -Dm644 "$srcdir/franki/frontend/src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/franki.png"
    install -Dm644 "$srcdir/franki/frontend/src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/franki.png"
    install -Dm644 "$srcdir/franki/frontend/public/franki_face.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/franki.svg"
    install -Dm644 "$srcdir/franki/frontend/public/franki_face.svg" \
        "$pkgdir/usr/share/pixmaps/franki.svg"
    install -Dm644 "$srcdir/franki/packaging/arch/franki.desktop" \
        "$pkgdir/usr/share/applications/franki.desktop"

    # Nota: el backend Python (franki_service.py) sigue siendo arrancado por systemd.
    # El binario Tauri es SOLO el frontend/GUI nativo. Ambos se inician via:
    #   systemctl --user start franki_os.service  # backend
    #   franki                                     # GUI (abre ventana nativa)

    # 8. Servicios systemd + socket units (lazy activation + idle timeout)
    # franki_os.service: nombre canonico referenciado por herramientas (zvec_auditor, reindexar_hipocampo)
    install -Dm644 "$srcdir/franki/packaging/systemd/franki-nexus@.service" \
        "$pkgdir/usr/lib/systemd/user/franki_os.service"
    # franki_os.socket: escucha :54322 y despierta franki_os.service bajo demanda
    install -Dm644 "$srcdir/franki/packaging/systemd/franki-nexus.socket" \
        "$pkgdir/usr/lib/systemd/user/franki_os.socket"
    # franki_cerebelo.service: micro-kernel Rust (sentinel :54321, indexer, actuator)
    install -Dm644 "$srcdir/franki/packaging/systemd/franki-cerebelo.service" \
        "$pkgdir/usr/lib/systemd/user/franki_cerebelo.service"
    # franki_cerebelo.socket: escucha :54321 y despierta franki_cerebelo.service bajo demanda
    install -Dm644 "$srcdir/franki/packaging/systemd/franki-cerebelo.socket" \
        "$pkgdir/usr/lib/systemd/user/franki_cerebelo.socket"
    # franki_sinapsis_externa.service: WhatsApp+Telegram, always-on (sin socket activation)
    install -Dm644 "$srcdir/franki/packaging/systemd/franki-sinapsis-externa.service" \
        "$pkgdir/usr/lib/systemd/user/franki_sinapsis_externa.service"
    # franki.target: agrupacion pura (PartOf= en las 3 units de arriba) para
    # reinicio conjunto opt-in -- ver backend/bin/franki-restart-all
    install -Dm644 "$srcdir/franki/packaging/systemd/franki.target" \
        "$pkgdir/usr/lib/systemd/user/franki.target"
    # franki-restart-all: reinicia el grupo completo + relanza la GUI Tauri,
    # pensado para usarse tras reinstalar el paquete (ver comentario en el script)
    install -Dm755 "$srcdir/franki/backend/bin/franki-restart-all" \
        "$pkgdir/usr/bin/franki-restart-all"

    # 9. Regla udev para uinput (Manos — captura de teclado/raton en Wayland)
    echo 'KERNEL=="uinput", GROUP="uinput", MODE="0660", OPTIONS+="static_node=uinput"' \
        > "$pkgdir/usr/lib/udev/rules.d/99-franki-uinput.rules"

    # 10. Licencias
    install -Dm644 "$srcdir/franki/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
