pkgname=sac-core-legacy
pkgver=10.0.37
pkgrel=2
pkgdesc="SafeNet Authentication Client (version 10.0 for old Alladin eToken support)"
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(pcsclite)
license=(custom)
source=('https://installer.id.ee/media/etoken/older%20versions/SAC_10_0_Post_GA_Linux.zip'
        eToken.conf)
sha256sums=('4f99737e100d3fb3c00dc65f27adce2ee60d0c207ca8ef92e51b49767f7d5e1d'
            '85b850b820610e029428e577ca0e48f6fb7b4148ae8d702ca20b191963046c6c')
install=$pkgname.install

prepare() {
  bsdtar -xf SAC_10_0_Post_GA_Linux.iso
  ar x "Installation/DEB/Core - No UI/SafenetAuthenticationClient-core-10.0.37-0_amd64.deb"
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

  # Documentation -- user guide belongs to the GUI package
  install -Dm644 "Documentation/007-013841-001_SafeNet Authentication Client_10.0_Post GA_Linux_Release Notes_Rev B.pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_10.0_Linux_Release_Notes.pdf
  install -Dm644 "Documentation/007-013842-001_SafeNet Authentication Client_10.0_Post GA_Linux_Administrator_Guide_Rev B.pdf" \
                  "$pkgdir"/usr/share/doc/$pkgname/SAC_10.0_Linux_Administrator_Guide.pdf

  #install -Dm644 eToken.conf "$pkgdir"/etc/eToken.conf
}

# vim: ts=2:sw=2:et:
