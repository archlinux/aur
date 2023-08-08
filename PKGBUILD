# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=2.10.2
pkgrel=1
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
            'python-systemd: journal support'
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

sha512sums=('7a00458e85c4129ffe3d70e2d7bf7e5f8e584929dc7b2b7bdc27b4b49f6a42b0b15ef839e0e332d70a9959dd4efc0cb438bc69bd170cdd5f858c5dcd123a91e0'
            'b1dd772f8802be99ccba3add5f1e6f78e5e79d0967342668dd12e472651a6b91c342f11fba330caaca421cc3d6c7e2011e09a6bd131f8ba14bbc4a6206cce539'
            '62b2eccc352d33853ef243c9cddd63663014aa97b87242f1b5bc5099a7dbd69ff3821f24ffc58e1b7f2387bd4e9e9712cc4c67f661b1724ad99cdf09b3717794')
