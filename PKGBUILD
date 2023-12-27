# Maintainer:
# Contributor: Ke Liu <spcter119@gmail.com>

_module="efb-telegram-master"
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=2.3.0.r2.g0850aeb
pkgrel=1
pkgdesc='EFB Telegram Master, a channel for EH Forwarder Bot'
url='https://github.com/blueset/efb-telegram-master'
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

provides=("$_pkgname=${pkgver%%.r*}")
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
    'python-cjkwrap'
    'python-humanize'
    'python-magic'
    'python-peewee'
    'python-pillow'
    'python-python-socks'
    'python-retrying'
    'python-ruamel-yaml'
    'python-typing_extensions'

    # AUR
    'python-bullet'
    'python-ehforwarderbot'
    'python-ffmpeg-python'
    'python-language-tags'
    'python-lottie'
    'python-pydub'
    'python-telegram-bot'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
