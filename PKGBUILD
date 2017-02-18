# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-flicd
pkgname=flicd
pkgver=0.4
pkgrel=3
pkgdesc="Flic SDK for Linux"
arch=('i386' 'x86_64' 'armv6l' 'armv7l' 'armv7h')
url="https://github.com/50ButtonsEach/fliclib-linux-hci"
license=('unknown')
source=("git+https://github.com/50ButtonsEach/fliclib-linux-hci#tag=0.4"
        "flicd.service")
makedepends=('make')
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
    x86_64|i386)
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

# vim:set ts=2 sw=2 et:
