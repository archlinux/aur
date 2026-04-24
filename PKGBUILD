# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgbase=nanomq-bin
pkgname=(nanomq-bin nanomq-nng-bin)
pkgver=0.24.13
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
sha512sums_x86_64=('d096184fad6956a95154a1cae54151cea45330317d6fc483a289b8aef4279ddace23b5321f97fd0bf071b488666f5e6df66f8db9c2013cac42d08446bab5032e')
sha512sums_aarch64=('8555113dc2a1d241f9f88a2c65d712d18b87e2235b539a4ee5bcad42635636bc88e2710132daa7a15d60025fa753742e951ebdd09e6c6155ff6403e418aea430')
sha512sums_armel=('a52236d8f7d009ec726ec7e0db0d2c40e9b9f3caf20906d21fc9eea190cab62da886c5338946990d9b2d8226285f4b11794bf8c037995ede21b166b08e48a7ac')
sha512sums_armv7h=('f4bd79615ab421bfb2031004db43307df20294c8b0ec260cffa97f3215f7fa336b0ae3e97aee54b39fe476cda86a3be1bee2068983cc4e8513478def76322e47')

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
