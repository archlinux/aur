# Maintainer: Naikee <dktgsitu@gmail.com>
#
# Arch package built straight from the repository, so that it follows the
# git tip: makepkg re-reads pkgver() on every build and pacman sees a newer
# version whenever a commit lands.
#
# Nothing is bundled here. On Arch the right thing is to lean on the system
# Python and the system Qt rather than ship a copy of both, which is what
# the .tar.gz release does. That makes this package about a megabyte
# instead of eighty.

_pkgname=ergopsx
pkgname=ergopsx-git
pkgver=r55.7400400
pkgrel=1
pkgdesc="PlayStation 1 save manager: memory cards, containers, game breakdowns, consoles over FTP"
arch=('any')
url="https://github.com/NaikeeAndy/ergopsx"
license=('MIT')
depends=('python' 'pyside6')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/NaikeeAndy/ergopsx.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    # The app reads its engine from tools/ and its string tables from
    # tools/data, so both travel with it.
    install -d "$pkgdir/usr/share/$_pkgname"
    cp -r qt tools "$pkgdir/usr/share/$_pkgname/"
    rm -rf "$pkgdir/usr/share/$_pkgname/qt/.venv" \
           "$pkgdir/usr/share/$_pkgname/qt/dist" \
           "$pkgdir/usr/share/$_pkgname/qt/build"
    find "$pkgdir/usr/share/$_pkgname" -name '__pycache__' -type d -exec rm -rf {} +

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$_pkgname" <<'LAUNCH'
#!/bin/sh
exec python /usr/share/ergopsx/qt/app.py "$@"
LAUNCH
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 qt/packaging/ergopsx.desktop \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 qt/packaging/ergopsx.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
