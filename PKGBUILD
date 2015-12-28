# Maintainer: Scott Dunlop <swdunlop@gmail.com>
pkgname=walter-git
pkgver=1.3.0.r10.g393c3b7
pkgrel=1
pkgdesc='a tiny deployment pipeline'
arch=("x86_64" "i686") # probably arm; verification welcome
url="http://walter-cd.net/"
license=('Apache')
groups=()
depends=('glibc')
makedepends=('git' 'go') # godep may use git when it fetches dependencies
provides=("walter")
conflicts=("walter")
replaces=()
backup=()
options=()
install='walter.install'
noextract=()
source=(
    'walter::git+https://github.com/swdunlop/walter'
    'walter@.service'
)
md5sums=('SKIP'
         'a8fbee5cdd303bcab7df3c22fadcbc51')

# This version will not build, due to some missing dependencies -- swdunlop@gmail.com
#  pkgname=walter
#  pkgver=1.3.0
#  source=("https://github.com/walter-cd/walter/archive/v${pkgver}.zip")
#  md5sums=('844826f168778711aa7b5a98d5043045')

# uses the last tag as a base, along with revision count and last commit hash (and trims off that v)
pkgver() {
    cd "$srcdir/walter"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/walter"
    ./build
}

check() {
    cd "$srcdir/walter"
    ./test.sh
}

package() {
    cd "$srcdir/walter"
    install -Dm0755 -o root -g root bin/walter "$pkgdir/usr/bin/walter"
    install -Dm0644 -o root -g root "$srcdir/walter@.service" "$pkgdir/usr/lib/systemd/system/walter@.service"
}
