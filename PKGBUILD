# Maintainer: dreieck

_pkgname=swallow
pkgname="${_pkgname}-git"
pkgver=0.1.r0.g25525ed
pkgrel=1
pkgdesc="Buffer all of stdin until EOF, then dump to stdout."
arch=('i686' 'x86_64' 'arm' 'arm64')
url="https://github.com/pepaslabs/swallow"
license=('MIT')
depends=()
makedepends=(
  "markdown"
  "python-html2text"
)

provides=(
  "${_pkgname}=${pkgver}"
)
replaces=(
  "${_pkgname}<=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

_giturl="https://github.com/pepaslabs/swallow.git"

source=(
  "${_pkgname}::git+${_giturl}"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  _ver="$(git describe --tags | sed 's|^v||g' | tr '-' '.')"
  # _rev="g$(git log | head -n 1 | awk -F' ' '{print $2}' | head -c 7)"
  _rev="$(git describe --tags --long | sed 's|^v||g' | sed "s|^${_ver}||g" | sed 's|^-||g' | tr '-' '.')"
  
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
  
  echo "${_ver}.r${_rev}"
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

  _gcc="gcc"
  _gccflags="${CFLAGS}"
  _gccout="swallow"
  _gccin="swallow.c"

  _gccopts="${CFLAGS} -o ${_gccout} ${_gccin}"
  _gcccmd="${_gcc} ${_gccopts}"

  _markdowncmd="markdown README.md | html2text -b 158 --no-wrap-links --protect-links --links-after-para --unicode-snob --no-skip-internal-links > README.txt"

  echo "${_gcccmd}"

  ${_gcccmd}

  echo "${_markdowncmd}"
  ### Convert the README from markdown to ASCII.
  ### One could use pandoc directly, but it is over 40 MiB big:
  # pandoc -f markdown -o README.txt README.md
  ### So, we use a chain of markdown (makes HTML) and then html2text (makes text):
  sh -c "${_markdowncmd}"

}

package() {
  _unpackeddir="${srcdir}/${_pkgname}"
  cd "${_unpackeddir}"
  
  install -D -m 755 swallow "${pkgdir}/usr/bin/${_pkgname}"
  
  install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -D -m 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m 644 website.url "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
}
