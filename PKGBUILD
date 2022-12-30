# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searx-git
pkgver=1.0.0.r465.g52a21d11
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
b2sums=('SKIP'
        '3463bd12fae80990780d0173480d5d9bcb0f90aa53378c52acb30a5baa9af0566545c5a661c512781ea2c1693e2c36516bb634bd780dc2b17a630aa925931dbb'
        '8fceb5a744d6100e3ecf2df716cead8480f25405f20a0518863ce36191a79b11d5e3e670da9ad00a56c1598a41687ec1612c9cadf51fab1356507b26b941daae')

pkgver() {
  cd searx
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
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
