# Maintainer: dougbug589 <180086805+dougbug589@users.noreply.github.com>
pkgname=mak-attatch
pkgver=1.4.0
pkgrel=1
pkgdesc="Attach TMDB cover art posters to video files"
arch=('any')
url="https://github.com/dougbug589/mak-attatch"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests' 'python-guessit' 'ffmpeg' 'mkvtoolnix-cli')
optdepends=('python-textual: TUI interface' 'yazi: TUI file browser' 'chafa: TUI image preview')
checkdepends=('python-pytest' 'python-textual')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('237e8e6c50b474c99505384afb9d1065cd7d0af49dc79366e6c32905898e6ce9')

check() {
    cd "$srcdir/mak-attatch-$pkgver"
    QT_QPA_PLATFORM=offscreen python -m pytest tests -q
}

package() {
    cd "$srcdir/mak-attatch-$pkgver"
    local libdir="/usr/lib/$pkgname"

    install -d "$pkgdir$libdir"
    cp -r mak_attatch main.py cli.py poster-tui "$pkgdir$libdir/"
    # Users cannot write __pycache__ under /usr/lib: precompile once here so
    # startup does not recompile every time and root runs leave no stray files.
    python -m compileall -q -d "$libdir" "$pkgdir$libdir"

    local entry
    for entry in "$pkgname:main.py" "$pkgname-tui:poster-tui" "$pkgname-cli:cli.py"; do
        install -Dm755 /dev/stdin "$pkgdir/usr/bin/${entry%%:*}" <<EOF
#!/bin/sh
exec /usr/bin/python3 $libdir/${entry#*:} "\$@"
EOF
    done

    install -Dm644 mak-attatch.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 mak_attatch/assets/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
