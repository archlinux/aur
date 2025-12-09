# Maintainer: 30p87 <aur@30p87.de>
# Based on: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-uwsgi
_pkgname=searxng
pkgver=r9120.b719d55
pkgrel=1
pkgdesc='A privacy-respecting, hackable metasearch engine'
arch=('any')
url='https://searxng.github.io/searxng/'
license=('AGPL-3.0-or-later')
makedepends=('openssl' 'git')
depends=('uwsgi' 'uwsgi-plugin-python' 'valkey')
provides=('searxng')
conflicts=('searx' 'searx-git' 'searxng-git')
backup=('etc/searxng/settings.yml' 'etc/uwsgi/searxng.ini')
_giturl='https://github.com/searxng/searxng'
source=("git+${_giturl}#branch=master"
		'nginx.example.conf'
        'uwsgi.ini'
        'sysusers.conf'
		'tmpfiles.conf'
        'settings.yml')
b2sums=('SKIP'
        '5cf35a3ac9607af203f8bb5e396012fd9bacf90becd3fffabc2a4985f10b020baf34bc403d8658779905db8ad53be2ef482b61a2680847bc032c6a707347a256'
        '1e0d47abdd97fc7df82a933c39ede68af384a06e48b4376d34e23cf79b17b9f51febdc563875102f5f230d1d03c5f2d1480e44ccbbd0330d754b8d6cd5e25929'
        '3487c220d6c538dba60671aaaf0927746d8ede4d47f901e01542efdf74dc067ade3d3ee30b500f08d3ef00c2ceba460961e0f4329a4afc32b83e42d8761d5e41'
        '65f66920c96dfd8d68570fb48adb4f74894f188d2a71b1b9214372b43d4b34ab029404ea2eeb3709cce190276d375a2a816e5b7fc3b39210b447337c361bb8d9'
        '99bb7a7dfdab65a8844beb7dd4924601e2f9e85aacacc526a18881dc53e1fa270ff2653c5ada2ce0f92ecebac8917afa974116c09b3e61977b21d70b0f6a4d37')

pkgver() {
  cd searxng
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m venv venv
  source venv/bin/activate
  pip install --upgrade pip build installer wheel setuptools

  pip install -r requirements.txt

  export SEARXNG_SETTINGS_PATH='../settings.yml'
  python -m searx.version freeze
  sed -i "s|GIT_URL =.*|GIT_URL = \"${_giturl}\"|g" searx/version_frozen.py
  sed -i "s|GIT_BRANCH =.*|GIT_BRANCH = \"${_gitbranch}\"|g" searx/version_frozen.py
  
  # Build the package
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  source venv/bin/activate

  local _site_packages="$(python -c 'import site, os; print(os.path.relpath(site.getsitepackages()[0]))')"

  # Install package
  python -m installer dist/*.whl

  # Update the venv path
  pip install virtualenv-tools4
  cd venv
  virtualenv-tools --update-path /var/lib/searxng/venv/
  sed -i "s|$(pwd)|/var/lib/searxng/venv/|g" bin/* pyvenv.cfg

  # Copy the venv directory
  install -d -m 750 "${pkgdir}/var/lib/searxng/venv"
  cp -r . "${pkgdir}/var/lib/searxng/venv"
  ln -s "/var/lib/searxng/venv/lib/$(basename ${pkgdir}/var/lib/searxng/venv/lib/python3.*)/site-packages/searx/static" "${pkgdir}/var/lib/searxng/static"


  install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/etc/uwsgi/searxng.ini"
  install -dm750 "${pkgdir}/etc/searxng"
  install -Dm640 "${srcdir}/settings.yml" "${pkgdir}/etc/searxng/settings.yml" 
  install -Dm640 "${srcdir}/searxng/searx/limiter.toml" "${pkgdir}/etc/searxng/limiter.toml"
  install -dm750 "${pkgdir}/var/lib/searxng"
  install -Dm640 "${srcdir}/searxng/searx/version_frozen.py" "${pkgdir}/var/lib/searxng/${_site_packages}/searx/version_frozen.py"
  install -Dm644 "${srcdir}/searxng/LICENSE" "${pkgdir}/usr/share/licenses/searxng/LICENSE"
  install -Dm644 "${srcdir}/nginx.example.conf" "${pkgdir}/usr/share/doc/searxng/nginx.example.conf"

  install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/searxng.conf"
}
