# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=ghost-bin
pkgver=2_0_2
pkgrel=1
pkgdesc="Xboard compatible chess engine - Precompiled binary from the official website"
arch=('i686' 'x86_64')
url="http://www.ghostchess.de"
license=('BSD')
depends=(sh)
optdepends=(
  'xboard: graphical user interface'
)
install=install

_urlprefix='http://www.ghostchess.de/ghost2/linux'
if test "$CARCH" == x86_64; then
  source=("${_urlprefix}/ghost2_x64_linux_v${pkgver}.tgz"
	  LICENSE)
  sha256sums=('ccafb414e4bf6384210ce1bd8bcf1d3cf90e410c6b70ba08085e06a587169ac0'
	      'SKIP')
  _binary=ghost2_x64_linux_v${pkgver}
else
  source=("${_urlprefix}/ghost2_x86_linux_v${pkgver}.tgz"
	  LICENSE)
  sha256sums=('e63ba38ebe48a77401dd9fb9207bd2c312141e2561bc9d2c2a4faa4767a2398b'
	      'SKIP')
  _binary=ghost2_x86_linux_v${pkgver}
fi

check() {
  cd "ghost2"
  msg2 "Starting a simple search"
  echo "go" | "./${_binary}" -sd 3 || \
      (error "Simple search failed with an unknown error" ; \
       if test "$CARCH" == x86_64 ; \
       then error "Note: The 64-bit binary assumes that your CPU supports the POPCNT operation"; \
	    error "If you saw an illegal instruction crash, you can try the non-popcnt version:"; \
	    error "${_urlprefix}/ghost2_x64_linux_v${pkgver}_non_popcnt.tgz"; \
	    error "sha256sum: c991c43834b5a1360c29aa6437aa4edf6c7a85fb49c6b4ac02e3e342b86fa438"; \
       fi ; false) && msg2 "Simple search completed without errors"
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "ghost2"
  install -Dm755 ${_binary} "$pkgdir/usr/share/$pkgname/ghost"
  install -Dm644 kp_kp.gbb "$pkgdir/usr/share/$pkgname/kp_kp.gbb"
  install -Dm644 kpp_kp_ram.gbb "$pkgdir/usr/share/$pkgname/kpp_kp_ram.gbb"

  # The .gbb files are expected to be in the same directory as the executable.
  # /usr/bin/ghost only delegates to the real binary in /usr/share/ghost
  mkdir -p "$pkgdir/usr/bin"
  printf "#!/bin/sh\n/usr/share/%s/ghost \"\$@\"" $pkgname >> "$pkgdir/usr/bin/ghost"
  chmod 755 "$pkgdir/usr/bin/ghost"
}
