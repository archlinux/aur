# Author: futpib <futpib@gmail.com>

pkgname=breeze-rofi-theme-git
pkgver=r41.df07825
pkgrel=1
pkgdesc="Breeze Themes for Rofi to match KDE Breeze Themes"
arch=('x86_64')
url='https://github.com/futpib/breeze-rofi-theme'
license=('GPL')
depends=('rofi')
makedepends=('git' 'nodejs' 'yarn' 'node-gyp' 'python' 'unzip')
provides=('breeze-rofi-theme')
conflicts=('breeze-rofi-theme')
source=(
    "git+https://github.com/futpib/breeze-rofi-theme.git"
    "git+https://github.com/KDE/breeze.git"
    "git+https://github.com/davatorium/rofi.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

_pkgname=${pkgname%%-git}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    git submodule init
    git config submodule.breeze.url "${srcdir}/breeze"
    git config submodule.rofi.url "${srcdir}/rofi"
    git submodule update
}

build() {
    cd "${srcdir}/${_pkgname}"

    yarn install --immutable
    yarn gulp
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -dm755 "$pkgdir/usr/share/rofi/themes/"
    install -Dm644 ./dist/*.rasi "$pkgdir/usr/share/rofi/themes/"
}
