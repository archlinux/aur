# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-amplify-agent
pkgver=0.45_2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="NGINX Amplify Agent"
arch=(any)
url="https://www.nginx.com/products/nginx-amplify/"
license=('BSD')
depends=('python2-netifaces' 'python2-psutil' 'python2-gevent' 'python2-flup'
         'python2-pyhamcrest' 'python2-daemon' 'python2-ujson' 'python2-rstr'
         'python2-setproctitle' 'python2-pyparsing' 'python2-requests'
         'python2-netaddr' 'nginx')
makedepends=('python2-setuptools')
source=("https://github.com/nginxinc/$pkgname/archive/v$_pkgver/$pkgname-$pkgver.tar.gz"
        "amplify-agent.service"
        "tmpfile.conf")
backup=('etc/amplify-agent/agent.conf')
sha256sums=('9fe4db756efb325a0056b863415f045f68694976884498b302f1ac55aacb3fff'
            'b848ed0386666a3c03b7f720ee08a40d4e434362c14145d244ef4370bb92f038'
            '3024f05029e2ca4d2565a8f9201f8d72ee29d956fd0c75cdba912607f81e0e05')

build() {
  cd "$srcdir"/$pkgname-$_pkgver
  python2 setup.py build
}

package() {
  install -Dm644 amplify-agent.service "$pkgdir"/usr/lib/systemd/system/amplify-agent.service
  install -Dm644 tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/amplify-agent

  cd "$srcdir"/$pkgname-$_pkgver
  python2 setup.py install -O1 --skip-build --root="$pkgdir"

  mv "$pkgdir"/etc/amplify-agent/agent.conf{.default,}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
