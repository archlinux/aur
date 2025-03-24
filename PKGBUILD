# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=nanomq-bin
pkgver=0.23.5
pkgrel=3
pkgdesc='An ultra-lightweight and blazing-fast Messaging broker/bus for IoT edge & SDV'
url='https://nanomq.io'
arch=(x86_64 aarch64 armel armv7h)
license=(MIT)
depends=(gcc-libs)
provides=(nanomq)
conflicts=(nanomq)
makedepends=(libarchive)
backup=(etc/nanomq.conf)
install="${pkgname}.install"
noextract=("nanomq-${pkgver}-linux-"{x86_64,aarch64,armel,armv7h}".deb")
source=(nanomq.service)
source_x86_64=("${pkgver}-x86_64.deb::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-amd64.deb")
source_aarch64=("${pkgver}-aarch64.deb::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-arm64.deb")
source_armel=("${pkgver}-armel.deb::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armel.deb")
source_armv7h=("${pkgver}-armv7h.deb::https://github.com/nanomq/nanomq/releases/download/${pkgver}/nanomq-${pkgver}-linux-armhf.deb")
sha512sums=('7b86f32e35697f0f955f3d562637c5e067ac9b6691c7b6957d9106836445ffb75690530d72c5a0613519daaff7459ffbc776b2b3210d2a727053b097c8d950ee')
sha512sums_x86_64=('23852e6208e9bd3b37802077af05dd95ee441f0bf3f4236188e47d10ee8c1ae34f606592842c6c30590038b71f7544d9c96091f0558bdafbb64e7c9e7fc37ca9')
sha512sums_aarch64=('1ac6876e1e737e0f59412638571cf078e7f52dc0accdd21f8d8fed6930f7572a00c817c57d9c8705d6624efc6054f5a2a1665bc2ccc1b0c52ba347372e02f02c')
sha512sums_armel=('1e19e1853fa762986f04887a3af49b63957f4e051f033be2ebcee61bceb4231d6d12953cd2342ca7d55f8f79ca6859f2c37ddb0898e04ef812a5663bd1263b48')
sha512sums_armv7h=('c46fc9557812b826d00dec41c4638ab0c63643544618d392321c1bbc244a0ecc573c19c26916333da23570901ec06ce6b0ee040ddd21b01d1d78a180bef37c2d')

prepare() {
  cd "${srcdir}"
  rm -f "${srcdir}/data.tar.xz"
  bsdtar -xf "${pkgver}-${CARCH}.deb" data.tar.xz
  mkdir -p "${srcdir}/${pkgver}-${CARCH}"
  bsdtar -xzf data.tar.xz --strip-components 1 -C "${srcdir}/${pkgver}-${CARCH}"
}

package() {
  cd "${srcdir}/${pkgver}-${CARCH}"

  install --directory \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/etc" \
    "${pkgdir}/usr/include" \
    "${pkgdir}/usr/lib" \
    "${pkgdir}/usr/lib/systemd/system" \
    "${pkgdir}/usr/share"

  cp -r \
    "usr/local/bin/" \
    "usr/local/include/" \
    "usr/local/lib/" \
    "usr/local/share/" \
    "${pkgdir}/usr/"

  cp usr/local/etc/nanomq.conf "${pkgdir}/etc/nanomq.conf"

  install -Dm 644 "${srcdir}/nanomq.service" -t "${pkgdir}/usr/lib/systemd/system"
}
