# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp-bin
pkgver=5.70.2
pkgrel=2
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

sha256sums_x86_64=("580763776d7d83274c84af066b30584d003c00ac159bf6d4dcc355e9f0a80b75")
sha256sums_aarch64=("39ee0b1b525ceb551a909d101bb02475c75b563c5de734123e64696f02464470")
sha256sums_armv7h=("e024ca5ace0a4376e6c78fb4bd5666005ba4f50f08f33d1e8f1b5c1d9dcfa67a")

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
