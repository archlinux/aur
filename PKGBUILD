# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.105.0
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

sha256sums_x86_64=("b3115eae3d82b2414153eade56be878ba86d1237e20aa3551834812b012feb63")
sha256sums_aarch64=("274ee0e4f3eae1640b5a68edac440974fe111e9c58fe377652bbe50e035095a1")
sha256sums_armv7h=("dc043ab6fac86c65f4c7dfc73ac84ef1e9ff5b6d396b966652267c437c06c1ba")

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
