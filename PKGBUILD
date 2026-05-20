# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>

pkgname=antigravity-ide
pkgver=2.0.1
_execution_id=4861014005645312
pkgrel=1
pkgdesc='An agentic development platform from Google, evolving the IDE into the agent-first era.'
arch=('x86_64')
url='https://antigravity.google/'
license=('LicenseRef-Google-Antigravity')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss' 'libsecret' 'libxkbfile')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_execution_id}/linux-x64/Antigravity%20IDE.tar.gz")
sha256sums=('747163aa3a8afba4b316f97c40b4a75ca4736a59768a416cd1e881e73ec31ef9')

package() {
    # 1. Copy application files to /opt/antigravity-ide
    install -d "${pkgdir}/opt/antigravity-ide"
    cp -r "${srcdir}/Antigravity IDE/"* "${pkgdir}/opt/antigravity-ide/"

    # 2. Install wrapper script
    install -d "${pkgdir}/usr/bin"
    cat << 'EOF' > "${pkgdir}/usr/bin/antigravity-ide"
#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/antigravity-ide-flags.conf ]]; then
    ANTIGRAVITY_IDE_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/antigravity-ide-flags.conf | tr '\n' ' ')"
fi

# Launch
/opt/antigravity-ide/antigravity-ide "$@" $ANTIGRAVITY_IDE_USER_FLAGS &>/dev/null &
EOF
    chmod +x "${pkgdir}/usr/bin/antigravity-ide"

    # 3. Install desktop entry and URL handler
    install -d "${pkgdir}/usr/share/applications"
    cat << 'EOF' > "${pkgdir}/usr/share/applications/antigravity-ide.desktop"
[Desktop Entry]
Name=Antigravity IDE
Comment=Experience liftoff
Exec=/usr/bin/antigravity-ide %F
Icon=antigravity-ide
Type=Application
StartupNotify=false
StartupWMClass=antigravity-ide
Categories=TextEditor;Development;IDE;
EOF

    cat << 'EOF' > "${pkgdir}/usr/share/applications/antigravity-url-handler.desktop"
[Desktop Entry]
Name=Antigravity - URL Handler
Comment=Experience liftoff
Exec=/usr/bin/antigravity-ide --open-url %U
Icon=antigravity-ide
Type=Application
NoDisplay=true
StartupNotify=true
Categories=Utility;TextEditor;Development;IDE;
MimeType=x-scheme-handler/antigravity;
EOF

    # 4. Install icon
    install -Dm644 "${srcdir}/Antigravity IDE/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/antigravity-ide.png"
    ln -s antigravity-ide.png "${pkgdir}/usr/share/pixmaps/antigravity.png"

    # 5. Install licenses
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /opt/antigravity-ide/resources/app/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    ln -s /opt/antigravity-ide/LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
