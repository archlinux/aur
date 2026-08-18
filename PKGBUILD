# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=cheatengine-bin
pkgver=7.7
pkgrel=4
pkgdesc="Memory scanner/debugger for game hacking and reverse engineering"
arch=('x86_64')
url="https://cheatengine.org"
license=('LicenseRef-CheatEngine')
depends=('qt6-base' 'libx11' 'glibc')
makedepends=('python')
provides=('cheatengine')
conflicts=('cheatengine')
options=('!strip' '!debug')
source=("CheatEngineLinux${pkgver/./}.zip::https://cheatengine.org/download/CheatEngineLinux${pkgver/./}.zip"
        "user-overlay.lua")
sha256sums=('1e3c312061a270e67c67cf215cc1640027270bdea66fd2793dd156414992f6d4'
            '7b0341d55bb5e16d473783eb7a5ab29552e3a91ab3f9a3f0aa9f79cebafe29c5')

_instdir="usr/lib/cheatengine"

package() {
    install -dm755 "${pkgdir}/${_instdir}"

    # Main binaries
    install -Dm755 cheatengine-x86_64 "${pkgdir}/${_instdir}/cheatengine-x86_64"
    install -Dm755 tutorial-x86_64 "${pkgdir}/${_instdir}/tutorial-x86_64"
    install -Dm755 gtutorial-x86_64 "${pkgdir}/${_instdir}/gtutorial-x86_64"

    # Bundled shared libraries (RUNPATH=$ORIGIN + dlopen from CWD)
    for lib in libQt6Pas.so.6 liblua53.so libtcc-64.so libtcc-64-windows.so libtcc-32.so libtcc-32-windows.so libtcc-arm64.so \
               libcrypt.so.1.1.0 libcrypto.so.1.1 libssl.so.1.1 \
               libceapi.so libceserver-extension_x86_64_linux.so libceserver-extension_x86_linux.so libceserver-extension_i386_linux.so; do
        install -Dm755 "$lib" "${pkgdir}/${_instdir}/$lib"
    done

    # Data files and scripts
    for dir in autorun Extensions languages badassets lua include; do
        cp -r --no-preserve=ownership "$dir" "${pkgdir}/${_instdir}/"
    done

    find "${pkgdir}/${_instdir}"/{autorun,Extensions,languages,badassets,lua,include} \
         -type d -exec chmod 755 {} +
    find "${pkgdir}/${_instdir}"/{autorun,Extensions,languages,badassets,lua,include} \
         -type f -exec chmod 644 {} +
    find "${pkgdir}/${_instdir}"/{autorun,Extensions,languages,badassets,lua,include} \
         -type f -name '*.so' -exec chmod 755 {} +

    # Config and data files
    install -Dm644 main.lua "${pkgdir}/${_instdir}/main.lua"
    install -Dm644 "${srcdir}/user-overlay.lua" "${pkgdir}/${_instdir}/user-overlay.lua"
    install -Dm644 defines.lua "${pkgdir}/${_instdir}/defines.lua"
    install -Dm644 celua.txt "${pkgdir}/${_instdir}/celua.txt"
    install -Dm644 readme-linux.txt "${pkgdir}/${_instdir}/readme-linux.txt"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Launcher: CE resolves its content dir from /proc/self/exe (symlinks
    # cannot relocate it) and dlopens some libs CWD-relative, so it runs from
    # a per-user dir whose CWD-shadowed main.lua (user-overlay.lua) provides
    # per-user autorun scripts on top of the read-only packaged tree.
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/cheatengine" <<'EOF'
#!/bin/sh
pkgdir=/usr/lib/cheatengine
userdir="${XDG_DATA_HOME:-$HOME/.local/share}/cheatengine"

if mkdir -p "$userdir/autorun" 2>/dev/null; then
    # .so symlinks for CWD-relative dlopen; never touch user-placed files/links
    for lib in "$pkgdir"/*.so*; do
        dest="$userdir/${lib##*/}"
        [ ! -e "$dest" ] && [ ! -L "$dest" ] && ln -s "$lib" "$dest"
    done
    # drop our own symlinks left dangling by an upstream lib removal
    for link in "$userdir"/*.so*; do
        if [ -L "$link" ] && [ ! -e "$link" ]; then
            case "$(readlink "$link")" in "$pkgdir"/*) rm -f "$link";; esac
        fi
    done
    if [ ! -e "$userdir/main.lua" ] && [ ! -L "$userdir/main.lua" ]; then
        ln -s "$pkgdir/user-overlay.lua" "$userdir/main.lua"
    fi
    if [ "$(readlink "$userdir/main.lua" 2>/dev/null)" = "$pkgdir/user-overlay.lua" ]; then
        # our overlay main.lua re-runs the autorun scan with user precedence
        cd "$userdir" && exec "$pkgdir/cheatengine-x86_64" NOAUTORUN "$@"
    elif [ -f "$userdir/main.lua" ]; then
        # user-authored main.lua: upstream shadow semantics, native autorun
        cd "$userdir" && exec "$pkgdir/cheatengine-x86_64" "$@"
    fi
fi
# unusable user dir: stock packaged behavior
cd "$pkgdir" || exit 1
exec ./cheatengine-x86_64 "$@"
EOF

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cheatengine.desktop" <<'EOF'
[Desktop Entry]
Name=Cheat Engine
Comment=Memory scanner/debugger for game hacking and reverse engineering
Exec=cheatengine
Icon=cheatengine
StartupWMClass=cheatengine-x86_64
Terminal=false
Type=Application
Categories=Development;Debugger;
EOF

    # Extract largest 128x128 PNG from binary (Lazarus-embedded app icon)
    python3 -c "
import struct
with open('cheatengine-x86_64','rb') as f: d=f.read()
m,p,best=b'\x89PNG\r\n\x1a\n',0,None
while True:
    p=d.find(m,p)
    if p<0: break
    e=d.find(b'IEND',p)
    if e>0:
        sz=e-p+8; c=d[p:p+sz]
        w,h=struct.unpack('>II',c[16:24])
        if w==128 and h==128 and (not best or sz>best[1]):
            best=(p,sz)
    p+=8
open('icon.png','wb').write(d[best[0]:best[0]+best[1]])
"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/cheatengine.png"
}

latestver() {
    curl -fsSL https://cheatengine.org/downloads.php |
        grep -aoP 'Download Cheat Engine \K[0-9]+(\.[0-9]+)+(?= For Linux)'
}
