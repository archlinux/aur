# Maintainer: JageloR <jagelor@yandex.ru>
pkgname=tray-idle-inhibitor
pkgver=0.1.3
pkgrel=1
pkgdesc="Апплет трея: инхибитор idle для Wayland (labwc/LXQt) — wayland + logind"
arch=('x86_64' 'aarch64')
url="https://github.com/JageloR/tray-idle-inhibitor"
license=('MIT')
depends=('gcc-libs')
optdepends=('playerctl: автовключение инхибитора при воспроизведении медиа (--auto)')
makedepends=('cargo')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e8753399dd63f45bf2c3eea909623ec5ad1550dbcf02a0de6c82357525e96be3')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Пример конфига — как .pacnew: существующий файл не конфликтует с пакетом,
  # а встроенные значения программы повторяют эти же настройки.
  install -Dm644 config.toml "${pkgdir}/etc/xdg/${pkgname}/config.toml.example"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 README.ru.md "${pkgdir}/usr/share/doc/${pkgname}/README.ru.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 CHANGELOG.ru.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.ru.md"
  install -Dm644 docs/DESIGN.md "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
}
