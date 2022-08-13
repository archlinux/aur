pkgname=thonny-git
pkgver=r3936.c1da4858
pkgrel=1
pkgdesc="Python IDE for beginners."
arch=('any')
url="http://thonny.org/"
license=('MIT')
conflicts=("thonny")
provides=("thonny")
depends=('openssl' 'python' 'python-beautifulsoup4' 'python-jedi' 'tcl' 'tk' 'python-distro' 'python-pip')
source=("git+https://github.com/thonny/thonny.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/thonny"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"

    pip3 install --prefix="$pkgdir/usr" --force -I tkinterhtml

    pyversion="$(ls $pkgdir/usr/lib | xargs)"

    install -Dm 755 "thonny/packaging/linux/thonny" "$pkgdir/usr/bin/thonny"

    sed -i "s/python3.7/$pyversion/g" "$pkgdir/usr/bin/thonny"

    sed -i 's|$target_dir|/usr|' "thonny/packaging/linux/Thonny.desktop"
    install -Dm 644 "thonny/packaging/linux/Thonny.desktop" \
            "$pkgdir/usr/share/applications/thonny.desktop"

    install -Dm 644 "thonny/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install.py currently does not allow for setting root for creating a package
    # Files must by copied manually for now in section below.
    install -d  644 "$pkgdir/usr/lib/$pyversion/site-packages/thonny"
    cp -dr --no-preserve=ownership "thonny/thonny" \
            "$pkgdir/usr/lib/$pyversion/site-packages"
}
