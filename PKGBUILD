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

sha256sums_x86_64=('b3e7c20fadc478cc3974e484098323c8ffeb2584c2a6bdc6f28480db54c56ab2')
sha256sums_aarch64=('cd4c13d3e26c1113ef51ef59792e8d56e0668db8995470defbd2b0b619b5fb35')

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
