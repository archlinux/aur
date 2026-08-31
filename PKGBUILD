# Maintainer: SpeedyNote Team <info@speedynote.org>

pkgname=speedynote
pkgver=1.6.0
_tagver=1.6.0
pkgrel=1
_ortver=1.20.1     # Vendored ONNX Runtime (PaddleOCR backend)
pkgdesc="Fast note-taking app with PDF annotation, export, and multi-platform sync"
arch=('x86_64' 'aarch64')
url="https://github.com/alpha-liu-01/SpeedyNote"
license=('GPL-3.0-or-later')

# Runtime dependencies
depends=(
    'qt6-base'
    'qt6-svg'
    'mupdf'            # PDF rendering and export
    'harfbuzz'
    'freetype2'
    'libjpeg-turbo'
    'openjpeg2'
    'jbig2dec'
    'gumbo-parser'
    'mujs'
    'brotli'
    'zlib'
)


# Build dependencies
makedepends=(
    'cmake'
    'pkgconf'
    'qt6-tools'        # For lrelease (translations)
    'patchelf'         # Strip build-tree RPATH from the OCR-enabled binary
)

# Package conflicts
provides=('speedynote')
conflicts=('speedynote-bin' 'speedynote-git' 'speedynote-src')

# Source from GitHub release
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('8ad4859622b69dba33968c6e6135f50804882be680bf4d146184297189fce0ed')

# ONNX Runtime (PaddleOCR backend) + PP-OCRv5 recognition models.
# Vendored, checksummed; laid out under linux/ in prepare() so CMake's
# auto-enable fires (see CMakeLists.txt). ONNX Runtime is arch-specific; the
# three models are arch-independent, so they are listed in each arch array
# (makepkg only fetches the array matching the build host, so no double
# download). Kept out of the main source=/sha256sums= so update-aur-local.sh's
# single-entry sha256sums patching keeps working.
_ortbase="https://github.com/microsoft/onnxruntime/releases/download/v${_ortver}"
# ModelScope is the PRIMARY model host. HuggingFace's resolve/ CDN returns HTTP
# 429 (rate limit) for shared/cloud build IPs, so it is only a manual fallback:
#   https://huggingface.co/RapidAI/RapidOCR/resolve/v3.8.0/onnx/PP-OCRv5/rec
# makepkg's source=() has no per-file mirror fallback (unlike the Flatpak
# manifest's mirror-urls), so the reliable host must be the primary one. This
# matches the primary/fallback order in linux/fetch-ocr-models.sh.
_mdlbase="https://www.modelscope.cn/models/RapidAI/RapidOCR/resolve/v3.8.0/onnx/PP-OCRv5/rec"

source_x86_64=(
    "onnxruntime-linux-x64-${_ortver}.tgz::${_ortbase}/onnxruntime-linux-x64-${_ortver}.tgz"
    "latin_rec.onnx::${_mdlbase}/latin_PP-OCRv5_rec_mobile.onnx"
    "ch_rec.onnx::${_mdlbase}/ch_PP-OCRv5_rec_mobile.onnx"
    "korean_rec.onnx::${_mdlbase}/korean_PP-OCRv5_rec_mobile.onnx"
)
sha256sums_x86_64=(
    '67db4dc1561f1e3fd42e619575c82c601ef89849afc7ea85a003abbac1a1a105'
    'b20bd37c168a570f583afbc8cd7925603890efbcdc000a59e22c269d160b5f5a'
    '5825fc7ebf84ae7a412be049820b4d86d77620f204a041697b0494669b1742c5'
    'cd6e2ea50f6943ca7271eb8c56a877a5a90720b7047fe9c41a2e541a25773c9b'
)

