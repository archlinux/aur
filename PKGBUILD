# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgbase=nanomq-bin
pkgname=(nanomq-bin nanomq-nng-bin)
pkgver=0.24.14
pkgrel=1
url='https://nanomq.io'
arch=(x86_64 aarch64 armel armv7h)
license=(MIT)
depends=(gcc-libs)
makedepends=(libarchive)
noextract=("${pkgver}-"{x86_64,aarch64,armel,armv7h}".rpm")
source=(nanomq.service)
source_x86_64=("${pkgver}-x86_64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-x86_64.rpm")
source_aarch64=("${pkgver}-aarch64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-arm64.rpm")
source_armel=("${pkgver}-armel.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armel.rpm")
source_armv7h=("${pkgver}-armv7h.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armhf.rpm")
sha512sums=('7b86f32e35697f0f955f3d562637c5e067ac9b6691c7b6957d9106836445ffb75690530d72c5a0613519daaff7459ffbc776b2b3210d2a727053b097c8d950ee')
sha512sums_x86_64=('5c587c1672bc2c4f86e775929e34755ddedaa4033f0dc7086827d283c8684c9fbc8bd1dfb5f477f72a5c0bd6a380680910018a0e7ec17884428bffb8207f698e')
sha512sums_aarch64=('6e28862e3fd65b193ebb34c5db2dd2f4b78caf35a7c2e9d58d5c01a37259dfe85ae71d57b949874e9fe217a6134cff1c3da595f049d3e1f7beb4e955b3e1667c')
sha512sums_armel=('360f5aadd2d265a43effe7aa5e7f807c126fc07fa5bc2fac0309faed28e15edc2ec6723fd1fa66acf63ca2515953a8ded4388164415333161534e05562ba2dae')
sha512sums_armv7h=('c4d146557fc402093faa04730f65ef8ac555e5d19e34e1fa763acbd2f6bfcdc19433a668ebdbd846f7872eb974b6de163da9b555971decee562f8c5f8884d81a')

prepare() {
  rm -rf "${srcdir}/root"
  mkdir -p "${srcdir}/root"
  bsdtar -xf "${srcdir}/${pkgver}-${CARCH}.rpm" -C "${srcdir}/root"
}

package_nanomq-bin() {
  pkgdesc='An ultra-lightweight and blazing-fast Messaging broker/bus for IoT edge & SDV'
  provides=(nanomq)
  conflicts=(nanomq)
  install=nanomq-bin.install
  backup=(etc/nanomq.conf)

  install --directory \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/include" \
    "${pkgdir}/usr/share" \
    "${pkgdir}/etc" \
    "${pkgdir}/usr/lib/systemd/system"

  cp \
    "${srcdir}/root/usr/local/bin/nanomq" \
    "${srcdir}/root/usr/local/bin/nanomq_cli" \
    "${pkgdir}/usr/bin/"

  cp -r \
    "${srcdir}/root/usr/local/include/nanomq/" \
    "${pkgdir}/usr/include/"

  cp -r \
    "${srcdir}/root/usr/local/share/nanomq/" \
    "${pkgdir}/usr/share"

  cp \
    "${srcdir}/root/usr/local/etc/nanomq.conf" \
    "${pkgdir}/etc/nanomq.conf"

  install -Dm 644 "${srcdir}/nanomq.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
}

package_nanomq-nng-bin() {
  pkgdesc='NanoNNG is the nanomsg-next-generation fork with MQTT support'
  provides=(nng)
  conflicts=(nng)

  install --directory \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/include" \
    "${pkgdir}/usr/lib" \
    "${pkgdir}/usr/lib/cmake"

  cp \
    "${srcdir}/root/usr/local/bin/nngcat" \
    "${pkgdir}/usr/bin/"

  cp -r \
    "${srcdir}/root/usr/local/include/nng/" \
    "${pkgdir}/usr/include/"

  cp -r \
    "${srcdir}/root/usr/local/lib/libnng.a" \
    "${pkgdir}/usr/lib/"

  cp -r \
    "${srcdir}/root/usr/local/lib/cmake/nng/" \
    "${pkgdir}/usr/lib/cmake/"
}
