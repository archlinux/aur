# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

name=watchghost
pkgname=$name-git
pkgver=0.1.0.git_110.600f606
pkgrel=1
epoch=1
pkgdesc="Your invisible but loud monitoring pet"
arch=('any')
url='https://gitlab.com/localg-host/watchghost/'
license=('AGPLv3')
depends=('python-tornado' 'python-aioftp')
makedepends=('python-setuptools')
source=('git+https://gitlab.com/localg-host/watchghost.git')
sha256sums=('SKIP')
install=watchghost.install
backup=(
    'etc/watchghost/watchers'
    'etc/watchghost/loggers'
    'etc/watchghost/servers'
    'etc/watchghost/groups'
)

pkgver(){
    cd $srcdir/$name

    echo 0.1.0.git_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$name"
    python3 setup.py build
    python3 setup.py install --prefix=/usr --root="${pkgdir}"

    install -D $startdir/sysusers.conf $pkgdir/usr/lib/sysusers.d/watchghost.conf
    install -D $startdir/watchghost.service $pkgdir/usr/lib/systemd/system/watchghost.service
    for filename in groups loggers servers watchers ; do
      install -D $srcdir/watchghost/watchghost/etc/$filename $pkgdir/etc/watchghost/$filename
    done
}

