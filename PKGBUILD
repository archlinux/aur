# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgbase=nanomq-bin
pkgname=(nanomq-bin nanomq-nng-bin)
pkgver=0.24.8
pkgrel=2
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
sha512sums_x86_64=('7f329c60c3102370d673b1e130b71dada739b4896ccfde3b1c8f7ea5cf871fa02cfe8c26021f8dec0eb03d65f302735ca10cc511af83392697e50ed7ebc86cab')
sha512sums_aarch64=('621f28add4a27b758b10d93cc8766aa82f851c279d53bdca657b50a2b1978f1415feaa5660f1f956616fc76294bcd35829b0d386fefed4229939c1f1152a2f69')
sha512sums_armel=('04a070b560d316c7f87558ac7391f34c817eec8892929fdcb221b7817038d10a507fcfab5216f4b3a6111de4549833acf9407550550b633eb6ee93f0b18e73c5')
sha512sums_armv7h=('a1eb01c3552c7d85f05ca70e184371b3e5f7c057433202ec67a8903bcf555d2d0f8ef065bb86730d0da93d42c52bf111945fee2b194fad14898b137a75bb8642')

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
