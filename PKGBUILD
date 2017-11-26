# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=ghost-bin
pkgver=3_1
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

_urlprefix='http://www.ghostchess.de/ghost3/linux'
if test "$CARCH" == x86_64; then
  source=("${_urlprefix}/ghost3_linux64_v${pkgver}.tar.xz"
	  LICENSE)
  sha256sums=('1a4d99dc73b06da6e7210d7da80e53dcbf1d67f77f27c435c805fbe6a6bc147e'
	      'SKIP')
  _dir=ghost3_linux64_v${pkgver/_/.}_64bit

  _binary=ghost_v${pkgver/_/.}-64bit
  # to use the slower version without POPCNT instruction:
  #_binary=ghost_v${pkgver/_/.}-no-popcnt-64bit
else
  source=("${_urlprefix}/ghost3_linux32_v${pkgver}.tar.xz"
	  LICENSE)
  sha256sums=('1c10e9e087b44a9c9af18c3a1d220900c849bace519d5b943510b734a03c17a1'
	      'SKIP')
  _dir=ghost3_linux32_v${pkgver/_/.}_32bit
  _binary=ghost_v${pkgver/_/.}-32bit
fi

check() {
  cd "${_dir}"
  msg2 "Starting a simple search"
  echo "go" | "./${_binary}" -sd 3 || \
      (error "Simple search failed with an unknown error" ; \
       if test "$CARCH" == x86_64 ; \
       then error "Note: The 64-bit binary assumes that your CPU supports the POPCNT operation"; \
            error "If you saw an illegal instruction crash, you can try the non-popcnt version (search for POPCNT in the PKGBUILD)"; \
       fi ; false) && msg2 "Simple search completed without errors"
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${_dir}"
  install -Dm755 ${_binary} "$pkgdir/usr/share/$pkgname/ghost"
  install -Dm644 kp_kp.gbb "$pkgdir/usr/share/$pkgname/kp_kp.gbb"
  install -Dm644 kpp_kp_ram.gbb "$pkgdir/usr/share/$pkgname/kpp_kp_ram.gbb"

  # The .gbb files are expected to be in the same directory as the executable.
  # /usr/bin/ghost only delegates to the real binary in /usr/share/ghost
  mkdir -p "$pkgdir/usr/bin"
  printf "#!/bin/sh\n/usr/share/%s/ghost \"\$@\"" $pkgname >> "$pkgdir/usr/bin/ghost"
  chmod 755 "$pkgdir/usr/bin/ghost"
}
