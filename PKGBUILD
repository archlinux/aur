# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searx-git
pkgver=1.0.0+r297+gf2f72575
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine (python(3) based)"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=(
        'uwsgi-ng'
        'uwsgi-ng-plugin-python'
        'python-certifi'
        'python-flask'
        'python-flask-babel'        
        'python-lxml'
        'python-pygments'
        'python-dateutil'        
        'python-yaml'
        'python-httpx-socks'
	'python-h2'
        'python-pysocks'
        'python-langdetect')
conflicts=('searx' 'searxng-git')
backup=('etc/searx/settings.yml' 'etc/uwsgi/vassals/searx.ini')
source=(git+https://github.com/asciimoo/searx
        'searx.ini'
        'searx.sysusers')
sha512sums=('SKIP'
            '6e1e7771e747e2bcb9cbc3e5ec9735461b6d791c0c0412e06e7dd802c18625edd0916de32164bf780c18ef7b6a87f55ed1e917377b3adb2bf53c0344f34b49e8'
            '6856e26451fe053d37c2ce4b9d5f3b35891dd8ec702c5256c02d04415124c57705abc497f12943948a85621bb0238d26c2c1f3a7bf42404a6ff1487c7655909e')

pkgver() {
  cd searx
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

prepare() {
  cd "$srcdir/searx"

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt

  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" searx/settings.yml
}

package() {
  cd "$srcdir/searx"
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  python setup.py install --root="$pkgdir" --optimize=1

  mv "${pkgdir}${_site_packages}"/{README.rst,requirements*,searx}

  mkdir -p "$pkgdir/etc/searx"
  mv "${pkgdir}${_site_packages}/searx/settings.yml" $pkgdir/etc/searx/
  ln -s /etc/searx/settings.yml "${pkgdir}${_site_packages}/searx/settings.yml"

  install -Dm644 "${srcdir}/searx.sysusers" "${pkgdir}/usr/lib/sysusers.d/searx.conf"
  install -Dm644 "${srcdir}/searx.ini" "${pkgdir}/etc/uwsgi/vassals/searx.ini"
}
