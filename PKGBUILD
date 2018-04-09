# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=0.14.0+26+ge5def5b0
pkgrel=1
pkgdesc='A privacy-respecting, hackable metasearch engine (Git)'
arch=(any)
url='https://asciimoo.github.io/searx/'
license=(AGPL)
makedepends=(git openssl)
depends=(python2-certifi
         python2-flask
         python2-flask-babel
         python2-lxml
         python2-idna
         python2-pygments
         python2-pyopenssl
         python2-dateutil
         python2-yaml
         python2-requests
         python2-pysocks)
optdepends=('morty: Privacy-aware web content sanitizer proxy-as-a-service'
            'morty-git: Privacy-aware web content sanitizer proxy-as-a-service (Git)')
conflicts=(searx)
backup=(etc/searx/settings.yml)
install=searx.install
source=(git+https://github.com/asciimoo/searx.git
        searx.install
        searx.service)
sha512sums=(SKIP
            bd0a21e9520123fe792378d3c8b9bd2a7a845eb814fb60954890f11883ab7e909933c5731fcd2a9cf59a7cde081c42633e2caab2ed1245f459d26ca412ee6f85
            6bcc5854ebbe8a50f9929714d6d00f2b273b9c7dda16289868727edf2cf7f6c42b5de5d696efdc725b255f31f5d94867c05e94f7563adf587bc0a750212562ad)

pkgver() {
  cd $srcdir/searx
  git describe --tags | sed 's/v//;s/-/+/g'
}

prepare() {
  cd $srcdir/searx
  sed -i 's|==|>=|g' requirements.txt
  sed -i "s/ultrasecretkey\" # change this!/`openssl rand -hex 128`\"/g" searx/settings.yml
}

package() {
  cd $srcdir/searx
  python2 setup.py install --root=$pkgdir --optimize=1
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,requirements*,tests,searx}
  install -Dm 644 searx/settings.yml $pkgdir/etc/searx/settings.yml
  install -Dm 644 $srcdir/searx.service $pkgdir/usr/lib/systemd/system/searx.service
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/searx/LICENSE
}
