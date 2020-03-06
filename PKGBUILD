# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=zettlr
_name=Zettlr
pkgver=1.6.0
pkgrel=2
pkgdesc='A Markdown Editor for the 21st century'
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL')
depends=('electron'
         'otf-crimson-text'
         'ttf-webhostinghub-glyphs')
makedepends=('gendesk'
             'node-prune'
             'yarn')
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
source=("$pkgname-$pkgver::https://github.com/$_name/$_name/archive/v$pkgver.tar.gz"
        "$pkgname")
sha256sums=('765c9d74a7d9a6a35df88cb6ca23db7e88409e32d0c9cbf4b234cc47d8d69b39'
            '5e89480043eedfbc85696d078663e6dae834e23b215e2ea41ad6e1af9427e0ab')
_mimetype=text/markdown
_categories=Office

prepare() {
    gendesk -f -n --custom StartupWMClass="$_name"
    cd "$_name-$pkgver"

    # We don't build electron, and doesn't depends on postinstall script
    sed -i -e '/"electron"/d;/postinstall/d' package.json

    # Add some close-to-complete translations
    sed -i -e "s/'fr-FR'/'fr-FR','ja-JP','zh-CN','es-ES','ru-RU'/" scripts/refresh-language.js
}

build() {
    cd "$_name-$pkgver"
    NODE_ENV= yarn install --pure-lockfile --no-bin-links --cache-folder "$srcdir/cache" --link-folder "$srcdir/link"
    yarn less
    yarn handlebars
    yarn lang:refresh
    NODE_ENV=production node node_modules/webpack/bin/webpack.js
    yarn reveal:build

    pushd source
    yarn install --pure-lockfile --cache-folder "$srcdir/cache"
    node-prune node_modules
    find . -type d -name fonts -exec rm -rfv {} +
}

package() {
    cd "$_name-$pkgver"

    local _destdir="usr/lib/$pkgname"

    install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname"
    sed -i -e "s,$srcdir/$_name-$pkgver/source,$_destdir,g" source/renderer/assets/vue/vue-sidebar.js

    install -dm755 "$pkgdir/$_destdir"
    cp -r --no-preserve=ownership --preserve=mode source/* "$pkgdir/$_destdir"

    for px in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "resources/icons/png/${px}x$px.png" \
            "$pkgdir/usr/share/icons/hicolor/${px}x$px/apps/$pkgname.png"
    done

    install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
    install -Dm644 "source/renderer/assets/img/zettlr-official-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
