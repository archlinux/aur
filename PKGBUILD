# Maintainer: dreieck

_pkgname=pingfs
pkgname="${_pkgname}-git"
pkgver=20150802.rg9b5de0d
pkgrel=2
pkgdesc="'True cloud storage' -- a fuse filesystem where the data is stored only in the Internet itself, as ICMP Echo packets (pings) travelling from you to remote servers and back again. (Use with care. It's only for hackvalue, not for productive use.)"
arch=('i686' 'x86_64' 'arm' 'arm64')
url="http://code.kryo.se/pingfs/"
license=('other')
depends=(
  'fuse'
)
makedepends=()

provides=(
  "${_pkgname}=${pkgver}"
)
replaces=(
  "${_pkgname}<=${pkgver}"
)
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

pkgver() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  _ver="$(git log --date=iso | head -n 3 | grep -E '^Date:' | awk '{print $2}' | tr -d '-')"
  # _rev="g$(git log | head -n 1 | awk -F' ' '{print $2}' | head -c 7)"
  _rev="$(git log | head -n1 | awk '{print $2}' | head -c7)"
  
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    return 1
  fi
  
  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine SVN revision." > /dev/stderr
    false
    return 1
  fi
  
  echo "${_ver}.rg${_rev}"
}

prepare() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"

  _urlcmd="echo '${url}' > website.url"
  echo "${_urlcmd}"
  sh -c "${_urlcmd}"
}

build() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"

  make

  cat README | tr -d '\a' | tr '\n' '\a' | sed 's|.*\a\(License:.*\)|\1|' | tr '\a' '\n' > LICENSE.txt
}

package() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  install -D -m 755 pingfs "${pkgdir}/usr/bin/${_pkgname}"
  
  install -D -m 644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -m 644 website.url "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
