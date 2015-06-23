#Maintainer: Iwan Timmer <irtimmer@gmail.com>
#Contributor: Vincent Demeester <vincent@sbr.io>
#Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=docker-compose
pkgver=1.3.1
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
depends=('python2-docopt' 'python2-yaml' 'python2-requests' 'python2-pip'
         'python2-six' 'python2-texttable' 'python2-websocket-client'
         'python2-docker-py>=1.2.3' 'python2-dockerpty>=0.3.4' 'docker' 'python2-certifi')
arch=('any')
source=("https://github.com/docker/compose/archive/$pkgver.tar.gz"
        "remove-requires-upper-bound.patch")
url="https://www.docker.com/"
license="BSD"
sha256sums=('04b60b805dc305543d5fe9a0880b8e1ad5818c440587a26b0eb01f9e3e8e79eb'
            '3038eed8d1aec71b3197b786c7b4ad0b188bfe7e5476ad0a45ea3cd065585d21')

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
