# Maintainer: Hao Long <aur@esd.cc>

pkgname=regexploit
pkgver=1.0.0
pkgrel=2
pkgdesc="Find regular expressions which are vulnerable to ReDoS"
arch=("any")
url="https://github.com/doyensec/regexploit"
license=('APACHE')
depends=('python' 'nodejs')
makedepends=('python-setuptools' 'npm')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1abd5f6a92fd0959ddf13c5e84246935d21c5cd173e8d38bcf58c24eb24cd36f')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cd $pkgdir/usr/lib/python*/site-packages/regexploit/bin/javascript
  npm install
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
