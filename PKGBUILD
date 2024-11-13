# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=2.15.3
pkgrel=1
pkgdesc="ArcH linux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools>=1:1.0.0' 'git' 'pyalpm' 'python-inflection' 'python-passlib' 'python-pyelftools' 'python-requests')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-wheel')
optdepends=('python-aioauth-client: web server with OAuth2 authorization'
            'python-aiohttp: web server'
            'python-aiohttp-apispec>=3.0.0: web server'
            'python-aiohttp-cors: web server'
            'python-aiohttp-jinja2: web server'
            'python-aiohttp-security: web server with authorization'
            'python-aiohttp-session: web server with authorization'
            'python-boto3: sync to s3'
            'python-cerberus: configuration validator'
            'python-cryptography: web server with authorization'
            'python-matplotlib: usage statistics chart'
            'python-requests-unixsocket2: client report to web server by unix socket'
            'python-jinja: html report generation'
            'python-systemd: journal support'
            'rsync: sync by using rsync')
source=("https://github.com/arcan1s/ahriman/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        'ahriman.sysusers'
        'ahriman.tmpfiles')
install="$pkgname.install"
backup=('etc/ahriman.ini'
        'etc/ahriman.ini.d/logging.ini')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" "dist/$pkgname-$pkgver-py3-none-any.whl"

  # thanks too PEP517, which we all wanted, you need to install data files manually nowadays
  pushd package && find . \( -type f -or -type l \) -exec install -Dm644 "{}" "$pkgdir/usr/{}" \; && popd

  # keep usr/share configs as reference and copy them to /etc
  install -Dm644 "$pkgdir/usr/share/$pkgname/settings/ahriman.ini" "$pkgdir/etc/ahriman.ini"
  install -Dm644 "$pkgdir/usr/share/$pkgname/settings/ahriman.ini.d/logging.ini" "$pkgdir/etc/ahriman.ini.d/logging.ini"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha512sums=('234280aa26eacf3f40098eef84d39c4a5f5a4ec46f894ad1e30c860b7ec71453a3d2697405786ef0348b62f0e1d622b833307f7f73d926a5a0e2b4692a840b2a'
            'b1dd772f8802be99ccba3add5f1e6f78e5e79d0967342668dd12e472651a6b91c342f11fba330caaca421cc3d6c7e2011e09a6bd131f8ba14bbc4a6206cce539'
            '331e286cc82a7aca07b0332fab886e7404884a83f942afcee590b4a7a06abc1e3daa2dcf50d45041007ad7f3b93f760bfea5c7d38aa57937b0e103fd65b36564')
