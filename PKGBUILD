# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=v0.13.1+43+gbec9906b
pkgrel=2
pkgdesc='A privacy-respecting, hackable metasearch engine'
arch=(any)
url='https://asciimoo.github.io/searx/'
license=(AGPL)
makedepends=(git openssl)
depends=(python-certifi
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
optdepends=('morty-git: Privacy-aware web content sanitizer proxy-as-a-service')
conflicts=(searx)
backup=(etc/searx/settings.yml)
install=searx.install
source=(git+https://github.com/asciimoo/searx.git
        searx.install
        searx.service)
sha512sums=(SKIP
            0356da11cb6079e1c80ff8009d309a20632b297eb472730b018ff92d98c6670321349c65518677a4b31020517049f2329dbbbfbed51c27972bbac2e2c6a3564d 
            6bcc5854ebbe8a50f9929714d6d00f2b273b9c7dda16289868727edf2cf7f6c42b5de5d696efdc725b255f31f5d94867c05e94f7563adf587bc0a750212562ad)

pkgver() {
  cd $srcdir/searx

  git describe --tags | sed 's/-/+/g'
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
}
