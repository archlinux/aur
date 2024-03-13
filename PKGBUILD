# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
pkgver=1.0.0.r3631.g7c80807bb
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searxng.github.io/searxng/"
license=('AGPL3')
makedepends=('openssl' 'git')
depends=(
        'uwsgi'
        'uwsgi-plugin-python'
        'python-certifi'
        'python-babel'
        'python-flask-babel'
        'python-flask'
        'python-jinja'       
        'python-lxml'
        'python-pygments'
        'python-dateutil'        
        'python-yaml'
        'python-httpx'
        'python-h2'
        'python-brotli'
	'python-uvloop'
        'python-httpx-socks'
        'python-async-timeout'
        'python-fasttext-predict'
        'python-setproctitle'
        'python-redis'
        'python-markdown-it-py'
        'python-typing_extensions'
        'python-pytomlpp')
optdepends=('python-hiredis')
provides=('searxng')
conflicts=('searx' 'searx-git')
backup=('etc/searxng/settings.yml' 'etc/uwsgi/vassals/searxng.ini')
_giturl="https://github.com/searxng/searxng"
_gitbranch="master"
source=(git+$_giturl#branch=$_gitbranch
        'searxng.ini'
        'searxng.sysusers'
        'settings.yml')
b2sums=('SKIP'
        'd6d65d00851c5504657e992d8ff44996652d56a8f0030f9fc565650c814b9ca24e060ebb461d8fcaa447bfbe6fda0fb01afdbc909b262ed15e0033809fb35fd7'
        'becbc7783e484d15de32973b9376014b1bf2ba9494bb0fa65d08a9725715d2170c694a529038059ebc6b42969641d8c3cf02235355fbc3a45b02d28fdf0d6392'
        'df61197eebe379e3cbfa93c4093a5b0a8767fdc5fa22537b3b226fde5ebed62aca6ae98f3d6f7e2dd7867ea928ca4785033d3b9a20785b506f670dbc8d880b17')

pkgver() {
  cd searxng
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

prepare() {
  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" "$srcdir/searxng/requirements.txt"

  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\"  # change this\!/`openssl rand -hex 32`\"/g" "$srcdir/settings.yml"
}

package() {
  cd "$srcdir/searxng"
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  python setup.py install --root="$pkgdir" --optimize=1
  python -m searx.version freeze
  sed -i "s|GIT_URL =.*|GIT_URL = \"${_giturl}\"|g" searx/version_frozen.py
  sed -i "s|GIT_BRANCH =.*|GIT_BRANCH = \"${_gitbranch}\"|g" searx/version_frozen.py

  mv "${pkgdir}${_site_packages}"/{README.rst,requirements*,searx}

  mkdir -p "$pkgdir/etc/searxng"

  install -Dm644 "${srcdir}/searxng.sysusers" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "${srcdir}/searxng.ini" "${pkgdir}/etc/uwsgi/vassals/searxng.ini"
  install -Dm644 "${srcdir}/settings.yml" "${pkgdir}/etc/searxng/settings.yml" 
  install -Dm644 "${srcdir}/searxng/searx/limiter.toml" "${pkgdir}/etc/searxng/limiter.toml"
  install -Dm644 "${srcdir}/searxng/searx/version_frozen.py" "${pkgdir}${_site_packages}/searx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/searxng/LICENSE"
}
