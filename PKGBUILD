# Maintainer: Simon Schubert <sschubert89@gmail.com>
# https://github.com/SimonSchubert/Braincup

pkgname=braincup-bin
pkgver=3.8.0
pkgrel=1
pkgdesc='Train your math skills, memory and focus'
arch=('x86_64' 'aarch64')
url='https://github.com/SimonSchubert/Braincup'
license=('Apache-2.0')
depends=('hicolor-icon-theme')
provides=('braincup')
conflicts=('braincup')
options=('!strip')

# One release tarball per architecture. Each is a jpackage app-image carrying
# its own JRE, so neither depends on a system java -- the aarch64 one was run on
# an Arch aarch64 host with no java installed at all before this arch was added.
source_x86_64=("Braincup-${pkgver}-linux-x86_64.tar.gz::https://github.com/SimonSchubert/Braincup/releases/download/v${pkgver}/Braincup-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("Braincup-${pkgver}-linux-aarch64.tar.gz::https://github.com/SimonSchubert/Braincup/releases/download/v${pkgver}/Braincup-${pkgver}-linux-aarch64.tar.gz")

sha256sums_x86_64=('a98e3312c9adda49f0a51a18ded84301b06187d4323b0316fcec41b6d69d3faa')
# v3.6.0 predates the aarch64 tarball, so there is nothing to hash yet. The
# release job fills both sums in; zeros fail the integrity check rather than
# ship an unverified download if it ever does not.
sha256sums_aarch64=('8a563af22aa335cda1effdadd1c32d73bd64b200c83d21907db4e621dae1a78e')

package() {
    # Install application files
    install -dm755 "${pkgdir}/opt/braincup"
    cp -r "${srcdir}/Braincup/"* "${pkgdir}/opt/braincup/"
    chmod -R go-w "${pkgdir}/opt/braincup"

    # Install wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/braincup" << 'EOF'
#!/bin/sh
exec /opt/braincup/bin/Braincup "$@"
EOF

    # Install desktop entry. StartupWMClass has to be the window class AWT
    # actually sets, which it derives from the main class -- so it tracks
    # mainClass in composeApp/build.gradle.kts, dots turned into dashes.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/braincup.desktop" << EOF
[Desktop Entry]
Name=Braincup
Comment=Train your math skills, memory and focus
Exec=braincup
Icon=braincup
Type=Application
Categories=Game;Education;
Keywords=Math;Memory;Focus;Brain;Training;Game;
StartupWMClass=com-inspiredandroid-braincup-MainKt
Terminal=false
EOF

    # Install icon (real app icon shipped inside the jpackage app-image)
    install -Dm644 "${srcdir}/Braincup/lib/Braincup.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/braincup.png" 2>/dev/null || \
    install -Dm644 /dev/null "${pkgdir}/usr/share/icons/hicolor/512x512/apps/braincup.png"

    # Install license
    install -Dm644 "${srcdir}/Braincup/lib/Braincup.copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null ||
    install -Dm644 "${srcdir}/Braincup/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}

# Publishing steps:
# 1. Create AUR account at https://aur.archlinux.org
# 2. git clone ssh://aur@aur.archlinux.org/braincup-bin.git
# 3. Copy PKGBUILD and .SRCINFO into the cloned repo
# 4. git add PKGBUILD .SRCINFO
# 5. git commit -m "Initial upload: braincup-bin 2.5.0"
# 6. git push
