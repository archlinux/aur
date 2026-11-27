# Maintainer: JageloR <jagelor@yandex.ru>
pkgname=kb-indicator-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="Индикатор раскладки клавиатуры в системном трее Wayland (LXQt/labwc)"
arch=('x86_64' 'aarch64')
url="https://github.com/JageloR/kb-indicator-rs"
license=('MIT')
depends=('gcc-libs' 'libxkbcommon')
optdepends=('ttf-dejavu: шрифт по умолчанию для иконки раскладки' 'fontconfig: поиск шрифта по font.family через fc-match')
makedepends=('cargo')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a7f9861cfac8362b122e34bff31084e3c0b858bd0c0d278e48077b1c3b8bc9b')

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
  # Пример конфига — не файл пакета: существующий не конфликтует при обновлении.
  install -Dm644 config.toml "${pkgdir}/etc/xdg/${pkgname}/config.toml.example"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
