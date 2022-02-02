# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

name=watchghost
pkgname=$name
pkgver=0.3.0
pkgrel=3
epoch=1
pkgdesc="Your invisible but loud monitoring pet"
arch=('any')
url='https://gitlab.com/localg-host/watchghost/'
license=('AGPLv3')
depends=('python-aiohttp' 'python-aioftp' 'python-asyncssh' 'python-whois' 'python-influxdb' 'python-aiohttp-jinja2')
makedepends=('python-setuptools')
source=("https://gitlab.com/localg-host/watchghost/-/archive/${pkgver}/watchghost-${pkgver}.tar.gz")
sha256sums=('3cdc89a27ccbcc5494d7c480c400fbb4a97a299ae3acd6d273b2a22d7e18b8a4')
conflicts=('watchghost-git')
install=watchghost.install
backup=(
    'etc/watchghost/watchers.toml'
    'etc/watchghost/loggers.toml'
    'etc/watchghost/servers.toml'
    'etc/watchghost/groups.toml'
)

package() {
    cd "${srcdir}/${name}-${pkgver}"
    python3 setup.py build
    python3 setup.py install --prefix=/usr --root="${pkgdir}"

    install -D $startdir/sysusers.conf $pkgdir/usr/lib/sysusers.d/watchghost.conf
    install -D $startdir/watchghost.service $pkgdir/usr/lib/systemd/system/watchghost.service
    for filename in groups loggers servers watchers ; do
      install -D $srcdir/${name}-${pkgver}/watchghost/etc/$filename.toml $pkgdir/etc/watchghost/$filename.toml
    done
}

