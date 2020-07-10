# Maintainer: Jake <aur@ja-ke.tech>

pkgname=searx
pkgver=0.17.0
pkgrel=1
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
        'searx.sysusers')
sha512sums=('4a6a31c36de4b25bb3234b72cd35cb8c8a63881538958dcae080cf18311bee47cd3324c8a9aebeaf410adde0dcdc97bf1054ec837ced20335174071a18d27046'
            '6e1e7771e747e2bcb9cbc3e5ec9735461b6d791c0c0412e06e7dd802c18625edd0916de32164bf780c18ef7b6a87f55ed1e917377b3adb2bf53c0344f34b49e8'
            '6856e26451fe053d37c2ce4b9d5f3b35891dd8ec702c5256c02d04415124c57705abc497f12943948a85621bb0238d26c2c1f3a7bf42404a6ff1487c7655909e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt

  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" $pkgname/settings.yml
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
