# Maintainer: Jake Barnes <me+aur@jakebarn.es>
# Maintainer: Philipp Schmitt <philipp@schmitt.co>
pkgname=flicd
pkgver=2.0.3
pkgrel=1
pkgdesc="Flic SDK for Linux"
arch=('i386' 'x86_64' 'armv6h' 'armv6l' 'armv7h' 'armv7l' 'aarch64')
url="https://github.com/50ButtonsEach/fliclib-linux-hci"
license=('unknown')
source=("git+https://github.com/50ButtonsEach/fliclib-linux-hci#tag=${pkgver}"
        "flicd.service")
md5sums=('SKIP'
         '6144a880dd1975c63140f1754320812c')
sha256sums=('SKIP'
            '89c7f1872e84eb87b4e02f331819fbd40dadfaa99a8a2d1e255f225c2b1c0617')
backup=('etc/flicd/db')
install="${pkgname}.install"

build() {
  cd "${srcdir}/fliclib-linux-hci/simpleclient"
  make
}

package() {
  local cpu_arch
  case "$CARCH" in
    x86_64|i386|aarch64)
      cpu_arch="$CARCH" ;;
    arm*)
      cpu_arch=armv6l ;;
    *)
      echo "Unknown CPU architecture: $CARCH" >&2
      exit 3
      ;;
  esac
  cd "${srcdir}/fliclib-linux-hci"
  install -Dm 755 "bin/${cpu_arch}/flicd" "${pkgdir}/usr/bin/flicd"
  install -Dm 755 "simpleclient/simpleclient" \
    "${pkgdir}/usr/bin/flic-simpleclient"
  install -Dm 644 "${srcdir}/flicd.service" \
    "${pkgdir}/usr/lib/systemd/system/flicd.service"
  install -dDm 755 "${pkgdir}/etc/flicd"
}
