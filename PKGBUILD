# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=2.9.0
pkgrel=2
pkgdesc="ArcH linux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools>=1:1.0.0' 'git' 'pyalpm' 'python-cerberus' 'python-inflection' 'python-passlib' 'python-requests' 'python-srcinfo')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('breezy: -bzr packages support'
            'darcs: -darcs packages support'
            'mercurial: -hg packages support'
            'python-aioauth-client: web server with OAuth2 authorization'
            'python-aiohttp: web server'
            'python-aiohttp-apispec>=3.0.0: web server'
            'python-aiohttp-cors: web server'
            'python-aiohttp-debugtoolbar: web server with enabled debug panel'
            'python-aiohttp-jinja2: web server'
            'python-aiohttp-security: web server with authorization'
            'python-aiohttp-session: web server with authorization'
            'python-boto3: sync to s3'
            'python-cryptography: web server with authorization'
            'python-requests-unixsocket: client report to web server by unix socket'
            'python-jinja: html report generation'
            'rsync: sync by using rsync'
            'subversion: -svn packages support')
source=("https://github.com/arcan1s/ahriman/releases/download/$pkgver/$pkgname-$pkgver-src.tar.xz"
        'ahriman.sysusers'
        'ahriman.tmpfiles')
install="$pkgname.install"
backup=('etc/ahriman.ini'
        'etc/ahriman.ini.d/logging.ini')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" "dist/$pkgname-$pkgver-py3-none-any.whl"

  # python-installer actually thinks that you cannot just copy files to root
  # thus we need to copy them manually
  install -Dm644 "$pkgdir/usr/share/$pkgname/settings/ahriman.ini" "$pkgdir/etc/ahriman.ini"
  install -Dm644 "$pkgdir/usr/share/$pkgname/settings/ahriman.ini.d/logging.ini" "$pkgdir/etc/ahriman.ini.d/logging.ini"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

sha512sums=('19841842641520b573cdde6cb80a7cfcd69756d323fdfeebc2eee2d264a1325ead4ab2f8383bb369f7896bfc1de59d7358f133f4afeb90a9b9f0695f482a58d0'
            'b1dd772f8802be99ccba3add5f1e6f78e5e79d0967342668dd12e472651a6b91c342f11fba330caaca421cc3d6c7e2011e09a6bd131f8ba14bbc4a6206cce539'
            '62b2eccc352d33853ef243c9cddd63663014aa97b87242f1b5bc5099a7dbd69ff3821f24ffc58e1b7f2387bd4e9e9712cc4c67f661b1724ad99cdf09b3717794')
