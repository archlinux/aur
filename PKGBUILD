# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=gamja-git
_pkgname=gamja
pkgver=v1.0.0.beta.11.r0.gcaf6e99
pkgrel=1
pkgdesc='Simple IRC web client'
arch=('any')
url="https://codeberg.org/emersion/gamja"
license=('AGPL3')
makedepends=('npm' 'git')
provides=('gamja')
conflicts=('gamja')
source=("$_pkgname::git+https://codeberg.org/emersion/${_pkgname}")
sha256sums=('SKIP')
backup=('usr/share/webapps/gamja/config.json')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    npm install --include=dev
    npm run build

    cd dist
    echo "{}" > config.json
}

package() {
    install -dm755 "$pkgdir"/usr/share/webapps/gamja/
    cp -r "$srcdir/$_pkgname"/dist/* "$pkgdir"/usr/share/webapps/gamja
}
