#Maintainer: Iwan Timmer <irtimmer@gmail.com>
#Contributor: Vincent Demeester <vincent@sbr.io>
#Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=docker-compose
pkgver=1.4.2
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
depends=('python2-docopt' 'python2-yaml' 'python2-requests' 'python2-pip'
         'python2-six' 'python2-texttable' 'python2-websocket-client>=0.32.0'
         'python2-docker-py>=1.3.1' 'python2-dockerpty>=0.3.4' 'docker' 'python2-certifi')
arch=('any')
source=("https://github.com/docker/compose/archive/$pkgver.tar.gz"
        "remove-requires-upper-bound.patch")
url="https://www.docker.com/"
license="BSD"
sha256sums=('cc11f8281f0cf99fcb5502edb6e0d49caca26f4a11570b8ad68943bd3a97dd5c'
            '0d4102403070c290e0817828f634c670b753ab79d80f1e1566b1b0aaf77ee9b9')

prepare() {
    cd $srcdir/compose-$pkgver

    #Remove upper bound on requires
    patch -p1 < $srcdir/remove-requires-upper-bound.patch
}

build() {
    cd $srcdir/compose-$pkgver

    sed -i 's/==/>=/g' requirements.txt
    python2 setup.py build
}

package() {
    cd $srcdir/compose-$pkgver

    python2 setup.py install --root=$pkgdir
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 contrib/completion/bash/docker-compose $pkgdir/etc/bash_completion.d/docker-compose
}
