# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx
pkgver=0.17.0
pkgrel=2
pkgdesc="A privacy-respecting, hackable metasearch engine (python(3) based)"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=(
        'uwsgi'
        'uwsgi-plugin-python'
        'python-certifi'
        'python-flask'
        'python-flask-babel'        
        'python-lxml'
        'python-idna'
        'python-pygments'
        'python-pyopenssl'
        'python-dateutil'        
        'python-yaml'
        'python-requests'
        'python-pysocks')
conflicts=('searx-git' )
replaces=('searx-py3')
backup=('etc/searx/settings.yml' 'etc/uwsgi/searx.ini')
source=("https://github.com/asciimoo/searx/archive/v$pkgver.zip"
        'searx.ini'
        'searx.sysusers'
        'py39_is_alive.patch::https://github.com/searx/searx/commit/3b8bd0770bff2486c30012606562e4d90e23d655.patch'
        'google_fix.patch::https://github.com/searx/searx/commit/8162d7aff4a61801615d8044b71c7c477b2b2816.patch')
sha512sums=('4a6a31c36de4b25bb3234b72cd35cb8c8a63881538958dcae080cf18311bee47cd3324c8a9aebeaf410adde0dcdc97bf1054ec837ced20335174071a18d27046'
            '6e1e7771e747e2bcb9cbc3e5ec9735461b6d791c0c0412e06e7dd802c18625edd0916de32164bf780c18ef7b6a87f55ed1e917377b3adb2bf53c0344f34b49e8'
            '6856e26451fe053d37c2ce4b9d5f3b35891dd8ec702c5256c02d04415124c57705abc497f12943948a85621bb0238d26c2c1f3a7bf42404a6ff1487c7655909e'
            '7eed631f36c992e46c5ea8afa9b038992c8cf16089b915df70a1321d4bca7287ac8877498d104caa315b49d180bf88d90c1d79f7ebdaa445ad4581bf1c4e72c3'
            'ec9b7f4f8d2071b9fdb03c96cc9664c019d1bcd7486cb69ac7e7c7096450166550b2ab0532353d63506fe82d6e82023993a7e3e3fa4849c41d201e4944882957')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt

  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" $pkgname/settings.yml
  
  # https://github.com/searx/searx/pull/2108
  patch -Np1 < ../py39_is_alive.patch
  # https://github.com/searx/searx/pull/2236
  patch -Np1 < ../google_fix.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  python setup.py install --root="$pkgdir" --optimize=1

  mv "${pkgdir}${_site_packages}"/{README.rst,requirements*,searx}

  mkdir -p "$pkgdir/etc/$pkgname"
  mv "${pkgdir}${_site_packages}/$pkgname/settings.yml" $pkgdir/etc/$pkgname/
  ln -s /etc/$pkgname/settings.yml "${pkgdir}${_site_packages}/$pkgname/settings.yml"

  install -Dm644 "${srcdir}/searx.sysusers" "${pkgdir}/usr/lib/sysusers.d/searx.conf"
  install -Dm644 "${srcdir}/searx.ini" "${pkgdir}/etc/uwsgi/searx.ini"
}
