# Maintainer: Ian Lansdowne <idlansdowneatgmaildotcom>
pkgname=nrel-sam-bin
pkgrel=1
pkgver=2025.4.16.r1.ssc.303
pkgdesc='A free desktop application for techno-economic analysis of energy technologies'
arch=(x86_64)
url='https://sam.nrel.gov/'
license=('BSD-3-Clause')
depends=()
makedepends=('gendesk')
conflicts=(nrel-sam)
source=("sam-$pkgver.run::https://samrepo.nrelcloud.org/beta-releases/sam-linux-2025-4-16-r1.run" 'file://SAM.png')
sha256sums=('5f4e7061f8726aeb25d39bbf49bec56ef423dec578dfdfc278deae5aad603caa'
            '6a918ccd7f7ed5c103042482dc3ae73a8c69a75e80c909b20ffa41c33693c379')

build() {
    echo "  -> Extracting archive..."
    mkdir -p "$srcdir/extract" "$srcdir/build/opt/SAM"
    ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR+1; exit 0; }' "$srcdir/sam-$pkgver.run"`
    tail -n+$ARCHIVE "$srcdir/sam-$pkgver.run" | tar xz -C "$srcdir/extract"
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
        --name "System Advisor Model (SAM)" \
        --genericname 'SAM' \
        --comment 'techno-economic analysis of energy technologies' \
        --categories 'Development;Science' \
        --mimetypes '' \
        --icon 'SAM' \
        --exec '/usr/bin/SAM'
}

package() {
    echo "  -> Moving files from build area to package area directly to save space..."
    cp -r "$srcdir/build/"* "$pkgdir"

    echo "  -> Installing desktop files..."
    install -Dm644 "$srcdir/sam.desktop" \
        "$pkgdir/usr/share/applications/sam.desktop"
    install -Dm644 "$srcdir/SAM.png" \
        "$pkgdir/usr/share/pixmaps/SAM.png"

    echo "  -> Symlinking executables..."
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/SAM/SAM" "$pkgdir/usr/bin/SAM"
}
