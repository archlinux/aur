# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin-patched
pkgver=0.47.1
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment, patched for double window header issue and custom flag support"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
conflicts=('cursor-bin')
options=(!strip)
source_x86_64=("https://downloads.cursor.com/production/client/linux/x64/appimage/Cursor-0.47.1-aafb3fe1326c939656bd06f325a9e17679aeec7f.deb.glibc2.25-x86_64.AppImage")
noextract=("$(basename ${source_x86_64[0]})")
sha512sums_x86_64=('c705394491eb874951143a2353dded5936aab5626ef544ab6e7af7c0ec0693fcb1cbad3c6894dbc162b7494310db8fe34190f6e97ae24e40fd218160b388be9a')
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
    NOTE: Custom flags should be put directly in: ~/.config/cursor-flags.conf
}
