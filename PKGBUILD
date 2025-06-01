# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=5.70.2
pkgrel=2
pkgdesc="qp - query packages. A CLI utility for querying installed packages across multiple package ecosystems."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog" "yaylog-bin" "yaylog-git")
source=("${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz")
sha256sums=("2e89054f857640a180d41028c628c09b6b0023ec920329aac62fb5456c99b9b4")

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
