# Maintainer: Caleb Maclennan <caleb@alerque.com>

# https://wiki.archlinux.org/index.php/Electron_package_guidelines

pkgname=ezra-project-git
pkgver=0.8.1.r0.g2ec8c58
_branch='master'
pkgrel=2
pkgdesc="a bible study software focussing on topical study based on keywords/tags"
arch=('x86_64')
url="https://github.com/tobias-klein/ezra-project"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('npm' 'git' 'sword')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git://github.com/tobias-klein/${pkgname%-git}.git#branch=$_branch"
        'ezra-project.sh'
        'ezra-project.desktop')
sha256sums=('SKIP'
            '0a36167bce248b6082045163cf60b143d02ca1e447a791cf0c88e960a7fdc618'
            'f89adcdecca5b0684679a4c4060a7e0398b5d332b2377e0fb0e115969d94e116')
_electron="$(electron --version | sed 's/^v//')"

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    npm uninstall --no-audit -D electron
    npm install --no-audit electron@"$_electron"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    $(npm bin)/electron-rebuild -f -w node-sword-interface -v $_electron
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    $(npm bin)/electron-packager . ${pkgname%-git} --overwrite --asar --platform=linux --arch=x64 --prune=true --out=release --electron-version=$_electron
    rm release/ezra-project-linux-x64/${pkgname%-git}
    mkdir "$pkgdir/usr/lib/"
    cp -a release/ezra-project-linux-x64 "$pkgdir/usr/lib/${pkgname%-git}"
}
