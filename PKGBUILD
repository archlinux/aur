# Maintainer: dreieck

_pkgname=pingfs
pkgname="${_pkgname}-git"
epoch=1
pkgver=r83.d20200524.gf2f2b5f
pkgrel=1
pkgdesc="'True cloud storage' -- a fuse filesystem where the data is stored only in the Internet itself, as ICMP Echo packets (pings) travelling from you to remote servers and back again. (Use with care. It's only for hackvalue, not for productive use.)"
arch=('i686' 'x86_64' 'arm' 'arm64')
url="http://code.kryo.se/pingfs/"
license=('custom')
depends=(
  'fuse'
)
makedepends=(
  'git'
)

provides=(
  "${_pkgname}=${pkgver}"
)
replaces=()
conflicts=(
  "${_pkgname}"
)

_giturl="https://github.com/yarrick/pingfs.git"

source=(
  "${_pkgname}::git+${_giturl}"
)

sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' "${url}" > "website.url"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _hash="$(git rev-parse --short HEAD)"
  if [ -z ${_rev} ]; then
    error "Error in ${FUNCNAME[0]}: Git commit count could not be determined."
    return 1
  fi
  printf '%s' "r${_rev}.d${_date}.g${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m 755 pingfs "${pkgdir}/usr/bin/${_pkgname}"

  install -D -m 644 git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -D -m 644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -m 644 website.url "${pkgdir}/usr/share/doc/${_pkgname}/website.url"

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
