# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
_pkgname=searxng
pkgver=r8494.5986629
pkgrel=4
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searxng.github.io/searxng/"
license=('AGPL-3.0-or-later')
makedepends=('openssl' 'git')
depends=('uwsgi'
         'uwsgi-plugin-python'
         'redis')
provides=('searxng')
conflicts=('searx' 'searx-git')
backup=('etc/searxng/settings.yml' 'etc/uwsgi/vassals/searxng.ini')
_giturl="https://github.com/searxng/searxng"
_gitbranch="master"
source=(git+$_giturl#branch=$_gitbranch
        'searxng.ini'
        'searxng.sysusers'
        'searxng.tmpfiles'
        'settings.yml')
b2sums=('SKIP'
        '01513dcd99859884e443e3649dd952e169bec6abb165c8bbea71cb36967c8e6fc8f650b924a0961ae9da1419527739c910f886b66a6400a68aec1d24e18f0ea9'
        'f5b75617441c74366c95cc926d4f94762677b287f6bd4132e536eb35d298b41ce39a8d04672a48ca76b76b649b8c3f3676cf27e3c935db927ed271c5deb7050e'
        '44696a2b6b297d74fe5345ad7f15d35d48ad2290dbf778947d24b91233bafe153649f7ad359c2dd360693904ba60e9e0f8473e521267fdd45dd3730ad163a9c6'
        'dfa3292e007cdc1de6a508cb1b08110515af06fd2c5718b51bde852e9e547c759324b8f004bdb4378a44de6501eea0bdd0a8b9d1fd115d4375cb288a8524dfef')

pkgver() {
  cd searxng
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m venv .venv
  source .venv/bin/activate
  pip install --upgrade pip build installer wheel setuptools

  pip install -r requirements.txt

  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\"  # change this\!/`openssl rand -hex 32`\"/g" "../settings.yml"

  export SEARXNG_SETTINGS_PATH="../settings.yml"
  python -m searx.version freeze
  sed -i "s|GIT_URL =.*|GIT_URL = \"${_giturl}\"|g" searx/version_frozen.py
  sed -i "s|GIT_BRANCH =.*|GIT_BRANCH = \"${_gitbranch}\"|g" searx/version_frozen.py
  
  # Build the package
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  source .venv/bin/activate

  local _site_packages="$(python -c 'import site, os; print(os.path.relpath(site.getsitepackages()[0]))')"

  # Install package
  python -m installer dist/*.whl

  # Update the .venv path
  pip install virtualenv-tools4
  cd .venv
  virtualenv-tools --update-path /var/lib/searxng/.venv/

  # Copy the .venv directory
  rm -rf "bin/__pycache__"
  install -d -m 750 "$pkgdir/var/lib/searxng/.venv"
  cp -r . "$pkgdir/var/lib/searxng/.venv"

  install -Dm644 "${srcdir}/searxng.ini" "${pkgdir}/etc/uwsgi/vassals/searxng.ini"
  install -Dm644 "${srcdir}/settings.yml" "${pkgdir}/etc/searxng/settings.yml" 
  install -Dm644 "${srcdir}/searxng/searx/limiter.toml" "${pkgdir}/etc/searxng/limiter.toml"
  install -Dm644 "${srcdir}/searxng/searx/version_frozen.py" "${pkgdir}/var/lib/searxng/${_site_packages}/searx/version_frozen.py"
  install -Dm644 "${srcdir}/searxng/LICENSE" "${pkgdir}/usr/share/licenses/searxng/LICENSE"

  install -Dm644 "${srcdir}/searxng.sysusers" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "$srcdir/searxng.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/searxng.conf"

  # Clean build
  rm -rf "$srcdir/$_pkgname"
}
