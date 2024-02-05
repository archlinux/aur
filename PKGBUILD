# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

_opt_python=0

_opt_debug=0

#_opt_git='#commit=f3434b9050076987d906a6516c31922ab0026fcc' # release 0.7 Segmentation fault

set -u
pkgname='usbrelay'
#pkgname+='-git'
pkgver=1.2.1
pkgrel=1
pkgdesc='Control usb relay - based on hidapi'
arch=('i686' 'x86_64')
url='https://github.com/darrylb123/usbrelay'
license=('GPL-2.0-or-later')
depends=('hidapi' 'glibc')
#options=('!strip')
_srcdir="${pkgname}-${pkgver%%.r*}"
if [ "${pkgver}" = '0.6' ]; then
  _srcdir="${pkgname}-0-6"
fi
source=("${_srcdir}.tar.gz::${url}/archive/${pkgver%%.r*}.tar.gz")
md5sums=('1efbc56dba38782a885ef4745d0d8d40')
sha256sums=('04b1e0ac58cbe968812ae6a0ced77177869463e1fae9b4fbb4cdebdd73005680')

if [ "${_opt_python}" -ne 0 ]; then
  depends+=('python3')
fi

if [ "${pkgname%-git}" != "${pkgname}" ] || [ ! -z "${_opt_git:-}" ]; then
  _srcdir="${pkgname%-git}"
  source[0]="${url//https/git}.git${_opt_git}"
  makedepends+=('git')
  if [ "${pkgname%-git}" != "${pkgname}" ]; then
    md5sums[0]='SKIP'
    sha256sums[0]='SKIP'
    provides=("${pkgname%-git}=${pkgver%%.r*}")
    conflicts=("${pkgname%-git}")
  fi
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
  set +u
}
elif [ "${pkgver%%.r*}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${pkgver%%.r*}"
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  sed -e 's:/lib64:/lib:g' \
      -e '#/setup.py install/ s:$: --prefix=/usr --root=$(DESTDIR) --optimize=1:g' \
    -i 'Makefile.in'
  make clean
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ "${_opt_debug}" -ne 0 ]; then
    CFLAGS+=' -g -rdynamic'
  fi
  if [ "$(vercmp "${pkgver}" '0.5')" -eq 0 ]; then
    LDFLAGS="${LDFLAGS//,--as-needed/}"
  fi
  if [ "${_opt_python}" -eq 0 ]; then
    make
  else
    CFLAGS+=" $(python-config --includes)"
    make 'python'
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ "${_opt_python}" -eq 0 ]; then
    make DESTDIR="${pkgdir}/" install
  else
    make 'install_py' DESTDIR="${pkgdir}/" install
  fi
  set +u
}
set +u
