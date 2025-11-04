# Maintainer: ZanDev32 <fauzan-basalamah@outlook.com>
# Contributor: Varakh <varakh@varakh.de>

pkgname=altair-ai-studio
pkgver=2026.0.1
pkgrel=1
pkgdesc="Altair AI Studio (RapidMiner Studio rebranded). Data science tool anyone can use to design and prototype highly explainable AI and machine learning models that help build trust throughout your organization"
DLAGENTS=('https::/usr/bin/aria2c %u -o %o --continue --max-connection-per-server=16 --min-split-size=1M --split=16 --console-log-level=warn --summary-interval=0')
arch=('any')
url="https://rapidminer.com"
depends=('java-runtime')
makedepends=('unzip' 'gendesk')
source=('https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio.zip'
        'altair-ai-studio.sh')
sha256sums=('b18adf29344a0e5ca42f15381f4956f836e7a02494cc82b4bf4a15690a0f5862'
            'e69a78eacd0e1a8e66fe0c44150efcb299a3133ef5cce81a5a092c6f43345cfc')

prepare() {
    echo "[${pkgname}] Generating desktop file..."
    gendesk -f --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
        --name "Altair AI Studio" \
        --exec "$pkgname" \
        --categories "Development;Science" && echo "ok"
}

package() {
    install -d "$pkgdir/opt/$pkgname" \
               "$pkgdir/usr/bin" \
               "$pkgdir/usr/share/applications" \
               "$pkgdir/usr/share/pixmaps"

    appdir=$(find "$srcdir" -maxdepth 3 -type d -name 'AI Studio *' | head -n1)
    [[ -z "$appdir" ]] && { echo "Error: app directory not found"; return 1; }

    cp -a "$appdir/." "$pkgdir/opt/$pkgname/"

    corejar=$(find "$appdir/lib" -maxdepth 1 -name 'rapidminer-studio-core-*.jar' | head -n1)
    [[ -z "$corejar" ]] && { echo "Error: core JAR not found"; return 1; }

    unzip -p "$corejar" com/rapidminer/resources/rapidminer_frame_icon_128.png > "$srcdir/$pkgname.png"
    install -m644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
