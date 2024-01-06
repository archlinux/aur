# Maintainer: Evgeniy Alekseev

pkgname='ahriman'
pkgver=2.13.0
pkgrel=1
pkgdesc="ArcH linux ReposItory MANager"
arch=('any')
url="https://github.com/arcan1s/ahriman"
license=('GPL3')
depends=('devtools>=1:1.0.0' 'git' 'pyalpm' 'python-cerberus' 'python-inflection' 'python-passlib' 'python-requests' 'python-srcinfo')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-wheel')
optdepends=('breezy: -bzr packages support'
            'darcs: -darcs packages support'
            'mercurial: -hg packages support'
            'python-aioauth-client: web server with OAuth2 authorization'
            'python-aiohttp: web server'
            'python-aiohttp-apispec>=3.0.0: web server'
            'python-aiohttp-cors: web server'
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

sha512sums=('6cc0c18b774f7e9028e6f4793468b1b792317680e73e25dae7dbb4e1807d48f6327d005b3cd0540d403b1492db42da2a7c2d9e3b40c4e470a4d88be865842583'
            'b1dd772f8802be99ccba3add5f1e6f78e5e79d0967342668dd12e472651a6b91c342f11fba330caaca421cc3d6c7e2011e09a6bd131f8ba14bbc4a6206cce539'
            'ac22af25fc08f5bf1b9acbb77bbb6b2bb7af12d78ff1ae99463c16f36f1dd5ebae3af1413e353634aed5275af0eefee41257eded7987e67ae6a9411999d5a2ba')
