# Maintainer: mazix <mazix@bk.ru>

pkgname=perplexity
pkgver=1.3.0
pkgrel=4
commit='8fa3be9a687062801b73907d7bae976206374d6d'
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
  
  # npm install создает node_modules в src/, они уже скопированы выше
  # Убеждаемся что node_modules присутствуют (они создались в build())
  if [ ! -d "${pkgdir}/usr/lib/${pkgname}/node_modules" ]; then
    echo "ERROR: node_modules не найдены после npm install!"
    exit 1
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
