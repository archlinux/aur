# Maintainer: 30p87 <aur@30p87.de>
# Based on: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-uwsgi-novenv-git
_pkgname=searxng
pkgver=r9209.b5bb27f
pkgrel=1
pkgdesc='A privacy-respecting, hackable metasearch engine'
arch=('any')
url='https://searxng.github.io/searxng/'
license=('AGPL-3.0-or-later')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('uwsgi' 'uwsgi-plugin-python' 'valkey' 'python-certifi' 'python-babel' 'python-flask-babel' 'python-flask' 'python-lxml' 'python-pygments' 'python-dateutil' 'python-sniffio' 'valkey' 'python-markdown-it-py' 'python-tomli' 'python-msgspec' 'python-isodate' 'python-whitenoise' 'python-jinja' 'python-yaml' 'python-fasttext-predict' 'python-typer' 'python-typing_extensions' 'python-httpx' 'python-httpx-socks' 'python-valkey-git' 'python-h2' 'python-cloudscraper')
provides=('searxng')
conflicts=('searx' 'searx-git' 'searxng-git' 'searxng-uwsgi' 'searxng-uwsgi-git')
backup=('etc/searxng/settings.yml' 'etc/searxng/limiter.toml' 'etc/uwsgi/searxng.ini')
_giturl='https://github.com/searxng/searxng'
_gitbranch='master'
source=("git+${_giturl}#branch=${_gitbranch}"
		'nginx.example.conf'
        'uwsgi.ini'
        'sysusers.conf'
		'tmpfiles.conf'
        'settings.yml')
b2sums=('SKIP'
        '5cf35a3ac9607af203f8bb5e396012fd9bacf90becd3fffabc2a4985f10b020baf34bc403d8658779905db8ad53be2ef482b61a2680847bc032c6a707347a256'
        'b52349a2cc4b60e8658cfb30ba59e4ff03f0ec0e022576c696faf7fa069589dbe48abb5b06259a079d35aacf5f33dee47df10e61dcc27b1047952301dd6395a6'
        '3487c220d6c538dba60671aaaf0927746d8ede4d47f901e01542efdf74dc067ade3d3ee30b500f08d3ef00c2ceba460961e0f4329a4afc32b83e42d8761d5e41'
        '65f66920c96dfd8d68570fb48adb4f74894f188d2a71b1b9214372b43d4b34ab029404ea2eeb3709cce190276d375a2a816e5b7fc3b39210b447337c361bb8d9'
        '99bb7a7dfdab65a8844beb7dd4924601e2f9e85aacacc526a18881dc53e1fa270ff2653c5ada2ce0f92ecebac8917afa974116c09b3e61977b21d70b0f6a4d37')

pkgver() {
  cd searxng
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  export SEARXNG_SETTINGS_PATH='../settings.yml'
  python -m searx.version freeze
  sed -i "s|GIT_URL =.*|GIT_URL = \"${_giturl}\"|g" searx/version_frozen.py
  sed -i "s|GIT_BRANCH =.*|GIT_BRANCH = \"${_gitbranch}\"|g" searx/version_frozen.py
  
  # Build the package
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  local site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  # Install package
  python -m installer --destdir "${pkgdir}" dist/*.whl

  install -Dm644 "${srcdir}/uwsgi.ini" "${pkgdir}/etc/uwsgi/searxng.ini"
  install -dm750 "${pkgdir}/etc/searxng"
  install -Dm640 "${srcdir}/settings.yml" "${pkgdir}/etc/searxng/settings.yml" 
  install -Dm640 "${srcdir}/searxng/searx/limiter.toml" "${pkgdir}/etc/searxng/limiter.toml"
  install -dm750 "${pkgdir}/var/lib/searxng"
  ln -s "${site_packages}/searx/static" "${pkgdir}/var/lib/searxng/static"
  install -Dm640 "${srcdir}/searxng/searx/version_frozen.py" "${pkgdir}/var/lib/searxng/${site_packages}/searx/version_frozen.py"
  install -Dm644 "${srcdir}/searxng/LICENSE" "${pkgdir}/usr/share/licenses/searxng/LICENSE"
  install -Dm644 "${srcdir}/nginx.example.conf" "${pkgdir}/usr/share/doc/searxng/nginx.example.conf"

  install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/searxng.conf"
}
