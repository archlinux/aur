#Maintainer: Iwan Timmer <irtimmer@gmail.com>
#Contributor: Vincent Demeester <vincent@sbr.io>
#Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=docker-compose
pkgver=1.3.2
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
depends=('python2-docopt' 'python2-yaml' 'python2-requests' 'python2-pip'
         'python2-six' 'python2-texttable' 'python2-websocket-client>=0.32.0'
         'python2-docker-py>=1.3.0' 'python2-dockerpty>=0.3.4' 'docker' 'python2-certifi')
arch=('any')
source=("https://github.com/docker/compose/archive/$pkgver.tar.gz"
        "remove-requires-upper-bound.patch")
url="https://www.docker.com/"
license="BSD"
sha256sums=('61e26f9eaed839d2df69f85579239afd2d305b7c2d10bb96b03d8b92b4690d72'
            '954073423ec6f4427d8ef0e17ff5a2c3eb67f42eba8237e87fcc99dd056b6d02')

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
