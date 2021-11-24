pkgname=sac-core-legacy
pkgver=10.0.37
pkgrel=6
pkgdesc="SafeNet Authentication Client (version 10.0 for old Alladin eToken support)"
url='https://cpl.thalesgroup.com/access-management/security-applications/authentication-client-token-management'
arch=(x86_64)
depends=(openssl-1.0 pcsclite)
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

  # The module loads "libcrypto.so" via dlopen() and expects the OpenSSL 1.0
  # ABI. If it finds a newer version it'll segfault when importing keys.
  # Fortunately, it looks here before /usr/lib.
  ln -s ../libcrypto.so.1.0.0 "$pkgdir"/usr/lib/sac-10.0/libcrypto.so
  ln -s ../libcrypto.so.1.0.0 "$pkgdir"/usr/lib/sac-10.0/libcrypto.so.1
  ln -s ../libcrypto.so.1.0.0 "$pkgdir"/usr/lib/sac-10.0/libcrypto.so.1.0.0

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
