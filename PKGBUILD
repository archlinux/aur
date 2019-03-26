# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=pwpw-card
pkgver=2.1.0.33
_zipver=2_1_0_33
_shlver=2.1.0.33
pkgrel=1
pkgdesc="PKCS#11 driver for PWPW (and CryptoTech) cards, as distributed by LT ADIC"
arch=(x86_64)
url="http://www.nsc.vrm.lt/"
license=(GPL2)
depends=(
  ccid
  gcc-libs
  gtk3
  pcsclite
)
optdepends=(
  'ccpkip11: the older CryptoTech driver'
)
source=("http://www.nsc.vrm.lt/files/pwpw_v${_zipver}_linux.zip")
sha256sums=('4192c0de0398c53083564bd8ae2ff6a99214720a56136877d24cd93d58d6102c')

prepare() {
  cd "$srcdir"
  sh "pwpw-card-${_shlver}.linux.x64.run" --tar xvf
}

package() {
  cd "$srcdir"

  cp -av usr "$pkgdir"/usr
  mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib
  cp -av lib/systemd "$pkgdir"/usr/lib/systemd

  chmod -R a+rX "$pkgdir"/usr
  chmod a-x "$pkgdir"/usr/lib/systemd/system/*.service

  # [Untested] p11-kit compatibility
  mkdir -p "$pkgdir"/usr/lib/pkcs11
  ln -s ../pwpw-card-pkcs11.so "$pkgdir"/usr/lib/pkcs11/pwpw-card-pkcs11.so
  mkdir -p "$pkgdir"/usr/share/p11-kit/modules
  echo "module: pwpw-card-pkcs11.so" > "$pkgdir"/usr/share/p11-kit/modules/pwpw-card-pkcs11.module

  # Hack for compatibility with older client versions (iSign, Signa)
  # The upstream install.sh does this, but perhaps we shouldn't.
  # (The existing aur/ccpkip11 driver will probably do the job...)
  #ln -s libpwpw-card.so "$pkgdir"/usr/lib/libccpkip11.so
}

# vim: ts=2:sw=2:et:ft=sh
