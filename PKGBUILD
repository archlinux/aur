# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
pkgver=1.0.0+r1351+gccff1138
pkgrel=2
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
_giturl="https://github.com/dalf/searxng"
_gitbranch="test-uwsgi"
source=(git+$_giturl#branch=$_gitbranch
        'searxng.ini'
        'searxng.sysusers')
sha512sums=('SKIP'
            'fd81a9b8eb36a32c031ce082176ec3a44f266e2f6ffc4218ce19e87353c4441ca7e252e8487d7a339eb084130157bc6c705eb4d2064605589f42e410d4eb8fb8'
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
  python -m searx.version freeze
  sed -i "s|GIT_URL =.*|GIT_URL = \"${_giturl}\"|g" searx/version_frozen.py
  sed -i "s|GIT_BRANCH =.*|GIT_BRANCH = \"${_gitbranch}\"|g" searx/version_frozen.py

  mv "${pkgdir}${_site_packages}"/{README.rst,requirements*,searx}

  mkdir -p "$pkgdir/etc/searxng"
  mv "${pkgdir}${_site_packages}/searx/settings.yml" $pkgdir/etc/searxng/
  ln -s /etc/searxng/settings.yml "${pkgdir}${_site_packages}/searx/settings.yml"

  install -Dm644 "${srcdir}/searxng.sysusers" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "${srcdir}/searxng.ini" "${pkgdir}/etc/uwsgi/vassals/searxng.ini" 
  install -Dm644 "${srcdir}/searxng/searx/version_frozen.py" "${pkgdir}${_site_packages}/searx"
}
