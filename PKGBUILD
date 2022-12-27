# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
pkgver=1.0.0+r2737+g966e9c3c
pkgrel=2
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searxng.github.io/searxng/"
license=('AGPL')
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
        'python-langdetect'
        'python-fasttext-predict'
        'python-setproctitle'
        'python-redis'
        'python-markdown-it-py'
        'python-typing_extensions')
optdepends=('python-hiredis')
conflicts=('searx' 'searx-git')
backup=('etc/searxng/settings.yml' 'etc/uwsgi/vassals/searxng.ini')
_giturl="https://github.com/searxng/searxng"
_gitbranch="master"
source=(git+$_giturl#branch=$_gitbranch
        'searxng.ini'
        'searxng.sysusers'
        'settings.yml')
sha512sums=('SKIP'
            'fd81a9b8eb36a32c031ce082176ec3a44f266e2f6ffc4218ce19e87353c4441ca7e252e8487d7a339eb084130157bc6c705eb4d2064605589f42e410d4eb8fb8'
            'af9a4539f0b6949ec504068f28232553547804a49bb588a1fff75ad612196e3722c097f076bb3b4b1f1cf905d01f8915ed2af73d7e1b08bbdbad06dba41e8ea7'
            '9aa470d0be0e943d1d49c30eba91ee141a847106eecfb3278f66ff6ca73527069820faf3792630a217dc9a30df56d65a40e569ebd9661f5f0478dffc50c26c0d')            

pkgver() {
  cd searxng
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
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
  install -Dm644 "${srcdir}/searxng/searx/version_frozen.py" "${pkgdir}${_site_packages}/searx"
}
