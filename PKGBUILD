# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
pkgver=1.0.0+r848+g919674d5
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searxng.github.io/searxng/"
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
conflicts=('searx' 'searx-git')
backup=('etc/searxng/settings.yml' 'etc/uwsgi/vassals/searxng.ini')
source=(git+https://github.com/HLFH/searxng
        'searxng.ini'
        'searxng.sysusers')
sha512sums=('SKIP'
            'ada53a1cdecfa87d4d1bbe056a5572a914a08bd7548947893452b4b08733756dfb2597c4c48430918a8dd60504c7bb145de5adf50c48e9c7cc52d8ac37d830ec'
            'af9a4539f0b6949ec504068f28232553547804a49bb588a1fff75ad612196e3722c097f076bb3b4b1f1cf905d01f8915ed2af73d7e1b08bbdbad06dba41e8ea7')            

pkgver() {
  cd searxng
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

prepare() {
  cd "$srcdir/searxng"

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt

  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" searxng/settings.yml
}

package() {
  cd "$srcdir/searxng"
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  python setup.py install --root="$pkgdir" --optimize=1

  mv "${pkgdir}${_site_packages}"/{README.rst,requirements*,searxng}

  mkdir -p "$pkgdir/etc/searxng"
  mv "${pkgdir}${_site_packages}/searxng/settings.yml" $pkgdir/etc/searxng/
  ln -s /etc/searxng/settings.yml "${pkgdir}${_site_packages}/searxng/settings.yml"

  install -Dm644 "${srcdir}/searxng.sysusers" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "${srcdir}/searxng.ini" "${pkgdir}/etc/uwsgi/vassals/searxng.ini"
}
