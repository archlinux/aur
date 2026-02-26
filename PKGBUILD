# Maintainer: ushineko <https://github.com/ushineko>
pkgname=clockwork-orange-git
pkgver=2.8.5
pkgrel=1
pkgdesc="Advanced wallpaper manager and downloader with plugin support (Wallhaven, Google Images) for KDE Plasma 6"
arch=('any')
url="https://github.com/ushineko/clockwork-orange"
license=('MIT')
depends=('python' 'python-requests' 'python-yaml' 'python-pillow' 'python-watchdog' 'python-pyqt6' 'qt6-tools' 'kconfig' 'python-psutil')

makedepends=('git')
optdepends=(
    'python-pytorch: Required for Stable Diffusion AI wallpaper generation'
    'python-pytorch-cuda: CUDA acceleration for Stable Diffusion (NVIDIA GPUs)'
    'python-diffusers: Required for Stable Diffusion AI wallpaper generation'
    'python-transformers: Required for Stable Diffusion AI wallpaper generation'
    'python-accelerate: Optimized inference for Stable Diffusion'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("clockwork-orange::git+https://github.com/ushineko/clockwork-orange.git")
sha256sums=('SKIP')
install=clockwork-orange.install

pkgver() {
	cd "${pkgname%-git}"
    # Read tag content (e.g. v2.2.6)
    _tag=$(cat .tag 2>/dev/null || echo "v0.0.0")
    # Clean 'v' prefix for Arch compliance
    _clean_tag=${_tag#v}
    
    # Generate git info
	printf "%s.r%s.g%s" "$_clean_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"

	# Install main script and modules
	install -Dm755 clockwork-orange.py "${pkgdir}/usr/lib/${pkgname%-git}/clockwork-orange.py"
    install -Dm644 plugin_manager.py "${pkgdir}/usr/lib/${pkgname%-git}/plugin_manager.py"
    install -Dm644 platform_utils.py "${pkgdir}/usr/lib/${pkgname%-git}/platform_utils.py"
    install -Dm644 clockwork-orange.service "${pkgdir}/usr/lib/${pkgname%-git}/clockwork-orange.service"
    install -Dm644 .tag "${pkgdir}/usr/lib/${pkgname%-git}/.tag"
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/clockwork-orange --service|' "${pkgdir}/usr/lib/${pkgname%-git}/clockwork-orange.service"
    
    # Install GUI files
    install -d "${pkgdir}/usr/lib/${pkgname%-git}/gui"
    cp -r gui/* "${pkgdir}/usr/lib/${pkgname%-git}/gui/"

    # Install Plugins
    install -d "${pkgdir}/usr/lib/${pkgname%-git}/plugins"
    cp -r plugins/* "${pkgdir}/usr/lib/${pkgname%-git}/plugins/"

    # Create /usr/bin directory
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname%-git}/clockwork-orange.py" "${pkgdir}/usr/bin/clockwork-orange"

    # Install Scripts (setup helpers)
    install -d "${pkgdir}/usr/lib/${pkgname%-git}/scripts"
    install -Dm755 scripts/setup_stable_diffusion.sh "${pkgdir}/usr/lib/${pkgname%-git}/scripts/setup_stable_diffusion.sh"
    # Create convenience symlink in /usr/bin
    ln -s "/usr/lib/${pkgname%-git}/scripts/setup_stable_diffusion.sh" "${pkgdir}/usr/bin/clockwork-orange-setup-sd"

	# Install desktop entry
    # We need to fix the Icon and Exec path in the desktop file or install a new one
    # The provided install-desktop-entry.sh generates one, but we should ship a static one or fix it.
    # Let's create a proper one for the package.
    
    install -Dm644 clockwork-orange.desktop "${pkgdir}/usr/share/applications/clockwork-orange.desktop"
    # Update Exec and Icon lines for system installation
    sed -i 's|Exec=.*|Exec=/usr/bin/clockwork-orange --gui|' "${pkgdir}/usr/share/applications/clockwork-orange.desktop"
    sed -i 's|Icon=.*|Icon=clockwork-orange|' "${pkgdir}/usr/share/applications/clockwork-orange.desktop"
    sed -i '/Path=/d' "${pkgdir}/usr/share/applications/clockwork-orange.desktop"

	# Install icons
    for res in 16 32 48 64 128 256 512; do
        if [ -f "gui/icons/clockwork-orange-${res}x${res}.png" ]; then
            install -Dm644 "gui/icons/clockwork-orange-${res}x${res}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/clockwork-orange.png"
        fi
    done
    # Install main icon as fallback/scalable or just high-res
    install -Dm644 "gui/icons/clockwork-orange.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/clockwork-orange.png"

	# Install license and documentation
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install Systemd Service
    install -Dm644 clockwork-orange.service "${pkgdir}/usr/lib/systemd/user/clockwork-orange.service"
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/clockwork-orange --service|' "${pkgdir}/usr/lib/systemd/user/clockwork-orange.service"

    # Generate version.txt
    echo "$pkgver" > "${pkgdir}/usr/lib/${pkgname%-git}/version.txt"
}
