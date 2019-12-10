# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=zettlr
pkgver=1.4.3
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

prepare() {
    cd $srcdir/$pkgname
    
    # We don't build electron, and doesn't depends on postinstall script
    sed '/"electron"/d;/postinstall/d' -i package.json

    # Add some close-to-complete translations
    cd $srcdir/$pkgname/scripts
    sed "s/'fr-FR'/'fr-FR','ja-JP','zh-CN','es-ES','ru-RU'/" -i refresh-language.js
}

build() {
    cd $srcdir/$pkgname
    yarn install --pure-lockfile
    yarn less
    yarn handlebars
    yarn lang:refresh
    yarn wp:prod
    yarn reveal:build

    cd $srcdir/$pkgname/source
    yarn install --pure-lockfile
}

package() {
    local _destdir=usr/lib/$pkgname
    install -dm755 "$pkgdir/$_destdir"

    cd $srcdir/$pkgname/source
    sed "s,$srcdir/$pkgname/source,$_destdir,g" -i renderer/assets/vue/vue-sidebar.js
    cp -r --no-preserve=ownership --preserve=mode * "$pkgdir/$_destdir/"

    # Aggressively remove binary and addins in node_modules
    find $pkgdir/$_destdir -type d -name "fonts" -exec rm -rfv {} +
    find $pkgdir/$_destdir -name "\.bin" -exec rm -rfv {} +
    find $pkgdir/$_destdir -name "\.gitignore" -exec rm -rfv {} +
    find $pkgdir/$_destdir -name "\.eslintrc.json" -exec rm -rfv {} +
    find $pkgdir/$_destdir -name "\.npmignore" -exec rm -rfv {} +

    install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname <<END
#!/bin/sh
exec electron /$_destdir "\$@"
END

    for px in 16 24 32 48 64 96 128 256; do
        install -Dm644 $srcdir/$pkgname/resources/icons/png/"$px"x"$px".png \
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
