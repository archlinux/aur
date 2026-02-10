pkgname=cloudtolocalllm-appimage
pkgver=10.1.201
pkgrel=1
pkgdesc="Privacy-first local AI workspace (AppImage version)"
arch=('x86_64')
url="https://github.com/chokesmaster/CloudToLocalLLM"
license=('MIT')
depends=('fuse2' 'libayatana-appindicator' 'gtk3' 'libsecret')
optdepends=('fuse3: FUSE3 support for AppImage')
provides=('cloudtolocalllm')
conflicts=('cloudtolocalllm-git' 'cloudtolocalllm-bin')
options=(!strip)
_appimage="cloudtolocalllm-${pkgver}-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}")
sha256sums=('117c04fe62cfa531feeb95a62d24c09f9c0ea68dab68b1045abb378ca3daaf59')

package() {
    # Install AppImage to a proper location
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/cloudtolocalllm/cloudtolocalllm.AppImage"
    
    # Create wrapper script that handles FUSE-less systems
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/cloudtolocalllm" << 'EOF'
#!/bin/bash
# CloudToLocalLLM AppImage wrapper
# Handles both FUSE and FUSE-less execution

APPIMAGE_PATH="/opt/cloudtolocalllm/cloudtolocalllm.AppImage"

# Check if we can use FUSE
if [ -f /dev/fuse ] && [ -r /dev/fuse ]; then
    # Try normal AppImage execution with FUSE
    exec "${APPIMAGE_PATH}" "$@"
else
    # Fallback: extract and run without FUSE
    export APPIMAGE_EXTRACT_AND_RUN=1
    exec "${APPIMAGE_PATH}" "$@"
fi
EOF
    
    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cloudtolocalllm.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CloudToLocalLLM
GenericName=AI Model Bridge
Comment=Privacy-first local AI workspace
Icon=cloudtolocalllm
Exec=cloudtolocalllm %u
Terminal=false
Categories=Development;Utility;
Keywords=AI;LLM;OpenClaw;Machine Learning;
MimeType=x-scheme-handler/cloudtolocalllm;
EOF
}
