# Maintainer: cantosun99 <privat at cantosun dot de>
pkgname=intel-ai-playground
pkgver=v3.1.2
pkgrel=5
pkgdesc="AI PC starter app for doing AI image creation, image stylizing, and chatbot on a PC powered by an Intel® Arc™ GPU."
arch=(x86_64)
url="https://github.com/intel/AI-Playground"
license=(MIT "custom:3rdpartynoticeslicenses.txt")
depends=(
    gtk3
    nss
    alsa-lib
    dbus
    pciutils
    python
)
makedepends=(
    nodejs
    npm
    binutils
)
optdepends=(
    "python-venv: OpenVINO backend support"
    "tbb: OpenVINO backend support"
    "hwloc: OpenVINO backend support"
    "libgomp: OpenVINO backend support"
    "numactl: OpenVINO backend support"
    "ocl-icd: OpenVINO OpenCL support"
    "fuse2: running the AppImage directly (not needed when installed via this package)"
)
source=("https://github.com/intel/AI-Playground/archive/refs/tags/${pkgver}-beta_hf3.tar.gz")
sha256sums=('64cb3ed0db9a355af340cc43f5e7863ebe8df7688bda8a491a0e535828491556')

prepare() {
    mv "AI-Playground-${pkgver#v}-beta_hf3" "${srcdir}/AI-Playground"
}

build() {
    cd "${srcdir}/AI-Playground/WebUI"

    npm install
    npm run fetch-external-resources
    npm run build:linux
}

package() {
    # Read the actual version from upstream package.json
    local upstream_ver
    upstream_ver=$(node -p "require('${srcdir}/AI-Playground/WebUI/package.json').version")
    local appimage="AI Playground-${upstream_ver}.AppImage"
    local appdir="${srcdir}/AI-Playground/build/electron/${appimage}"

    chmod +x "${appdir}"

    # Extract the AppImage
    local extract_dir
    extract_dir=$(mktemp -d)
    (cd "${extract_dir}" && "${appdir}" --appimage-extract)

    # Install to /usr/lib/ai-playground (Arch standard for bundled apps)
    local appdir_install="${pkgdir}/usr/lib/ai-playground"
    install -d -m755 "${appdir_install}"

    # Copy all files with correct permissions
    # Directories: 755 (rwxr-xr-x)
    # Regular files: 644 (rw-r--r--)
    # Executables: 755 (rwxr-xr-x)
    local src="${extract_dir}/squashfs-root"

    # Copy contents of squashfs-root (not the directory itself)
    # Using dot notation to include hidden files like .DirIcon
    cp -r "${src}/." "${appdir_install}/"

    # Fix all permissions explicitly
    find "${appdir_install}" -type d -exec chmod 755 {} +
    find "${appdir_install}" -type f -exec chmod 644 {} +

    # Mark executables
    chmod 755 "${appdir_install}/ai-playground"
    chmod 755 "${appdir_install}/ai-playground.bin"
    chmod 755 "${appdir_install}/AppRun"
    chmod 755 "${appdir_install}/chrome-sandbox"

    # Clean up
    rm -rf "${extract_dir}"

    # Desktop entry
    install -d -m755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/ai-playground.desktop" <<EOF
[Desktop Entry]
Name=AI Playground
Comment=AI inference desktop app for Intel GPUs
Exec=/usr/lib/ai-playground/ai-playground
Icon=ai-playground
Type=Application
Categories=Utility;
StartupWMClass=AI Playground
EOF

    # Icon (512x512)
    install -D -m644 "${appdir_install}/usr/share/icons/hicolor/512x512/apps/ai-playground.png" \
                     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ai-playground.png"

    # Symlink for terminal launch
    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/ai-playground/ai-playground "${pkgdir}/usr/bin/ai-playground"

    # License files
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/AI-Playground/LICENSE" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m644 "${srcdir}/AI-Playground/3rdpartynoticeslicenses.txt" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/"
}
