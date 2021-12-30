# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
pkgver=1.0.0+r1351+gccff1138
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searxng.github.io/searxng/"
license=('AGPL')
makedepends=('openssl')
depends=(
        'uwsgi-fix'
        'uwsgi-fix-plugin-python'
        'python-certifi'
        'python-flask'
        'python-flask-babel'        
        'python-lxml'
        'python-pygments'
        'python-dateutil'        
        'python-yaml'
        'python-h2'
        'python-httpx-socks'
        'python-async-timeout'
        'python-langdetect'
	'python-uvloop'
        'python-setproctitle'
	'python-brotli')
conflicts=('searx' 'searx-git')
backup=('etc/searxng/settings.yml' 'etc/uwsgi/vassals/searxng.ini')
source=(git+https://github.com/dalf/searxng#branch=test-uwsgi
        'searxng.ini'
        'searxng.sysusers')
sha512sums=('SKIP'
            '02df6bda09ee03bf4782824db0e3420732a0b2dc41b96376141069f795db8c8482ee3a7dbf03685ebe4383f0df6bed6dad6a05350ddbe3ef2edf37e07fe74023'
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
  sed -ie   "s/ultrasecretkey\"  # change this\!/`openssl rand -hex 32`\"/g" searx/settings.yml
}

package() {
  cd "$srcdir/searxng"
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  python setup.py install --root="$pkgdir" --optimize=1

  mv "${pkgdir}${_site_packages}"/{README.rst,requirements*,searx}

  mkdir -p "$pkgdir/etc/searxng"
  mv "${pkgdir}${_site_packages}/searx/settings.yml" $pkgdir/etc/searxng/
  ln -s /etc/searxng/settings.yml "${pkgdir}${_site_packages}/searx/settings.yml"

  install -Dm644 "${srcdir}/searxng.sysusers" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "${srcdir}/searxng.ini" "${pkgdir}/etc/uwsgi/vassals/searxng.ini"
}
