# Contributor: wenLiangcan <boxeed at gmail dot com>
# Maintainer: hexchain <i at hexchain.org>

pkgname=lepton-snippet-manager-git
_pkgname=lepton-snippet-manager
pkgver=338.dd9551d
pkgrel=2
pkgdesc="A lean snippet manager based on GitHub Gist"
arch=('x86_64')
url="https://github.com/hackjutsu/Lepton"
license=('MIT')
depends=('electron' 'python' 'nodejs')
makedepends=('git' 'npm' 'imagemagick')
provides=('lepton-snippet-manager')
conflicts=('lepton-snippet-manager')
source=(
    "$_pkgname::git://github.com/hackjutsu/Lepton.git"
    'lepton-snippet-manager.desktop'
    'lepton-snippet-manager.sh'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    sed -i 's/^.*"electron".*$//;s/^.*"electron-builder".*$//' package.json
    npm i
    npm run build
}

package() {
    cd "$srcdir"
    install -Dm644 lepton-snippet-manager.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    convert build/icon.ico $srcdir/lepton-snippet-manager.png
    	
    for size in 24 72 512; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p $target
        convert $srcdir/lepton-snippet-manager-0.png -resize ${size}x${size} "$target/$_pkgname.png"
    done

    for size in 16 32 48 64 128 256; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
        mkdir -p $target
    done
    
    install -Dm644 "$srcdir/lepton-snippet-manager-0.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm644 "$srcdir/lepton-snippet-manager-1.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -Dm644 "$srcdir/lepton-snippet-manager-2.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
    install -Dm644 "$srcdir/lepton-snippet-manager-3.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_pkgname.png"
    install -Dm644 "$srcdir/lepton-snippet-manager-4.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -Dm644 "$srcdir/lepton-snippet-manager-5.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png"

    cd "$srcdir/$_pkgname/"
    mkdir -p "$pkgdir/opt/$_pkgname/"
    cp -r --no-preserve='ownership' -- * "$pkgdir/opt/$_pkgname/"
    install -Dm755 "$srcdir/lepton-snippet-manager.sh" "$pkgdir/usr/bin/lepton-snippet-manager"
}

sha256sums=('SKIP'
            '1da47def3ec6780a77635671e28aac263e47841da3825511d42de813f5b9c639'
            'dc9d3488c1730c1c6f2b729a64e75236844ee119bf64bf6c1eb03a0e78bccc4b')

