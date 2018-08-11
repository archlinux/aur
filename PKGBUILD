# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Reventlov <contact+aur at volcanis dot me>

pkgname=searx-git
pkgver=0.14.0+84+geea2e8e5
pkgrel=1
pkgdesc='Privacy-respecting metasearch engine (git)'
arch=(any)
url=https://asciimoo.github.io/searx/
license=(AGPL3)
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
makedepends=(git openssl)
optdepends=('morty: Privacy-aware web content sanitizer proxy-as-a-service'
            'morty-git: Privacy-aware web content sanitizer proxy-as-a-service (Git)')
provides=(searx)
conflicts=(searx)
backup=(etc/searx/settings.yml)
install=searx.install
source=(git+https://github.com/asciimoo/searx
        searx.service)
sha512sums=(SKIP
            6bcc5854ebbe8a50f9929714d6d00f2b273b9c7dda16289868727edf2cf7f6c42b5de5d696efdc725b255f31f5d94867c05e94f7563adf587bc0a750212562ad)

pkgver() {
  cd searx
  git describe --tags | sed 's/v//;s/-/+/g'
}

prepare() {
  cd searx
  sed -i 's|==|>=|g' requirements.txt
  sed -i "s/ultrasecretkey\" # change this!/`openssl rand -hex 128`\"/g" searx/settings.yml

  # If morty is installed, add it's key to searx settings
  msg2 'Checking for morty installation...'
  if [ -f /usr/bin/morty ]; then
    sed -i "s/your_morty_proxy_key/$(cat /usr/lib/systemd/system/morty.service |
        grep key | awk '{print $5}')/" searx/settings.yml &&
      msg2 'Morty found; added key to searx settings.'
  else
    msg2 'Morty not found.'
  fi

  sleep 4
}

package() {
  install -Dm 644 searx.service "$pkgdir"/usr/lib/systemd/system/searx.service
  cd searx
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir"/usr/lib/python2.7/site-packages/{README.rst,requirements*,tests,searx}
  install -Dm 644 searx/settings.yml "$pkgdir"/etc/searx/settings.yml
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/searx/LICENSE
}
