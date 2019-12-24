# Maintainer: Caleb Maclennan <caleb@alerque.com>

# https://wiki.archlinux.org/index.php/Electron_package_guidelines

pkgname=ezra-project
pkgver=0.11.0
pkgrel=1
pkgdesc="a bible study software focussing on topical study based on keywords/tags"
arch=('x86_64')
url="https://github.com/tobias-klein/ezra-project"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('npm' 'sword')
conflicts=("$pkgname-git")
source=("https://github.com/tobias-klein/$pkgname/archive/$pkgver.tar.gz"
        'ezra-project.sh'
        'ezra-project.desktop')
sha256sums=('40f3930b0ca07cc009e7d32c78faba4cb7dd64e9a8f731944a2f731427b68279'
            '0a36167bce248b6082045163cf60b143d02ca1e447a791cf0c88e960a7fdc618'
            'f89adcdecca5b0684679a4c4060a7e0398b5d332b2377e0fb0e115969d94e116')
_electron="$(electron --version | sed 's/^v//')"

prepare() {
    cd "$pkgname-$pkgver"
    npm uninstall --no-audit -D electron
    npm install --no-audit electron@"$_electron"
}

build() {
    cd "$pkgname-$pkgver"
    # npm run rebuild-linux
    "$(npm bin)"/electron-rebuild -f -w node-sword-interface -v "$_electron"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    "$(npm bin)"/electron-packager . "$pkgname" --overwrite --asar --platform=linux --arch=x64 --prune=true --out=release --electron-version="$_electron"
    rm release/ezra-project-linux-x64/"$pkgname"
    mkdir "$pkgdir/usr/lib/"
    cp -a release/ezra-project-linux-x64 "$pkgdir/usr/lib/$pkgname"
}
