# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.72.1
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

sha256sums_x86_64=("717440d3e8d8e2c417438c70b27c87d66227552abf91c3746b2de50efa5cdf14")
sha256sums_aarch64=("863391eed4b75b5a1c060ea363507db3df6a50b7aeb01969eae323484e44abc5")
sha256sums_armv7h=("41bced404d4ea6e1a38aa50b6105140c245c3305035352e3254e065ab468116e")

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
