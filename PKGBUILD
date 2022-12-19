# Maintainer: bigshans <me+aur at bigshans dot com>
# Contributor: Christian Sarazin <archlinux at offlinehoster dot de>
pkgname=boxcli-git
pkgver=v3.6.0.r8.gd94ab35
pkgrel=1
epoch=1
arch=('any')
pkgdesc="The CLI for Box.com"
url="https://box.com"
license=('Apache')
makedepends=('git' 'npm')
depends=('nodejs>=8.0.0')
provides=('box')
options=()
install=
source=("git+https://www.github.com/box/boxcli")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%*-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir"/boxcli 
    npm install
    ./node_modules/.bin/oclif-dev pack --targets=linux-x64
}

package() {
    cd "$srcdir"/boxcli/dist/box-v*
    install -d "$pkgdir"/usr/lib
    install -d "$pkgdir"/usr/bin
	rm box-v*-linux-x64.tar.gz
    tar xvf box-v*.tar.gz --directory "$pkgdir"/usr/lib
    ln -sf /usr/lib/box/bin/box "$pkgdir"/usr/bin/box
}
