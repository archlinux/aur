# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin-patched
pkgver=0.46.11
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment, patched for double window header issue"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
conflicts=('cursor-bin')
options=(!strip)
source_x86_64=("https://anysphere-binaries.s3.us-east-1.amazonaws.com/production/client/linux/x64/appimage/Cursor-0.46.11-ae378be9dc2f5f1a6a1a220c6e25f9f03c8d4e19.deb.glibc2.25-x86_64.AppImage")
noextract=("$(basename ${source_x86_64[0]})")
sha512sums_x86_64=('b0b282572e1455b548daca790be94e899ece7726bccbd0a685906d97500e75758b5cae2f93de3d5ee1371e2417193ad26944e7b8b962fa02c5c95af32a19c411')
package() {
    mkdir -p "${pkgdir}/opt/"
    mv "${srcdir}/$(basename ${source_x86_64[0]})" "${pkgdir}/opt/tmp.AppImage"
    # Extract the AppImage
    cd "${pkgdir}/opt"
    chmod +x tmp.AppImage
    ./tmp.AppImage --appimage-extract
    rm ./tmp.AppImage

    # Fix it by replacing all occurrences of ",minHeight" with ",frame:false,minHeight"
    find squashfs-root/ -type f -name 'main.js' \
        -exec grep -l ,minHeight {} \; \
        -exec sed -i 's/,minHeight/,frame:false,minHeight/g' {} \;

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
MimeType=x-scheme-handler/cursor;
Categories=Utility;TextEditor;Development;IDE
EOF
}

post_install() {
    update-desktop-database -q
    xdg-icon-resource forceupdate
}
