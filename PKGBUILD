# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgbase=nanomq-bin
pkgname=(nanomq-bin nanomq-nng-bin)
pkgver=0.25.7
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
sha512sums_x86_64=('66330cfd143493e75c594e86bdb7410a91b655f1c10ffc36edba141fe4b2940e6de3279229d6d3e268cdd498cb7885a6d2028961a29916ac12c94786d5ba8780')
sha512sums_aarch64=('86067c4b7122cd1fb3764f86ef9c4d898ad024270119a08e03e24c1a578b9726e7192bd87c21c7acaeff792fd4daff29e42e3e902ccc470da0a27a397c58306e')
sha512sums_riscv64=('00d3088069ae77f5103c9272874e8129d40916798451f87827ec9021377c96332840ea5497de2c23b2990606796cc0fcf7fa2c74f30d85a294f0d0ab139dcddf')
sha512sums_armv7h=('e5313175740e2b2e41b8ac7a06efa1a61dfaafb30ad8ef7ccc7dc40e612d9550ba4b5486b41b0b9a5e91ddcf9eddec586f84e908a419544570f0634ae00bb821')

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
