# Maintainer:
# Contributor: Ke Liu <spcter119@gmail.com>

_module="efb-wechat-slave"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=2.0.7.r2.g80dadf2
pkgrel=1
pkgdesc='EFB WeChat Slave, a channel for EH Forwarder Bot'
url='https://github.com/blueset/efb-wechat-slave'
license=('AGPL-3.0-or-later')
arch=('any')

depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation

  cd "build/lib/${_module//-/_}/locale/"
  for _locale in [a-z][a-z]*; do
    (cd "$_locale/LC_MESSAGES/"; msgfmt "${_module//-/_}.po" -o "${_module//-/_}.mo")
  done
}

package() {
  depends+=(
    'bpython'
    'ipython'
    'python-cjkwrap'
    'python-future'
    'python-httplib2'
    'python-magic'
    'python-pillow'
    'python-pyqrcode'
    'python-requests'
    'python-ruamel-yaml'
    'python-typing_extensions'
    'python-wxpython'
    'python-yaml'

    # AUR
    'python-bullet'
    'python-ehforwarderbot'
    'python-itchat'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

