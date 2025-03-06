# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin-patched
pkgver=0.46.9
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment, patched for double window header issue"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
conflicts=('cursor-bin')
options=(!strip)
source_x86_64=("https://anysphere-binaries.s3.us-east-1.amazonaws.com/production/client/linux/x64/appimage/Cursor-0.46.9-3395357a4ee2975d5d03595e7607ee84e3db0f2c.deb.glibc2.25-x86_64.AppImage")
noextract=("$(basename ${source_x86_64[0]})")
sha512sums_x86_64=('a11420f98ff74c7d4c6f5afca1b0df64ead48ec21d34b72ae905488ffb3728eee252b02f0e09490fa4ec05f5f88464a2a90458fd5ab5a127860463ea995b7a94')
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
    install -Dm644 "cursor-bin/co.anysphere.cursor.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cursor.png"

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
