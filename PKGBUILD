#Maintainer: Iwan Timmer <irtimmer@gmail.com>
#Contributor: Vincent Demeester <vincent@sbr.io>
#Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=docker-compose
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
depends=('python2-docopt' 'python2-yaml' 'python2-requests' 'python2-pip'
         'python2-six' 'python2-texttable' 'python2-websocket-client'
         'python2-docker-py>=1.2.3' 'python2-dockerpty>=0.3.4' 'docker' 'python2-certifi')
arch=('x86_64' 'i686')
source=("https://github.com/docker/compose/archive/$pkgver.tar.gz"
        "remove-requires-upper-bound.patch")
url="https://www.docker.com/"
license="BSD"
sha256sums=('7fcf5ce1df5c53aedcfc875c2620035c735d75191ace6bc8ad97b9aeb522f153'
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
