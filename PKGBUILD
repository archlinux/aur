# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.104.1
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

sha256sums_x86_64=("091ff0a396b842eab474c9ab446ee137be3a19b761a8cd514599127e012c85d0")
sha256sums_aarch64=("c395bb11b53e3e7c4e7017e0f316b66d97e95352613612cddc8bfd5dc6766838")
sha256sums_armv7h=("264c6929253b3adc5fb7e8262ec66363e0d336beeeca4e2cdfa2f5467609aa87")

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
