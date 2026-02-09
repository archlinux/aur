# Maintainer: Christopher Maltais <christopher.maltais@gmail.com>
pkgname=cloudtolocalllm
pkgver=10.1.187
pkgrel=1
pkgdesc="Manage and run powerful Large Language Models locally, orchestrated via a cloud interface"
arch=('x86_64')
url="https://github.com/CloudToLocalLLM-online/CloudToLocalLLM"
license=('MIT')
depends=(
    'libayatana-appindicator'
    'gtk3'
    'glib2'
    'libsecret'
    'curl'
    'wmctrl'
    'xdg-utils'
)
provides=('cloudtolocalllm')
conflicts=('cloudtolocalllm-git' 'cloudtolocalllm-bin')
source=("https://github.com/CloudToLocalLLM-online/CloudToLocalLLM/releases/download/v${pkgver}/CloudToLocalLLM-Linux-x64.tar.gz")
sha256sums=('5c2379fab3517158de094a25781280dc2c92eeec5b8fb0f859b9f55c8e1b9bf9')

package() {
    # Install the application files
    install -dm755 "${pkgdir}/opt/cloudtolocalllm"
    cp -r "${srcdir}/cloudtolocalllm/"* "${pkgdir}/opt/cloudtolocalllm/"

    # Create /usr/bin wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/cloudtolocalllm" << EOF
#!/bin/bash
cd /opt/cloudtolocalllm
exec ./cloudtolocalllm "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/cloudtolocalllm"

    # Install desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/cloudtolocalllm.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=CloudToLocalLLM
GenericName=AI Model Bridge
Comment=Manage and run powerful Large Language Models locally
Icon=cloudtolocalllm
Exec=cloudtolocalllm %u
Terminal=false
Categories=Development;Utility;Network;
Keywords=AI;LLM;Ollama;OpenAI;Machine Learning;
StartupNotify=true
StartupWMClass=CloudToLocalLLM
MimeType=x-scheme-handler/cloudtolocalllm;
EOF

    # Install icon
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    if [ -f "${srcdir}/data/flutter_assets/assets/images/icon.png" ]; then
        install -m644 "${srcdir}/data/flutter_assets/assets/images/icon.png" "${pkgdir}/usr/share/pixmaps/cloudtolocalllm.png"
    fi
}
