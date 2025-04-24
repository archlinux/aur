# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin-patched
pkgver=0.49.4
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment, patched for custom flag support"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
conflicts=('cursor-bin')
provides=('cursor-bin')
options=(!strip)
install='cursor.install'
source_x86_64=("https://downloads.cursor.com/production/ec408037b24566b11e6132c58bbe6ad27046eb91/linux/x64/Cursor-0.49.4-x86_64.AppImage")
noextract=("$(basename ${source_x86_64[0]})")
sha512sums_x86_64=('edfa25508cfbf3fa0686c4a339058b1640794e74b4f0c375b43c80142b7a40d3e6a4810bd374779d1d3f7b8eea7fc914df55ec55c488b154210f8e2a3fe51c39')
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

    chmod a+x "${pkgdir}/usr/bin/cursor"

    mkdir -p "${pkgdir}/usr/share/bash-completion"
    find "cursor-bin/usr/share/bash-completion/" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/bash-completion/" \;

    mkdir -p "${pkgdir}/usr/share/zsh"
    find "cursor-bin/usr/share/zsh/" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/zsh/" \;


    mkdir -p "${pkgdir}/usr/share/icons"
    find "cursor-bin/usr/share/icons/" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/icons/" \;

    mkdir -p "${pkgdir}/usr/share/mime"
    find "cursor-bin/usr/share/mime/" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/mime/" \;

    mkdir -p "${pkgdir}/usr/share/pixmaps"
    find "cursor-bin/usr/share/pixmaps/" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/pixmaps/" \;

    # Create a .desktop Entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/co.anysphere.cursor.desktop"
[Desktop Entry]
Name=Cursor
Comment=The AI Code Editor.
GenericName=Text Editor
Exec=/usr/bin/cursor %F
Icon=cursor
Type=Application
StartupNotify=false
StartupWMClass=Cursor
Categories=TextEditor;Development;IDE;
MimeType=application/x-cursor-workspace;
Actions=new-empty-window;
Keywords=cursor;

[Desktop Action new-empty-window]
Name=New Empty Window
Name[de]=Neues leeres Fenster
Name[es]=Nueva ventana vacía
Name[fr]=Nouvelle fenêtre vide
Name[it]=Nuova finestra vuota
Name[ja]=新しい空のウィンドウ
Name[ko]=새 빈 창
Name[ru]=Новое пустое окно
Name[zh_CN]=新建空窗口
Name[zh_TW]=開新空視窗
Exec=/usr/bin/cursor --new-window %F
Icon=cursor
EOF

    cat <<EOF > "${pkgdir}/usr/share/applications/cursor-url-handler.desktop"
[Desktop Entry]
Name=Cursor - URL Handler
Comment=The AI Code Editor.
GenericName=Text Editor
Exec=/usr/bin/cursor --open-url %U
Icon=cursor
Type=Application
NoDisplay=true
StartupNotify=true
Categories=Utility;TextEditor;Development;IDE;
MimeType=x-scheme-handler/cursor;
Keywords=cursor;
EOF
}
