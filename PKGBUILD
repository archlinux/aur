pkgname=sac-core-legacy
pkgver=10.0.37
pkgrel=1
pkgdesc="SafeNet Authentication Client (version 10.0 for old Alladin eToken support)"
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(pcsclite sac-core)
license=(custom)
source=('eToken.conf')
source_x86_64=('https://storage.spidlas.cz/public/soft/safenet/SafenetAuthenticationClient-core-10.0.37-0_amd64.deb')
sha256sums=('85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c')
sha256sums_x86_64=('b4f8ffd030363693540bd494c3825ebd901937565cdd1c6455f95005571a27e5')
install=$pkgname.install

prepare() {
  bsdtar -xf data.tar.gz
}

package() {
  local f

  # Install PKCS#11 module and CardOS token engine
  for f in lib{eToken,cardosTokenEngine}.so.10.0.37; do
    install -Dm644 lib/$f "$pkgdir"/usr/lib/sac-10.0/$f
    ln -s $f "$pkgdir"/usr/lib/sac-10.0/${f%.*}
    ln -s $f "$pkgdir"/usr/lib/sac-10.0/${f%.*.*}
    ln -s $f "$pkgdir"/usr/lib/sac-10.0/${f%.*.*.*}
  done

  # Legacy name for the eToken PKCS#11 module
  install -dm755 "$pkgdir"/usr/lib/pkcs11
  ln -s sac-10.0/libeToken.so.10.0.37 "$pkgdir"/usr/lib/libeTPkcs11.so
  ln -s ../sac-10.0/libeToken.so.10.0.37 "$pkgdir"/usr/lib/pkcs11/libeTPkcs11.so

  # "Card reader" driver for PCSC
  install -dm755 "$pkgdir"/usr/lib/pcsc/drivers
  cp -a usr/share/eToken/drivers/aks-ifdh.bundle "$pkgdir"/usr/lib/pcsc/drivers/
  ln -sf libAksIfdh.so.10.0 "$pkgdir"/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/libAksIfdh.so.10
  ln -sf libAksIfdh.so.10.0 "$pkgdir"/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/libAksIfdh.so
  rm "$pkgdir"/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/readme.txt

  #install -dm755 "$pkgdir"/etc
  #install -Dm644 eToken.conf "$pkgdir"/etc/eToken.conf
}

# vim: ts=2:sw=2:et:
