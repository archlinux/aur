# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

pkgname=kwin-polonium-git
pkgver=1.0rc.r79.g8c7e279
pkgrel=1
pkgdesc='A tiling window manager for KWin 5.27 and up (Git version)'
arch=('any')
url='https://zeroxoneafour.github.io/polonium/'
license=('MIT')

depends=('kwin')
makedepends=('git' 'npm' 'typescript')
conflicts=('kwin-polonium')
provides=('kwin-polonium')

source=('git+https://github.com/zeroxoneafour/polonium.git'
        'git+https://github.com/zeroxoneafour/kwin-api.git')
sha1sums=('SKIP'
          'SKIP')

pkgver() {
  cd polonium
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd polonium
    git submodule init
    git config submodule.kwin-api.url "$srcdir/kwin-api"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd polonium
    [[ -d pkg ]] && make clean
    make src res
}

package() {
    cd polonium
    install -D -o root -m 755 -d "$pkgdir/usr/share/kwin/scripts"
    cp -r pkg "$pkgdir/usr/share/kwin/scripts/polonium"

    install -D -o root -m 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
