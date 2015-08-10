pkgname='sac-core'
pkgver='9.0.43'
pkgrel='0'
pkgdesc='Safenet Authentication Client for Alladin eToken'
arch=('i686' 'x86_64')
depends=('pcsclite' 'pcsc-tools' 'libusb-compat' 'openssh')
makedepends=('libarchive')
license='custom'
source=(
    'https://bitbucket.org/s3rj1k/etoken/raw/61f30bfcd0e0dbede3b888de09602a61a3653d64/Linux/Core/SafenetAuthenticationClient-core-9.0.43-0_i386.deb'
    'https://bitbucket.org/s3rj1k/etoken/raw/61f30bfcd0e0dbede3b888de09602a61a3653d64/Linux/Core/SafenetAuthenticationClient-core-9.0.43-0_amd64.deb'
  )
sha256sums=(
    '665cf6b1b1acdefdb6a3eca2845305c2ca03146e27fdf3c446ddcc0b5fe9d7da'
    '43c0ddb2e4e7eaa2de530e5236661bef748401316679bc231a0620d89badbfdc'
  )

if [[ "$CARCH" == 'i686' ]];   then myarch="i386" ; fi
if [[ "$CARCH" == 'x86_64' ]]; then myarch="amd64"; fi

build() {
    bsdtar xf "$srcdir/SafenetAuthenticationClient-core-"$pkgver"-0_"${myarch}".deb" && bsdtar xf "$srcdir/data.tar.gz"
}

package() {
    mkdir -p "$pkgdir/usr/lib/pcsc/drivers"
    mkdir -p "$pkgdir/var/cache/eToken"
    cp -dpr --no-preserve=ownership "$srcdir/usr/bin" "$pkgdir/usr"
    cp -dpr --no-preserve=ownership "$srcdir/usr/share/eToken/drivers/aks-ifdh.bundle" "$pkgdir/usr/lib/pcsc/drivers"
    cp -dpr --no-preserve=ownership "$srcdir/lib" "$pkgdir/usr"
    rm "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/readme.txt"

    mkdir -p "$pkgdir/etc"
    echo "[GENERAL]" > "$pkgdir/etc/eToken.conf"
    echo "PcscSlots=1" >> "$pkgdir/etc/eToken.conf"
    echo "SoftwareSlots=1" >> "$pkgdir/etc/eToken.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    echo "[Unit]" > "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "Description=Aladdin eToken service" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "[Service]" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "ExecStart=/usr/bin/SACSrv" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "ExecReload=/bin/kill -HUP $MAINPID" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "StandardOutput=null" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "[Install]" >> "$pkgdir/usr/lib/systemd/system/etoken.service"
    echo "WantedBy=multi-user.target" >> "$pkgdir/usr/lib/systemd/system/etoken.service"

    cd "$pkgdir/usr/lib/pcsc/drivers/aks-ifdh.bundle/Contents/Linux/"
    ln -sf libAksIfdh.so.9.0 libAksIfdh.so
    cd "$pkgdir/usr/lib/"
    ln -sf libeToken.so.9.0.43 libeTPkcs11.so
    ln -sf libeToken.so.9.0.43 libeToken.so
    ln -sf libcardosTokenEngine.so.9.0.43 libcardosTokenEngine.so
    ln -sf libeTokenHID.so.9.0.43 libeTokenHID.so
    ln -sf libetvTokenEngine.so.9.0.43 libetvTokenEngine.so
    ln -sf libiKeyTokenEngine.so.9.0.43 libiKeyTokenEngine.so
    ln -sf libSACLog.so.9.0.43 libSACLog.so
}
