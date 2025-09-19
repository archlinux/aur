# Maintainer: mazix <mazix@bk.ru>

pkgname=perplexity
pkgver=1.3.0
pkgrel=3
commit='a7c9e6757f77b249262b2dc198066edcfeb8fa0c'
pkgdesc='Native Perplexity AI client for Linux'
arch=('x86_64')
url='https://github.com/mazixs/perplexity'
license=('Apache 2.0')
depends=('electron' 'desktop-file-utils' 'xdg-utils')
makedepends=('git' 'npm')
provides=('perplexity')
optdepends=('libappindicator-gtk3: for tray icon support')

# Источник: VCS (фиксированный коммит)
source=(
  "git+https://github.com/mazixs/perplexity.git#commit=${commit}"
  'perplexity.desktop'
  'perplexity.png'
  'launcher.sh'
  'default.conf'
  'perplexity.install'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

install=perplexity.install

build() {
  cd "${srcdir}/${pkgname}/src"
  
  # Устанавливаем npm зависимости
  npm install --production
}

package() {
  cd "${srcdir}/${pkgname}"

  # Устанавливаем исходные файлы приложения
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r src/* "${pkgdir}/usr/lib/${pkgname}/"
  
  # Копируем установленные node_modules
  if [ -d "src/node_modules" ]; then
    cp -r src/node_modules "${pkgdir}/usr/lib/${pkgname}/"
  fi

  # При наличии локальных библиотек в репозитории — добавить их в пакет
  if [ -d "usr/lib" ]; then
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/vendor-libs"
    cp -r usr/lib/. "${pkgdir}/usr/lib/${pkgname}/vendor-libs/"
  fi

  # Устанавливаем исполняемый файл (лаунчер) и конфиг по умолчанию
  install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/perplexity"
  install -Dm644 "${srcdir}/default.conf" "${pkgdir}/etc/perplexity/default.conf"

  # Устанавливаем desktop файл и иконку
  install -Dm644 "${srcdir}/perplexity.desktop" \
                 "${pkgdir}/usr/share/applications/perplexity.desktop"
  install -Dm644 "${srcdir}/perplexity.png" \
                 "${pkgdir}/usr/share/pixmaps/perplexity.png"
}
