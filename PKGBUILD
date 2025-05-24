# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-git
pkgver=5.54.0.r0.gb4c1920
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go. Replaces yaylog."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1" "git")
provides=("qp")
conflicts=("qp" "qp-bin")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
source=(
  "qp::git+https://github.com/Zweih/qp.git"
  "news::git+https://github.com/Zweih/qp.git#branch=packaging"
)
sha256sums=("SKIP" "SKIP")

_binaryname="qp"

pkgver() {
  cd "${srcdir}/qp"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/qp"
  export CGO_ENABLED=0

  _commit=$(git rev-parse HEAD)
  _fulldate=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  _monthYearDate=$(date -u +'%B %Y')

  sed -i -e "s/@VERSION@/${pkgver}/g" -e "s/@DATE@/${_monthYearDate}/g" "${_binaryname}.1"

  go build -trimpath -ldflags="-s -w \
  -X qp/internal/about.Version=${pkgver} \
  -X qp/internal/about.Commit=${_commit} \
  -X qp/internal/about.Date=${_fulldate}" \
    -o ${_binaryname} ./cmd/${_binaryname}
}

package() {
  cd "$srcdir/qp"
  install -Dm755 "${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"
  install -Dm644 "${_binaryname}.1" "${pkgdir}/usr/share/man/man1/${_binaryname}.1"
  install -Dm644 "${srcdir}/news/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"
}
