# Maintainer: Michał Sałaban <michal@salaban.info>

pkgname=nginx-amplify-agent
pkgver=1.7.0_5
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="NGINX Amplify Agent"
arch=(any)
url="https://www.nginx.com/products/nginx-amplify/"
license=('BSD')
depends=('python2-netifaces' 'python2-psutil' 'python2-gevent' 'python2-flup'
         'python2-pyhamcrest' 'python2-daemon' 'python2-ujson' 'python2-rstr'
         'python2-setproctitle' 'python2-pyparsing' 'python2-requests'
         'python2-netaddr' 'python2-crossplane' 'python2-scandir' 'nginx')
makedepends=('python2-setuptools')
source=("https://github.com/nginxinc/nginx-amplify-agent/archive/v$_pkgver.tar.gz"
        "amplify-agent.service"
        "tmpfile.conf")
backup=('etc/amplify-agent/agent.conf')
sha256sums=('af8792a92fa3caf20c1114d204a18261a26eb7d30baecafb5843f98e277f017a'
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
  chgrp http -R "$pkgdir"/etc/amplify-agent/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -dm755 -o http -g http "$pkgdir"/var/log/amplify-agent
}
