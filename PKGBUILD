# Maintainer: xtexecute <none@none>

pkgname=fleshfetch
pkgver=1.4.0
pkgrel=2
pkgdesc='Qt-based clicker game and Python modding framework'
arch=('any')
url='https://github.com/xtexecute/fleshfetch'
license=('MIT')

depends=(
    'python'
    'pyside6>=6.8'
    'qt6-declarative>=6.8'
    'qt6-multimedia'
    'qt6-multimedia-ffmpeg'
    'python-requests'
)

optdepends=(
    'python-pypresence: Discord Rich Presence support'
)

source=(
    "$pkgname-$pkgver.zip::https://github.com/xtexecute/fleshfetch/releases/download/v$pkgver/ff_v${pkgver}_source.zip"
)
sha256sums=('aaae6858a83c0acc59a34ce337a7a26dac4204d5f01f9f4702efffe45bff8e7a')

prepare() {
    # Release ZIPs made on Windows may contain a CRLF shebang.
    sed -i 's/\r$//' "$srcdir/fleshfetch/fleshfetch"
}

package() {
    cd "$srcdir/fleshfetch"

    install -dm755 "$pkgdir/usr/share/fleshfetch/mods"
    for module in *.py; do
        case "$module" in
            *_OLD.py|build_*.py|package_source.py|restore_nuitka_payload.py|update_reference_14.py)
                continue
                ;;
        esac
        install -m644 "$module" "$pkgdir/usr/share/fleshfetch/"
    done

    cp -r qml assets "$pkgdir/usr/share/fleshfetch/"
    install -m644 flesh.png click.wav flesh.ico "$pkgdir/usr/share/fleshfetch/assets/"
    install -m644 default.conf "$pkgdir/usr/share/fleshfetch/default.conf"
    find "$pkgdir/usr/share/fleshfetch" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/fleshfetch" -type f -exec chmod 644 {} +

    install -Dm755 fleshfetch "$pkgdir/usr/bin/fleshfetch"
    install -Dm644 dev.xtexecute.fleshfetch.desktop \
        "$pkgdir/usr/share/applications/dev.xtexecute.fleshfetch.desktop"
    install -Dm644 dev.xtexecute.fleshfetch.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.xtexecute.fleshfetch.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
