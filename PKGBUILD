# Maintainer: Sparrow He <sparrowhe@gmail.com>
# Maintainer: la .uetcis. <uetcis at fal dot moe>

pkgname=euroscope-bin
pkgver=3.2.9
pkgrel=11
pkgdesc="A radar scope for VATSIM"
arch=("x86_64")
url="https://euroscope.hu/"
license=('custom')
makedepends=('catdoc')
depends=('wine' 'wine-mono' 'winetricks')
optdepends=('trackaudio: Audio For VATSIM support')
install=$pkgname.install
source=("https://euroscope.hu/install/EuroScopeSetup.${pkgver}.msi"
        "euroscope-bin"
        "euroscope.desktop"
        "euroscope.png"
)
sha512sums=('b40dc7fd50f29a2c699ca9cbb985fcd4c2d227ce88d233c9404b942bcdc961ddd0656f08c1064ec05c572a9268e4fd1222769a36241b565f1f3d2539829da362'
            '6be78967a692ffb8b8c0363bf8a91db434ecc1c21fe374b01957d5701f6f75928bf47cd8f9ed065dae648960dd058db260409e6f580be726f837bb62eb63fddd'
            'ffa95249cf74e0401c165576a1a0efade2d4837df692fb8ed0c787563ef062afe8a4038f0704b8485c2ca1e8fa1835787c427f1f0faa4264c3481a61d8d6e544'
            'b7609ff79b2b6f5367979aefd567d9c7e34006adff59bb55004ba0c10da8929235bc2c043369bb7e8382900f21299357857435e3dfcf593e42d7eebe5e4a4e87')

build() {
    unset WINEPREFIX
    echo "Extracting EuroScope -- This has to be done under X11/Xwayland"
    install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
    export WINEPREFIX="$srcdir"/tmp/env
    export XDG_DATA_HOME="$srcdir"/tmp/local
    msiexec /i "$srcdir/EuroScopeSetup.${pkgver}.msi" /quiet
    install -m755 -d "$srcdir/EuroScope"
}

package() {
    echo "Packaging EuroScope ..."
    install -m755 -d "$pkgdir/usr/share/$pkgname"
    catdoc "$srcdir/tmp/env/drive_c/users/$USER/AppData/Roaming/EuroScope/EuroScope - EULA.doc" | sed 's/Page[[:space:]]*PAGE[[:space:]]*1//g' \
         > "$pkgdir/usr/share/$pkgname/LICENSE"
    cp "$srcdir/tmp/env/drive_c/windows/Fonts/EuroScope.ttf" "$pkgdir/usr/share/$pkgname/"
    cp -r "$srcdir/tmp/env/drive_c/Program Files (x86)/EuroScope" "$pkgdir/usr/share/$pkgname/"
    find "$pkgdir/usr/share/$pkgname/" -type d -exec chmod 755 "{}" \;
    find "$pkgdir/usr/share/$pkgname/" -type f -exec chmod 644 "{}" \;
    install -d -m755 $pkgdir/usr/bin
    install -m755 "$srcdir"/euroscope-bin $pkgdir/usr/bin/
    install -Dm0644 euroscope.png "$pkgdir/usr/share/pixmaps/euroscope.png"
    install -Dm0644 euroscope.desktop "$pkgdir/usr/share/applications/euroscope.desktop"
}
