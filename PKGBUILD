# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=0.14.0+26+ge5def5b0
pkgrel=2
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
            beaa976b2fc9979b0069da3ce219ed99e0a8ae0aa703785b082db4de20c83baac53b64d80341dc3e3f0eb3b7d4989a65ca008065981a1e405c65938edebefabe
            6bcc5854ebbe8a50f9929714d6d00f2b273b9c7dda16289868727edf2cf7f6c42b5de5d696efdc725b255f31f5d94867c05e94f7563adf587bc0a750212562ad)

pkgver() {
  cd $srcdir/searx
  git describe --tags | sed 's/v//;s/-/+/g'
}

prepare() {
  cd $srcdir/searx
  sed -i 's|==|>=|g' requirements.txt
  sed -i "s/ultrasecretkey\" # change this!/`openssl rand -hex 128`\"/g" searx/settings.yml

  # If morty is installed, add it's key to searx settings
  msg2 'Checking for morty installation...'
  if [ -f "/usr/bin/morty" ]; then
    sed -i "s/your_morty_proxy_key/$(cat /usr/lib/systemd/system/morty.service |
        grep key | awk '{print $5}')/" searx/settings.yml &&
      msg2 'Morty found; added key to searx settings.'
  else
    msg2 'Morty not found.'
  fi
  sleep 4
}

package() {
  cd $srcdir/searx
  python2 setup.py install --root=$pkgdir --optimize=1
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,requirements*,tests,searx}
  install -Dm 644 searx/settings.yml $pkgdir/etc/searx/settings.yml
  install -Dm 644 $srcdir/searx.service $pkgdir/usr/lib/systemd/system/searx.service
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/searx/LICENSE
}
