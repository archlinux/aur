# Maintainer: BrLi <brli@chakralinux.org>

pkgname=zettlr
pkgver=1.3.0
pkgrel=2
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url="https://www.zettlr.com"
license=('GPL')
depends=(electron ttf-webhostinghub-glyphs otf-crimson-text)
makedepends=(yarn git)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
source=($pkgname::git+https://github.com/Zettlr/Zettlr.git#tag=v$pkgver)
sha1sums=(SKIP)

build() {
    cd $srcdir/$pkgname
    yarn install --pure-lockfile
    yarn less
    yarn handlebars
    yarn lang:refresh

    cd $srcdir/$pkgname/source
    yarn install --pure-lockfile
}

package() {
    install -dm 755 "$pkgdir"/usr/lib/$pkgname

    cd $srcdir/$pkgname/
    cp -r --no-preserve=ownership --preserve=mode source/* "$pkgdir"/usr/lib/$pkgname/

    # Remove unneeded addin
    find $pkgdir/usr/lib/zettlr -name "fonts" -exec rm -rfv {} +
    find $pkgdir/usr/lib/zettlr -name ".gitignore" -or -name ".eslintrc.json" -or -name ".npmignore" -exec rm -rfv {} +

    install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname <<END
#!/bin/bash
exec electron /usr/lib/$pkgname "$@"
END

    for px in 16 24 32 48 64 96 128 256; do
        install -Dm644 resources/icons/png/"$px"x"$px".png \
        $pkgdir/usr/share/icons/hicolor/"$px"x"$px"/apps/$pkgname.png
    done

    install -Dm644 /dev/stdin $pkgdir/usr/share/applications/$pkgname.desktop <<END
[Desktop Entry]
Name=Zettlr
Comment=A powerful Markdown Editor with integrated tree view
Exec="$pkgname" %U
Terminal=false
Type=Application
Icon=$pkgname
StartupWMClass=Zettlr
MimeType=text/markdown;
Categories=Office;
END
}
