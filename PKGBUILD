# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-git
pkgver=5.108.0.r0.gbf2bf11
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1" "git")
provides=("qp")
conflicts=("qp" "qp-bin")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
optdepends=('sqlite: RPM support')
source=(
  "qp::git+https://github.com/Zweih/qp.git"
  "packaging::git+https://github.com/Zweih/qp.git#branch=packaging"
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

  go build -trimpath -tags noextradeps -ldflags="-s -w \
  -X qp/internal/about.Version=${pkgver} \
  -X qp/internal/about.Commit=${_commit} \
  -X qp/internal/about.Date=${_fulldate}" \
    -o ${_binaryname} ./cmd/${_binaryname}
}

package() {
  cd "$srcdir/qp"
  install -Dm755 "${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"
  install -Dm644 "${_binaryname}.1" "${pkgdir}/usr/share/man/man1/${_binaryname}.1"
  install -Dm644 "${srcdir}/packaging/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "${srcdir}/packaging/hooks/pacman/update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"

  "${pkgdir}/usr/bin/${_binaryname}" --completions bash >"$srcdir/qp.bash"
  "${pkgdir}/usr/bin/${_binaryname}" --completions zsh >"$srcdir/qp.zsh"

  install -Dm644 "$srcdir/qp.bash" "$pkgdir/usr/share/bash-completion/completions/qp"
  install -Dm644 "$srcdir/qp.zsh" "$pkgdir/usr/share/zsh/site-functions/_qp"
}
