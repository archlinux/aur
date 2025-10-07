# Maintainer: legiz <legiz.ru@gmail.com>
pkgname=prizrak-box-bin
_pkgname=Prizrak-Box
pkgver=1.0.20_alpha2 # Embeds the calculated version string directly
pkgrel=1
pkgdesc="A cross-platform GUI client for Prizrak."
arch=('x86_64' 'aarch64')
url="https://github.com/legiz-ru/prizrak-box"
license=('MIT')
depends=('gtk3' 'libappindicator-gtk3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Source files: format is (filename::URL)
source_x86_64=("-linux-x64-${pkgver}.deb::https://github.com/legiz-ru/prizrak-box/releases/download/v1.0.20-alpha2/linux-amd64.deb")
source_aarch64=("-linux-arm64-${pkgver}.deb::https://github.com/legiz-ru/prizrak-box/releases/download/v1.0.20-alpha2/linux-arm64.deb")

sha256sums_x86_64=('ccf0796786d08ec4d7ead82bf837bb1bd4c6b64e2e19ac8544dc05553069378a')
sha256sums_aarch64=('9d5c48909d8c750fe9d9d6923342eda133e847a4f72c19b89694f40114010e3e')

package() {
  local _deb_file
  
  # Определяем имя скачанного .deb файла в зависимости от архитектуры.
  # Название файла в массиве source совпадает с ${_pkgname}-linux-*-${pkgver}.deb
  if [ "${CARCH}" = "x86_64" ]; then
    _deb_file="${_pkgname}-linux-x64-${pkgver}.deb"
  elif [ "${CARCH}" = "aarch64" ]; then
    _deb_file="${_pkgname}-linux-arm64-${pkgver}.deb"
  else
    error "Unsupported architecture: ${CARCH}"
  fi

  cd "${srcdir}"
  
  # 1. Извлекаем data.tar.xz (архив с данными) из .deb файла с помощью bsdtar
  # bsdtar -xf <deb_file> -C <target_dir> <file_to_extract>
  bsdtar -xf "${_deb_file}" -C . data.tar.xz
  
  # 2. Извлекаем содержимое data.tar.xz в пакетный каталог
  tar -xf data.tar.xz -C "${pkgdir}/"
  
  # Очистка
  rm data.tar.xz
}
