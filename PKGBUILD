# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin-patched
pkgver=0.49.1
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment, patched for custom flag support"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
conflicts=('cursor-bin')
provides=('cursor-bin')
options=(!strip)
install='cursor.install'
source_x86_64=("https://downloads.cursor.com/production/600e5c827c07c5818474c1056eeec61d478b407a/linux/x64/Cursor-0.49.1-x86_64.AppImage")
noextract=("$(basename ${source_x86_64[0]})")
sha512sums_x86_64=('60ceef477749fa3124a5b8377865dbd93e786c83b869a97d8ca40825ed99a2e030b681214c448a37ddd91b779b002be747aae9a00aabb0137f4f59d5cf6466f7')
package() {
    mkdir -p "${pkgdir}/opt/"
    mv "${srcdir}/$(basename ${source_x86_64[0]})" "${pkgdir}/opt/tmp.AppImage"
    # Extract the AppImage
    cd "${pkgdir}/opt"
    chmod +x tmp.AppImage
    ./tmp.AppImage --appimage-extract
    rm ./tmp.AppImage

    mv squashfs-root cursor-bin

    find . -type d -exec chmod a+rx {} \;
    find . -type f -exec chmod a+r {} \;

    mkdir -p "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/cursor"
#!/bin/bash

XDG_CONFIG_HOME=\${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/cursor-flags.conf ]]; then
   CURSOR_USER_FLAGS="\$(sed 's/#.*//' \$XDG_CONFIG_HOME/cursor-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/cursor-bin/AppRun "\$@" \$CURSOR_USER_FLAGS
EOF

    chmod +x "${pkgdir}/usr/bin/cursor"

    # Install the icon
    install -Dm644 "cursor-bin/code.png" "${pkgdir}/usr/share/icons/cursor.png"

    # Create a .desktop Entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/anysphere-cursor.desktop"
[Desktop Entry]
Name=Cursor
Exec=/usr/bin/cursor --no-sandbox %U
Terminal=false
Type=Application
Icon=cursor
X-AppImage-Version=${pkgver}
StartupWMClass=Cursor
MimeType=x-scheme-handler/cursor;
Categories=Utility;TextEditor;Development;IDE
EOF
}