source_aarch64=(
    "onnxruntime-linux-aarch64-${_ortver}.tgz::${_ortbase}/onnxruntime-linux-aarch64-${_ortver}.tgz"
    "latin_rec.onnx::${_mdlbase}/latin_PP-OCRv5_rec_mobile.onnx"
    "ch_rec.onnx::${_mdlbase}/ch_PP-OCRv5_rec_mobile.onnx"
    "korean_rec.onnx::${_mdlbase}/korean_PP-OCRv5_rec_mobile.onnx"
)
sha256sums_aarch64=(
    'ae4fedbdc8c18d688c01306b4b50c63de3445cdf2dbd720e01a2fa3810b8106a'
    'b20bd37c168a570f583afbc8cd7925603890efbcdc000a59e22c269d160b5f5a'
    '5825fc7ebf84ae7a412be049820b4d86d77620f204a041697b0494669b1742c5'
    'cd6e2ea50f6943ca7271eb8c56a877a5a90720b7047fe9c41a2e541a25773c9b'
)

prepare() {
    # Lay the vendored OCR deps where CMake's auto-enable expects them. makepkg
    # extracts the ONNX Runtime .tgz into $srcdir/onnxruntime-linux-<arch>-<ver>/
    # and saves the models verbatim by their ::name.
    local _ortarch
    case "$CARCH" in
        x86_64)  _ortarch=x64 ;;
        aarch64) _ortarch=aarch64 ;;
    esac
    cd "SpeedyNote-${_tagver}"
    mkdir -p linux/onnxruntime-build linux/ocr-models
    cp -R "$srcdir/onnxruntime-linux-${_ortarch}-${_ortver}/include" linux/onnxruntime-build/
    cp -R "$srcdir/onnxruntime-linux-${_ortarch}-${_ortver}/lib"     linux/onnxruntime-build/
    cp "$srcdir"/{latin_rec,ch_rec,korean_rec}.onnx linux/ocr-models/
}

build() {
    cd "SpeedyNote-${_tagver}"
    
    # Create build directory
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    
    # Build with parallel jobs (use half cores to avoid OOM on low-RAM systems)
    local jobs=$(( ($(nproc) + 1) / 2 ))
    cmake --build build --parallel "$jobs"
}

package() {
    cd "SpeedyNote-${_tagver}"
    
    # Install binary
    install -Dm755 "build/speedynote" "$pkgdir/usr/bin/speedynote"
    
    # Install desktop file (committed in repo)
    install -Dm644 "data/org.speedynote.SpeedyNote.desktop" "$pkgdir/usr/share/applications/org.speedynote.SpeedyNote.desktop"
    
    # Install SVG icon (scalable + pixmaps fallback, name matches Icon= in .desktop file)
    install -Dm644 "resources/icons/mainicon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.speedynote.SpeedyNote.svg"
    install -Dm644 "resources/icons/mainicon.svg" "$pkgdir/usr/share/pixmaps/org.speedynote.SpeedyNote.svg"
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install translation files (if compiled)
    if ls build/*.qm 1>/dev/null 2>&1; then
        install -dm755 "$pkgdir/usr/share/speedynote/translations"
        install -Dm644 build/*.qm "$pkgdir/usr/share/speedynote/translations/"
    fi
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Bundle the PaddleOCR runtime + models. The .so is resolved at runtime via
    # the binary's $ORIGIN/../lib RPATH; models are read from
    # /usr/share/speedynote/ocr-models. `cp -a` preserves the
    # libonnxruntime.so -> .so.<ver> symlink.
    install -dm755 "$pkgdir/usr/lib"
    cp -a linux/onnxruntime-build/lib/libonnxruntime.so* "$pkgdir/usr/lib/"
    install -dm755 "$pkgdir/usr/share/speedynote/ocr-models"
    cp linux/ocr-models/*.onnx "$pkgdir/usr/share/speedynote/ocr-models/"

    # Strip the build-tree absolute ONNX Runtime path baked into RUNPATH,
    # leaving the relocatable $ORIGIN/../lib (= /usr/lib at runtime).
    patchelf --set-rpath '$ORIGIN/../lib' "$pkgdir/usr/bin/speedynote"
}
