# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Vital Reichmuth (furbyhaxx) <furbyhaxx@gmail.com>
# Contributor: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=polaris
pkgver=0.16.1
pkgrel=1
pkgdesc='A self-hosted music streaming server'
arch=('aarch64' 'x86_64')
url='https://github.com/agersant/polaris'
license=('MIT')
depends=('libgcc')
makedepends=('git' 'rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname^}_${pkgver}.tar.gz"
        "${pkgname}.service"
        "${url}/raw/refs/tags/${pkgver}/docs/CONFIGURATION.md"
        "${url}/raw/refs/tags/${pkgver}/docs/DDNS.md"
        "${url}/raw/refs/tags/${pkgver}/LICENSE")
b2sums=('6713820fed9c7ef1faccb74cf85048676ccf97c5b4e5656383bf43ccdbc841dc28615da727ce4ba18112f352451d733a9df4aac360da66c7d24149959df7a4bc'
        'f1472f577868139673a5a74bda932a1e94f41f011dfbb08e3cd19abe60afedb494657aee844c1807b0b85088f8a1c13f1a9f7e6ad1c58f5479dfa52738b72392'
        '8460996f8a3a56a854d3c0373c8f07a572a032a2d5ef9db8d898b487b4f18264a245d03ed41a7856f2054bb77ced3ac05def2f48ea83140bd15772e98aaa23f2'
        '3ad7155313052ff4a95fbfae6ccf88da5537faf3df16094f5389bbfcdb7a10f3a0f1584dacf63baafa13f5b5013561a552a8faa400ed305fd72d890512ad3133'
        'eb1273bd7089096a647d8cb86a5d910b675ff226938f768cac78394de268b7bd965f56d5ae91b2deee52d3da89dac9f2fa2372957551935b04373508604839ec')

prepare() {
  cd "${pkgname}"
  cargo fetch
}

build() {
  cd "${pkgname}"
  POLARIS_WEB_DIR="/usr/share/polaris/web" \
    POLARIS_CONFIG_DIR="/var/lib/polaris" \
    POLARIS_DATA_DIR="/var/lib/polaris" \
    POLARIS_LOG_DIR="/var/log/polaris" \
    POLARIS_CACHE_DIR="/var/cache/polaris" \
    POLARIS_PID_DIR="/run/polaris" \
    cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # web
  install -dm755 "${pkgdir}/usr/share/polaris"
  cp -a "${srcdir}/${pkgname}/web" "${pkgdir}/usr/share/polaris"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # docs
  install -Dm644 "${srcdir}/CONFIGURATION.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"
  install -Dm644 "${srcdir}/DDNS.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/DDNS.md"
  # license
  install -D -m644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
