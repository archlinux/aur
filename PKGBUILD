# Maintainer: mazix <mazix@bk.ru>

pkgname=perplexity
pkgver=1.4.0
pkgrel=2
commit='059b5e2989fb24109135607763e03453bebe1ea4'
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
sha256sums=('SKIP'
            'e2e3ca2a7838a3602be2e5293c661a821f69e0f2b21774d99e4fe5f7c78390c0'
            '553ae2c5fecc8a5bab7aedcd07450d89f0220c46695fac488d4aa074330eb3c7'
            'd43b2da02e60f303e96a38e04a6e77117e9d84f527c9352f782caf50d5980006'
            '01692302be8137ce1f61e6a4c0f680818053bded7ebd8ea2ee3a47cc1d9f71af'
            '85437de44f57ffe89c7c13aee24f891ee95e3e9f594e89f7de74e144e21eccf6')

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

  # Устанавливаем исполняемый файл (лаунчер) и конфиг по умолчанию
  install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/perplexity"
  install -Dm644 "${srcdir}/default.conf" "${pkgdir}/etc/perplexity/default.conf"

  # Устанавливаем desktop файл
  install -Dm644 "${srcdir}/perplexity.desktop" \
                 "${pkgdir}/usr/share/applications/perplexity.desktop"

  # Устанавливаем иконки из репозитория (все размеры)
  if [ -d "usr/share/icons" ]; then
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r usr/share/icons/* "${pkgdir}/usr/share/icons/"
    
    # Хак: переименовываем 512x512 иконку в Perplexity.png (с большой буквы)
    # чтобы соответствовать StartupWMClass=Perplexity в некоторых DE
    if [ -f "${pkgdir}/usr/share/icons/hicolor/512x512/apps/Perplexity.png" ]; then
       # Уже с большой буквы (если в репо так)
       :
    elif [ -f "${pkgdir}/usr/share/icons/hicolor/512x512/apps/perplexity.png" ]; then
       mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/perplexity.png" \
          "${pkgdir}/usr/share/icons/hicolor/512x512/apps/Perplexity.png"
    fi
  fi

  # Fallback: копируем 512px иконку в pixmaps как Perplexity.png
  install -Dm644 "${srcdir}/perplexity.png" "${pkgdir}/usr/share/pixmaps/Perplexity.png"
}
