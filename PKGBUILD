# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgbase=nanomq-bin
pkgname=(nanomq-bin nanomq-nng-bin)
pkgver=0.25.5
pkgrel=1
url='https://nanomq.io'
arch=(x86_64 aarch64 riscv64 armv7h)
license=(MIT)
depends=(gcc-libs)
makedepends=(libarchive)
noextract=("${pkgver}-"{x86_64,aarch64,riscv64,armv7h}".rpm")
source=(nanomq.service)
source_x86_64=("${pkgver}-x86_64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-x86_64.rpm")
source_aarch64=("${pkgver}-aarch64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-arm64.rpm")
source_riscv64=("${pkgver}-riscv64.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-riscv64.rpm")
source_armv7h=("${pkgver}-armv7h.rpm::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armhf.rpm")
sha512sums=('7b86f32e35697f0f955f3d562637c5e067ac9b6691c7b6957d9106836445ffb75690530d72c5a0613519daaff7459ffbc776b2b3210d2a727053b097c8d950ee')
sha512sums_x86_64=('3b7bf37b0d671e363890363649e19cb4196154ebdefca150fbdb949148e20bf57e76707b06cb1388ff3891cde07e365e33d9a52e0183fb36f72639aedfb64dde')
sha512sums_aarch64=('af14404c9c8a181e1fd9adc28d370f51d8f0699b83c9929e4093e6953a22b932740f21dd81edf47d62a7944920c7932e27181635bc702d66114bec4e2251e9ec')
sha512sums_riscv64=('99b6f78b436ead3fe340bf9b1926a57d540290aa6324cb6dd39e633754c67a43182383727cd8d9f2d07bdfd33ac97db6e8787939580f57f07c1b8f8992955932')
sha512sums_armv7h=('f03c0abef8f2e6b3e5544620b1a91b6c5eab44ee68287d0616f8808973560a4fa66f103dd1b940755bb2b3fd46ca065345841fafb8c8b0e3552ed523706d2a9e')

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
