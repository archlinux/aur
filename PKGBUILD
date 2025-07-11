# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.102.2
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
optdepends=('sqlite: RPM support')

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=("75cb791f17bdde6e516ea9e62ef3bf09ce8b1b12453ac35a1430c1d96dcc4925")
sha256sums_aarch64=("bdf0eeb9118a229e07fe5734a28df662aa2ba77fd0594c0befa03abca6a1fcdd")
sha256sums_armv7h=("11bde0fbfd9369cb45424ad1c7d79677042a2836faa7b14935355ec04699b1b5")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"

  "$pkgdir/usr/bin/qp" --completions bash >"$srcdir/qp.bash"
  "$pkgdir/usr/bin/qp" --completions zsh >"$srcdir/qp.zsh"

  install -Dm644 "$srcdir/qp.bash" "$pkgdir/usr/share/bash-completion/completions/qp"
  install -Dm644 "$srcdir/qp.zsh" "$pkgdir/usr/share/zsh/site-functions/_qp"
}
