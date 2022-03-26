# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Simo Leone <neotuli@gmail.com>

pkgname=t1utils-git
reponame=${pkgname%-git}
pkgver=1.42.r0.g72d6300e81
pkgrel=1
pkgdesc='A collection of simple Type 1 font manipulation programs'
arch=('x86_64')
url='http://www.lcdf.org/~eddietwo/type/#t1utils'
license=('custom')
depends=('glibc')
provides=('t1utils')
conflicts=('t1utils')
source=("git+https://github.com/kohler/$reponame.git"
        'LICENSE')
sha256sums=('SKIP'
            'fd00d777e6114f1d346978844f19bbec1652641ea40d24c12ec5aac6f3ebc7cb')

pkgver() {
    cd "$reponame"

    git describe --long --tags | sed '
        # v1.41-1-g3f1ddda (tag - number of commits - g(it)hash)
        s/^v//
        # 1.41-1-g3f1ddda
        s/\([^-]*-g\)/r\1/
        # 1.41-r1-g3f1ddda
        s/-/./g
        # 1.41.r1.g3f1ddda
'
}

build() {
    cd "$srcdir/$reponame"
    ./bootstrap.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$reponame"
    make DESTDIR="$pkgdir" install
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
