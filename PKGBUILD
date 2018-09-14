# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: mrxx <mrxx at cyberhome dot at>

set -u
pkgname="teleconsole-git"
pkgver=0.4.0.r2.g09591f2
pkgrel=1
pkgdesc='Command line tool to share your UNIX terminal and forward local TCP ports to people you trust.'
arch=('i686' 'x86_64')
url='https://github.com/gravitational/teleconsole/'
license=('Apache')
makedepends=('go' 'git')
# The published .tar.gz sources do not build. The build system only works with git downloads
_srcs=('teleconsole' 'teleport')
source=(
  "git+https://github.com/gravitational/teleconsole.git"
  "git+https://github.com/gravitational/teleport.git"
)
sha256sums=('SKIP'
            'SKIP')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}
else
  source[0]+="#tag=${pkgver}"
fi

_GOLOCAL='local _GOPATH _GOSRC _GOMAIN'
_set_gopath() {
  _GOPATH="${srcdir}/go"
  _GOSRC="${_GOPATH}/src/github.com/gravitational"
  _GOMAIN="${_GOSRC}/teleconsole"
}

prepare() {
  set -u
  eval "${_GOLOCAL}"; _set_gopath
  mkdir -p "${_GOSRC}"
  local _f
  for _f in "${_srcs[@]}"; do
    ln -rTs "${_f}" "${_GOSRC}/${_f}"
  done
  set +u
}

build() {
  set -u
  eval "${_GOLOCAL}"; _set_gopath
  cd "${_GOMAIN}"
  GOPATH="${_GOPATH}" \
  make
  set +u
}

package() {
  set -u
  eval "${_GOLOCAL}"; _set_gopath
  cd "${_GOMAIN}"
  install -Dpm755 "out/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
  install -Dpm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
