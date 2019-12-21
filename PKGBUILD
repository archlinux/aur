# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=zettlr
pkgver=1.5.0
pkgrel=1
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
    yarn install --pure-lockfile --no-bin-links --cache-folder $srcdir/cache --link-folder $srcdir/link
    yarn less
    yarn handlebars
    yarn lang:refresh
    NODE_ENV=production node node_modules/webpack/bin/webpack.js
    yarn reveal:build

    cd $srcdir/$pkgname/source
    yarn install --pure-lockfile --cache-folder $srcdir/cache

    # Aggressively remove binary and addins in node_modules
    find . -type d -name "fonts" -exec rm -rfv {} +
    find . -name "\.bin" -exec rm -rfv {} +
    find . -name "\.gitignore" -exec rm -rfv {} +
    find . -name "\.eslintrc*" -exec rm -rfv {} +
    find . -name "\.npmignore" -exec rm -rfv {} +
    find . -name "\.yarn*" -exec rm -rfv {} +
    find . -name "\.travis.yml" -exec rm -rfv {} +
    find . -name "\.tonic_example.js" -exec rm -rfv {} +
    find . -name "\.prettierrc.js" -exec rm -rfv {} +
    find . -name "\.coveralls.yml" -exec rm -rfv {} +
    find . -name "\.jscs.json" -exec rm -rfv {} +
    find . -name "\.babelrc.js" -exec rm -rfv {} +
    find . -name "\.vscode" -exec rm -rfv {} +
    find . -name "yarn.lock" -exec rm -rfv {} +
}

package() {
    local _destdir=usr/lib/$pkgname
    install -dm755 "$pkgdir/$_destdir"

    cd $srcdir/$pkgname/source
    sed "s,$srcdir/$pkgname/source,$_destdir,g" -i renderer/assets/vue/vue-sidebar.js
    cp -r --no-preserve=ownership --preserve=mode * "$pkgdir/$_destdir/"

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
