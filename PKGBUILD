# Maintainer: Furdox <furdox at furdox dot tk>
pkgname=brawlcrate-wine-bin
pkgver=0.42h1
pkgrel=5
pkgdesc="An updated fork of BrawlBox (uses Wine)"
arch=('x86_64')
url="https://github.com/soopercool101/BrawlCrate"
license=('lgpl3')
depends=('wine' 'winetricks' 'xorg-server' 'lib32-gnutls')
source=("https://github.com/soopercool101/BrawlCrate/releases/download/v${pkgver}/BrawlCrate.v${pkgver}.x86.exe"
        "https://github.com/soopercool101/BrawlCrate/raw/master/LICENSE" "BrawlCrate256.png" "BrawlCrate128.png" "BrawlCrate64.png" "BrawlCrate48.png" "BrawlCrate32.png")
sha256sums=('49196339e461a87008cdf10ff55b264e98980cf2736b41bacf7c154a07d594d5'
            'dbcd19ea5a26de8ad07b566291bab225318cc218e0f1f0d522ce47baa1f3c319'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# Custom Wine prefix path
_wineprefix="${HOME}/.local/share/wineprefixes/brawlcrate"

prepare() {
    # Ensure the Wine prefix directory exists
    mkdir -p "${_wineprefix}"

    # Setup the Wine prefix if not already done
    if [ ! -d "${_wineprefix}/drive_c" ]; then
        WINEARCH=win32 WINEPREFIX="${_wineprefix}" wineboot --init
    fi
}

package() {
    # Run the self-extracting executable with Wine to extract its contents. No longer needed.
    # WINEPREFIX="${_wineprefix}" WINEARCH=win32 wine "${srcdir}/BrawlCrate.v${pkgver}.x86.exe"

    # Move all files from the extraction directory to the package directory
    install -d "${pkgdir}/opt/brawlcrate"
    cp -r "${srcdir}/." "${pkgdir}/opt/brawlcrate/"

    # Create a launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/brawlcrate" <<EOF
#!/bin/bash
export WINEPREFIX="${_wineprefix}"
export WINEARCH=win32
cd /opt/brawlcrate
wine BrawlCrate.exe "\$@"
EOF

    # Create MIME types file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/brawlcrate.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-brawlcrate">
        <comment>BrawlCrate Files</comment>
        <glob pattern="*.pac"/>
        <glob pattern="*.pcs"/>
        <glob pattern="*.arc"/>
        <glob pattern="*.carc"/>
        <glob pattern="*.mrg"/>
        <glob pattern="*.mrgc"/>
        <glob pattern="*.szs"/>
        <glob pattern="*.brres"/>
        <glob pattern="*.branim"/>
        <glob pattern="*.brmdl"/>
        <glob pattern="*.brtex"/>
        <glob pattern="*.brplt"/>
        <glob pattern="*.brcha"/>
        <glob pattern="*.brtsa"/>
        <glob pattern="*.brsha"/>
        <glob pattern="*.brvia"/>
        <glob pattern="*.brtpa"/>
        <glob pattern="*.brcla"/>
        <glob pattern="*.brsca"/>
        <glob pattern="*.mdl0"/>
        <glob pattern="*.tex0"/>
        <glob pattern="*.plt0"/>
        <glob pattern="*.chr0"/>
        <glob pattern="*.srt0"/>
        <glob pattern="*.shp0"/>
        <glob pattern="*.vis0"/>
        <glob pattern="*.pat0"/>
        <glob pattern="*.clr0"/>
        <glob pattern="*.scn0"/>
        <glob pattern="*.brstm"/>
        <glob pattern="*.bcstm"/>
        <glob pattern="*.bfstm"/>
        <glob pattern="*.brsar"/>
        <glob pattern="*.brwsd"/>
        <glob pattern="*.brbnk"/>
        <glob pattern="*.brseq"/>
        <glob pattern="*.efls"/>
        <glob pattern="*.breff"/>
        <glob pattern="*.breft"/>
        <glob pattern="*.dol"/>
        <glob pattern="*.rel"/>
        <glob pattern="*.tpl"/>
        <glob pattern="*.thp"/>
        <glob pattern="*.msbin"/>
        <glob pattern="*.coll"/>
        <glob pattern="*.stpm"/>
        <glob pattern="*.stdt"/>
        <glob pattern="*.scla"/>
        <glob pattern="*.tbcl"/>
        <glob pattern="*.tbgc"/>
        <glob pattern="*.tbgd"/>
        <glob pattern="*.tbgm"/>
        <glob pattern="*.tblv"/>
        <glob pattern="*.tbrm"/>
        <glob pattern="*.tbst"/>
        <glob pattern="*.adsj"/>
        <glob pattern="*.bloc"/>
        <glob pattern="*.geg1"/>
        <glob pattern="*.gct"/>
        <glob pattern="*.masq"/>
        <glob pattern="*.bx"/>
        <glob pattern="*.cmm"/>
        <glob pattern="*.asl"/>
        <glob pattern="*.param"/>
        <glob pattern="*.tlst"/>
        <glob pattern="*.selb"/>
        <glob pattern="*.selc"/>
        <glob pattern="*.itov"/>
    </mime-type>
</mime-info>
EOF

# Create desktop entry
install -Dm644 "${srcdir}/BrawlCrate256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/brawlcrate.png"
install -Dm644 "${srcdir}/BrawlCrate128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/brawlcrate.png"
install -Dm644 "${srcdir}/BrawlCrate64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/brawlcrate.png"
install -Dm644 "${srcdir}/BrawlCrate48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/brawlcrate.png"
install -Dm644 "${srcdir}/BrawlCrate32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/brawlcrate.png"
install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/brawlcrate.desktop" <<EOF
[Desktop Entry]
Name=BrawlCrate
Comment=BrawlBox fork with a variety of features aiming to improve the ease of modding Super Smash Bros. Brawl and other games.
Exec=brawlcrate
Icon=brawlcrate
Type=Application
Categories=Game;Utility;
MimeType=application/x-brawlcrate;
EOF

    # Copy the license file
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# No need to build anything
build() {
    :
}

# Clean up
clean() {
    echo "Running cleanup..."
    rm -rf "${srcdir}/*"
    
    # Currently doesn't work.
    rm -f "${srcdir}/../BrawlCrate.v${pkgver}.x86.exe"
    rm -f "${srcdir}/../brawlcrate-wine-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar"
    
    echo "Cleanup done."
}

# Post-installation hook to update the MIME database
post_install() {
    update-mime-database /usr/share/mime
}

# Pre-removal hook to update the MIME database
pre_remove() {
    update-mime-database /usr/share/mime
}
