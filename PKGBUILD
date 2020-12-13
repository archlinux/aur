# Maintainer: Ismael González Valverde <ismgonval@gmail.com>

pkgname=rnr
pkgver=0.3.0
pkgrel=2
pkgdesc='A CLI tool to rename files and directories that supports regex.'
provides=('rnr')
makedepends=('rust')
arch=('x86_64')
url='https://github.com/ChuckDaniels87/rnr'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChuckDaniels87/rnr/archive/v$pkgver/v$pkgver.tar.gz")
md5sums=('5716da90e696da1aa04221f277cbdea0')

build () {
  cd ${pkgname}-$pkgver
  cargo build --release --locked --all-features
}

check() {
  cd ${pkgname}-$pkgver
  cargo test --release --locked
}

package() {
  cd ${pkgname}-$pkgver
  local target_dir="target/release"

  # Binary
  install -Dm 755 "${target_dir}/${pkgname}" -t "${pkgdir}/usr/bin"
  # Completion files
  local completion_dir='./completion'
  mkdir -p "${completion_dir}"

  # Ugly hack to copy all completion files
  cp "${target_dir}/build/${pkgname}"-*/out/"_${pkgname}" "${completion_dir}"
  cp "${target_dir}/build/${pkgname}"-*/out/"${pkgname}.bash" "${completion_dir}"
  cp "${target_dir}/build/${pkgname}"-*/out/"${pkgname}.fish" "${completion_dir}"

  install -Dm644 "${completion_dir}/_${pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${completion_dir}/${pkgname}.bash" \
    "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${completion_dir}/${pkgname}.fish" \
    "$pkgdir/usr/share/fish/completions/${pkgname}.fish"

  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # License files
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
