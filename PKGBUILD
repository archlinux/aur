# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=cheatengine-bin
pkgver=7.7
pkgrel=1
pkgdesc="Memory scanner/debugger for game hacking and reverse engineering"
arch=('x86_64')
url="https://cheatengine.org"
license=('LicenseRef-CheatEngine')
depends=('qt6-base' 'libx11' 'glibc')
makedepends=('python')
provides=('cheatengine')
conflicts=('cheatengine')
options=('!strip' '!debug')
source=("CheatEngineLinux${pkgver/./}.zip::https://cheatengine.org/download/CheatEngineLinux${pkgver/./}.zip")
sha256sums=('2effe9608015567372ccc95ed056564ffeed7d8290238e6378115b2e211dd7ae')

_instdir="usr/lib/cheatengine"

package() {
    cd "CheatEngineLinux${pkgver/./}"

    install -dm755 "${pkgdir}/${_instdir}"

    # Main binaries
    install -Dm755 cheatengine-x86_64 "${pkgdir}/${_instdir}/cheatengine-x86_64"
    install -Dm755 tutorial-x86_64 "${pkgdir}/${_instdir}/tutorial-x86_64"
    install -Dm755 gtutorial-x86_64 "${pkgdir}/${_instdir}/gtutorial-x86_64"

    # Bundled shared libraries (RUNPATH=$ORIGIN + dlopen from CWD)
    for lib in libQt6Pas.so.6 liblua53.so libtcc-64.so libtcc-64-windows.so libtcc-arm64.so \
               libcrypt.so.1.1.0 libcrypto.so.1.1 libssl.so.1.1 \
               libceapi.so libceserver-extension_x86_64_linux.so; do
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
    install -Dm644 defines.lua "${pkgdir}/${_instdir}/defines.lua"
    install -Dm644 celua.txt "${pkgdir}/${_instdir}/celua.txt"
    install -Dm644 commonmodulelist.txt "${pkgdir}/${_instdir}/commonmodulelist.txt"
    install -Dm644 donottrace.txt "${pkgdir}/${_instdir}/donottrace.txt"
    install -Dm644 dependencies.txt "${pkgdir}/${_instdir}/dependencies.txt"
    install -Dm644 ce.runtimeconfig.json "${pkgdir}/${_instdir}/ce.runtimeconfig.json"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Wrapper script (binary dlopen's libs from CWD with relative paths)
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/cheatengine" <<'EOF'
#!/bin/sh
cd /usr/lib/cheatengine || exit 1
exec ./cheatengine-x86_64 "$@"
EOF

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cheatengine.desktop" <<'EOF'
[Desktop Entry]
Name=Cheat Engine
Comment=Memory scanner/debugger for game hacking and reverse engineering
Exec=cheatengine
Icon=cheatengine
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
