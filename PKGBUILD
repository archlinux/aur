# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.72.0
pkgrel=1
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/Zweih/qp"
license=("GPL3")
provides=("qp")
conflicts=("qp" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")

_release_url="${url}/releases/download/v${pkgver}/qp-v${pkgver}"
_ext=".tar.gz"

source_x86_64+=("${_release_url}-x86_64${_ext}")
source_aarch64+=("${_release_url}-aarch64${_ext}")
source_armv7h+=("${_release_url}-armv7h${_ext}")

sha256sums_x86_64=("29474ba05ee4c5e3a12cb96b3e6af8ca17d2b7649d2deb6d8c55dafa84536a87")
sha256sums_aarch64=("c15bf3906a2e53470db54249d3e1426344518619e6ac7d25c0916c1c70de959a")
sha256sums_armv7h=("d94383b809039be713d4eac43abf77c87344bbdde0c2f324ece4702b92338dc3")

package() {
  tar -xzf "$srcdir/qp-v${pkgver}-${CARCH}${_ext}" -C "$srcdir"

  install -Dm755 "${srcdir}/qp-${CARCH}" "$pkgdir/usr/bin/qp"
  install -Dm644 "${srcdir}/qp.1" "${pkgdir}/usr/share/man/man1/qp.1"
  install -Dm644 "${srcdir}/NEWS" "${pkgdir}/usr/share/doc/qp/NEWS"

  install -Dm644 "update-qp-cache.hook" \
    "$pkgdir/usr/share/libalpm/hooks/update-qp-cache.hook"
}

# Fix permission issues from previous version
post_install() {
  rm -rf /root/.cache/query-packages 2>/dev/null || true

  for user_home in /home/*; do
    if [ -d "$user_home/.cache/query-packages" ]; then
      rm -rf "$user_home/.cache/query-packages" 2>/dev/null || true
    fi
  done

  echo "qp cache cleaned - will be recreated with proper permissions"
}

post_upgrade() {
  post_install
}
