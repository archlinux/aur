# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=searxng-git
_pkgname=searxng
pkgver=r9110.3f91ac4
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://searxng.github.io/searxng/"
license=('AGPL-3.0-or-later')
makedepends=('openssl' 'git' 'python-build' 'python-wheel' 'python-setuptools'  'python-msgspec')
depends=('valkey')
provides=('searxng')
conflicts=('searx' 'searx-git')
backup=('etc/searxng/settings.yml')
_giturl="https://github.com/searxng/searxng"
_gitbranch="master"
source=(git+$_giturl#branch=$_gitbranch
        'settings.yml'
	'searxng.sysusers'
        'searxng.tmpfiles'
	'searxng.service'
        'searxng.example.com.conf')
b2sums=('SKIP'
        '99bb7a7dfdab65a8844beb7dd4924601e2f9e85aacacc526a18881dc53e1fa270ff2653c5ada2ce0f92ecebac8917afa974116c09b3e61977b21d70b0f6a4d37'
        '3487c220d6c538dba60671aaaf0927746d8ede4d47f901e01542efdf74dc067ade3d3ee30b500f08d3ef00c2ceba460961e0f4329a4afc32b83e42d8761d5e41'
        '44696a2b6b297d74fe5345ad7f15d35d48ad2290dbf778947d24b91233bafe153649f7ad359c2dd360693904ba60e9e0f8473e521267fdd45dd3730ad163a9c6'
        '464102aaefd3d5e773eb81ed6765d39e68673813d52d29b8efbc46ea2476978c2168d0f137137356227961bbc8a8588be5e84de5cc068119fb682f1dcd4fc16f'
        '42770623904a4df7268a228d96da622a3060cfb51f74273fffafa18bea687401d742660c3dfd2d5305ddcdb978460ea2638e1a90964fdeebc443a1df99f09274')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname

  # generate a random secret key
  sed -i -e "s/ultrasecretkey\"  # change this\!/`openssl rand -hex 32`\"/g" "../settings.yml"

  export SEARXNG_SETTINGS_PATH="../settings.yml"
  python -m searx.version freeze
  sed -i "s|GIT_URL =.*|GIT_URL = \"${_giturl}\"|g" searx/version_frozen.py
  sed -i "s|GIT_BRANCH =.*|GIT_BRANCH = \"${_gitbranch}\"|g" searx/version_frozen.py
  
  # generate the wheel using the system python-build
  python -m build --no-isolation --wheel
}

package() {
  cd $_pkgname

  # create virtual environment
  export PIP_DISABLE_PIP_VERSION_CHECK=1
  export PYTHONDONTWRITEBYTECODE=1
  python -m venv "$pkgdir/var/lib/searxng/venv/"
  source "$pkgdir/var/lib/searxng/venv/bin/activate"
  
  # install searxng and dependencies using pip
  "$pkgdir/var/lib/searxng/venv/bin/pip" install --upgrade pip installer
  "$pkgdir/var/lib/searxng/venv/bin/pip" install -r "requirements.txt"
  "$pkgdir/var/lib/searxng/venv/bin/python" -m installer dist/*.whl

  # remove references to pkgdir
  find "$pkgdir/var/lib/searxng/venv/bin" -maxdepth 1 -type f -exec sed -i "s|${pkgdir}/|/|g" {} +
  find "$pkgdir/var/lib/searxng/venv/pyvenv.cfg" -maxdepth 1 -type f -exec sed -i "s|${pkgdir}/|/|g" {} +
  find "$pkgdir/var/lib/searxng/venv" -type f -name "*.py[co]" -delete
  find "$pkgdir/var/lib/searxng/venv" -type d -name "__pycache__" -delete 

  local _site_packages="$(python -c 'import site, os; print(os.path.relpath(site.getsitepackages()[0]))')"

  # exit virtual environment
  deactivate

  # executable
  install -d "$pkgdir/usr/bin"
  ln -s "/var/lib/searxng/venv/bin/searxng-run" "$pkgdir/usr/bin/searxng-run"

  # configuration files
  install -Dm644 "${srcdir}/settings.yml" "${pkgdir}/etc/searxng/settings.yml" 
  install -Dm644 "searx/limiter.toml" "${pkgdir}/etc/searxng/limiter.toml"
  install -Dm644 "searx/version_frozen.py" "${pkgdir}/var/lib/searxng/${_site_packages}/searx/version_frozen.py"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/searxng/LICENSE"
  install -Dm644 "${srcdir}/searxng.sysusers" "${pkgdir}/usr/lib/sysusers.d/searxng.conf"
  install -Dm644 "$srcdir/searxng.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/searxng.conf"
  install -Dm644 "${srcdir}/searxng.service" "${pkgdir}/usr/lib/systemd/system/searxng.service"

  # clean build
  rm -rf "$srcdir/$_pkgname"
}
