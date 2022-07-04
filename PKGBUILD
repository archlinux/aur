# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=xdg-ninja-git
_pkgname=xdg-ninja
pkgver=r193.8395f1b
pkgrel=1
pkgdesc='A shell script which checks your $HOME for unwanted files and directories.'
arch=('any')
url="https://github.com/b3nj5m1n/${_pkgname}"
license=('GPL3')
depends=('jq' 'bc')
makedepends=('git')
optdepends=(
  'glow: rendering markdown in the terminal'
)
provides=('xdg-ninja')
conflicts=('xdg-ninja')
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed  's/"$(realpath "$0" | xargs dirname)"/\/var\/lib\/xdg-ninja/w replaced.txt' $_pkgname.sh > $_pkgname-patched.sh
    test -s replaced.txt || (echo 'Patch failed, please report out-of-date on AUR' && return 1)
}

package() {
    cd "$srcdir/$_pkgname"
    install -vDm 755 $_pkgname-patched.sh "$pkgdir/usr/bin/$_pkgname"
    mkdir -p "$pkgdir/var/lib/$_pkgname/"
    cp -r programs/ "$pkgdir/var/lib/$_pkgname/"
}

