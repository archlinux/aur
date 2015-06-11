#Maintainer: Iwan Timmer <irtimmer@gmail.com>
#Contributor: Vincent Demeester <vincent@sbr.io>
#Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=docker-compose
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
depends=('python2-docopt' 'python2-yaml' 'python2-requests' 'python2-pip'
         'python2-six' 'python2-texttable' 'python2-websocket-client'
         'python2-docker-py>=1.0.0' 'python2-dockerpty' 'docker' 'python2-certifi')
arch=('x86_64' 'i686')
source=("https://github.com/docker/compose/archive/$pkgver.tar.gz"
        "remove-requires-upper-bound.patch")
url="https://www.docker.com/"
license="BSD"
sha256sums=('89c2626f6d03ca18440a67470272f1383c2ca867320abf710abdab96d467868d'
            'e1716b10f44ee9ee6dcdd6a0b9d638bc8a9f25fc756dcd16790c7142780ec9cd')

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
