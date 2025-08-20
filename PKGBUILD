# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=5.108.0
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
optdepends=('sqlite: RPM support')
source=("${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz")
sha256sums=("db584ab27f28f3364b8648d6655468433571afc970c4c0c564cc0463cb884a3a")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  export CGO_ENABLED=0

  if [[ -f .ldflags ]]; then
    ldflags=$(<.ldflags)
  fi

  go build -trimpath -tags=noextradeps -ldflags "${ldflags}" -o "${pkgname}" ./cmd/${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 "NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"

  "${pkgdir}/usr/bin/${pkgname}" --completions bash >"$srcdir/qp.bash"
  "${pkgdir}/usr/bin/${pkgname}" --completions zsh >"$srcdir/qp.zsh"

  install -Dm644 "$srcdir/qp.bash" "$pkgdir/usr/share/bash-completion/completions/qp"
  install -Dm644 "$srcdir/qp.zsh" "$pkgdir/usr/share/zsh/site-functions/_qp"
}
