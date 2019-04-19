# Maintainer: Caleb Maclennan <caleb@alerque.com>

# https://wiki.archlinux.org/index.php/Electron_package_guidelines

pkgname=ezra-project-git
pkgver=0.7.1.r78.ga4116c6
_branch='master'
pkgrel=0
pkgdesc="a bible study software focussing on topical study based on keywords/tags"
arch=('x86_64')
url="https://github.com/tobias-klein/ezra-project"
license=('GPL3')
depends=('electron' 'nodejs' 'sword-svn')
makedepends=('npm' 'git')
source=("git://github.com/tobias-klein/${pkgname%-git}.git#branch=$_branch"
        'ezra-project.sh'
        'ezra-project.desktop')
sha256sums=('SKIP'
            '64a090df98701e76e973f44692f4c4a33e9b78557f59b4b7e99beb6f407836d9'
            'f89adcdecca5b0684679a4c4060a7e0398b5d332b2377e0fb0e115969d94e116')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    local version="$(electron --version | sed 's/^v//')"
    npm uninstall --no-audit -D electron
    npm install --no-audit electron@"$version"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    npm run rebuild-linux
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

    cd release/ezra-project-linux-x64/resources
    install -Dm644 electron.asar "$pkgdir/usr/lib/${pkgname%-git}/app.asar"
    cp -a app "$pkgdir/usr/lib/${pkgname%-git}/"
}

