# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: BrLi <brli at chakralinux dot org>

pkgname=zettlr-git
_name=Zettlr
pkgver=1.8.4.r27.gcbf81d8
pkgrel=1
pkgdesc='A Markdown Editor for the 21st century'
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL')
depends=('electron'
         'otf-crimson-text'
         'ttf-webhostinghub-glyphs')
makedepends=('gendesk'
             'git'
             'gulp'
             'node-prune'
             'yarn')
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/$_name/$_name"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '5e89480043eedfbc85696d078663e6dae834e23b215e2ea41ad6e1af9427e0ab')
_mimetype=text/markdown
_categories=Office
_yarnargs="--cache-folder '$srcdir/cache' --link-folder '$srcdir/link'"

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 --match="v*" HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    local _electronVersion=$(electron --version | sed -e 's/^v//')
    gendesk -f -n --custom StartupWMClass="$_name"
    cd "$pkgname"
    sed -i -e '/"electron"/d;/postinstall/d' package.json
    yarn install $_yarnargs --frozen-lockfile
    yarn add $_yarnargs --dev --no-lockfile \
        electron@$_electronVersion
    ln -sf /dev/null resources/pandoc
    yarn lang:refresh
    yarn csl:refresh
}

build() {
    cd "$pkgname"
    local NODE_ENV=''
    yarn install $_yarnargs --pure-lockfile
    NODE_ENV=production yarn run webpack
    yarn reveal:build
    # pushd source
    # yarn install $_yarnargs --pure-lockfile
    node-prune node_modules
    find . -type d -name fonts -exec rm -rfv {} +
}

package() {
    cd "$pkgname"
    local _destdir="usr/lib/${pkgname%-git}"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -dm755 "$pkgdir/$_destdir"
    cp -r --no-preserve=ownership --preserve=mode source/* "$pkgdir/$_destdir"
    for px in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "resources/icons/png/${px}x$px.png" \
            "$pkgdir/usr/share/icons/hicolor/${px}x$px/apps/${pkgname%-git}.png"
    done
    install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname%-git}.desktop"
    install -Dm644 "source/renderer/assets/img/zettlr-official-logo.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
