# Maintainer: Ian Lansdowne <idlansdowneatgmaildotcom>
pkgname=nrel-sam-bin
pkgrel=1
pkgver=2024.12.12
pkgdesc='A free desktop application for techno-economic analysis of energy technologies'
arch=(x86_64)
url='https://sam.nrel.gov/'
license=('BSD-3-Clause')
depends=()
makedepends=('gendesk')
source=('sam.run::https://sam.nrel.gov/download/77-sam-2024-12-12-for-linux/file.html' 'file://SAM.png')
sha256sums=('ededc3ce2b0137e4776c48ffc42eaa2be894ae897c32e44bf28d26151ded10eb' '6a918ccd7f7ed5c103042482dc3ae73a8c69a75e80c909b20ffa41c33693c379')

pkgver() {
    sed '/^SAMVER=/! d; s/[^=]*=//' "$srcdir/sam.run"
}

build() {
    echo "  -> Extracting archive..."
    mkdir -p "$srcdir/extract" "$srcdir/build/opt/SAM"
    ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR+1; exit 0; }' "$srcdir/sam.run"`
    tail -n+$ARCHIVE "$srcdir/sam.run" | tar xz -C "$srcdir/extract"
    cp -R "$srcdir/extract/sam.deploy/"* "$srcdir/build/opt/SAM"

    cat <<EOF > "$srcdir/build/opt/SAM/SAM"
#!/bin/sh
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/SAM/linux_64
export GTK2_RC_FILES=/opt/SAM/linux_64/GtkTheme/gtk-2.0/gtkrc
exec /opt/SAM/linux_64/sam.bin
EOF
    chmod a+x "$srcdir/build/opt/SAM/SAM"

    echo "  -> Generating desktop files..."
    gendesk -f -n \
        --pkgname 'sam' \
        --pkgdesc "$pkgdesc" \
        --name "System Advisor Model (SAM) $pkgver" \
        --genericname 'SAM' \
        --comment 'techno-economic analysis of energy technologies' \
        --categories 'Development;Science;' \
        --mimetypes '' \
        --icon 'SAM' \
        --exec '/usr/bin/SAM'
}

package() {
    echo "  -> Moving files from build area to package area directly to save space..."
    mv "$srcdir/build/"* "$pkgdir"

    echo "  -> Installing desktop files..."
    install -Dm644 "$srcdir/sam.desktop" \
        "$pkgdir/usr/share/applications/sam.desktop"
    install -Dm644 "$srcdir/SAM.png" \
        "$pkgdir/usr/share/pixmaps/SAM.png"

    echo "  -> Symlinking executables..."
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/SAM/SAM" "$pkgdir/usr/bin/SAM"
}
