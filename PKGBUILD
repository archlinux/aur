# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: FFY00 <filipe.lains@gmail.com>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy-git
pkgver=10.1.5.r2.gd72b92bdf
pkgrel=1
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=('any')
url="https://mitmproxy.org/"
license=('MIT')
depends=(
  'python-aioquic'
  'python-asgiref'
  'python-blinker'
  'python-brotli'
  'python-certifi'
  'python-cryptography'
  'python-flask'
  'python-h11'
  'python-h2'
  'python-hyperframe'
  'python-kaitaistruct'
  'python-ldap3'
  'python-mitmproxy-rs'
  'python-msgpack'
  'python-passlib'
  'python-protobuf'
  'python-psutil'
  'python-publicsuffix2'
  'python-pylsqpack'
  'python-pyopenssl'
  'python-pyparsing'
  'python-pyperclip'
  'python-requests'
  'python-ruamel-yaml'
  'python-sortedcontainers'
  'python-tornado'
  'python-typing_extensions'
  'python-urwid'
  'python-werkzeug'
  'python-wsproto'
  'python-zstandard'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=(
  'python-asynctest'
  'python-hypothesis'
  'python-parver'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-runner'
  'python-pytest-timeout'
  'python-tox-current-env'
)
conflicts=('mitmproxy')
provides=('mitmproxy')
source=("git+https://github.com/mitmproxy/mitmproxy.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=test_dir dist/*.whl

  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" tox -e py --current-env
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
