# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

name=watchghost
pkgname=$name-git
pkgver=0.4.0.git_512.62eca5a
pkgrel=2
epoch=1
pkgdesc="Your invisible but loud monitoring pet"
arch=('any')
url='https://gitlab.com/localg-host/watchghost/'
license=('AGPLv3')
depends=('python-aiohttp' 'python-aioftp' 'python-asyncssh' 'python-whois' 'python-influxdb' 'python-aiohttp-jinja2')
makedepends=('python-setuptools')
source=('git+https://gitlab.com/localg-host/watchghost.git#branch=master')
sha256sums=('SKIP')
conflicts=('watchghost')
install=watchghost.install
backup=(
    'etc/watchghost/watchers.toml'
    'etc/watchghost/loggers.toml'
    'etc/watchghost/servers.toml'
    'etc/watchghost/groups.toml'
)

pkgver(){
    cd $srcdir/$name
    echo 0.4.0.git_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


package() {
    cd "${srcdir}/${name}"
    python3 setup.py build
    python3 setup.py install --prefix=/usr --root="${pkgdir}"

    install -D $startdir/sysusers.conf $pkgdir/usr/lib/sysusers.d/watchghost.conf
    install -D $startdir/watchghost.service $pkgdir/usr/lib/systemd/system/watchghost.service
    for filename in groups loggers servers watchers ; do
      install -D $srcdir/${name}/watchghost/etc/$filename.toml $pkgdir/etc/watchghost/$filename.toml
    done
}

