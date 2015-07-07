# Maintainer: Vincent Petithory <vincent.petithory at gmail dot com>

pkgname=kraken-git
pkgver=r70.2c5f7ce
pkgrel=1
pkgdesc='File sharing with HTTP servers.'
arch=('x86_64' 'i686' 'ARM')
url='https://github.com/vincent-petithory/kraken'
license=('MIT')
makedepends=('go' 'git')
depends=()
options=('!strip' '!emptydirs')
source=('git+https://github.com/vincent-petithory/kraken.git')
md5sums=('SKIP')
_gourl='github.com/vincent-petithory/kraken'

pkgver() {
  cd "$srcdir/kraken"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  p="${srcdir}/src/${_gourl}"
  if [ -d "${p}/.git" ]; then
    git --git-dir="${p}/.git" --work-tree="$p" remote set-url origin "file://${srcdir}/kraken"
    git --git-dir="${p}/.git" --work-tree="$p" pull origin
  else
    git clone file://"${srcdir}/kraken" "${p}"
  fi
  export GOPATH="$srcdir"
  go get -v "${_gourl}/..."
  go install "${_gourl}/..."
}

package() {
  install -D -m755 "${srcdir}/bin/krakend" "${pkgdir}/usr/bin/krakend"
  install -D -m755 "${srcdir}/bin/krakenctl" "${pkgdir}/usr/bin/krakenctl"
  install -D -m644 "${srcdir}/src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
