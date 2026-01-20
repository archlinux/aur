# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=2.2.2
pkgrel=5
pkgdesc="Web client for Yandex Music with support for themes, addons and Discord Rich Presence (RPC)"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
depends=('glibc' 'gtk3' 'alsa-lib')

source=("https://github.com/Web-Next-Music/Next-Music-Client/releases/download/Next-Music-${pkgver}/next-music_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"

  # Распаковка deb
  ar x "next-music_${pkgver}_amd64.deb"
  tar -xf data.tar.*

  # Установка файлов
  [[ -d usr ]] && cp -r usr "${pkgdir}/"
  [[ -d opt ]] && cp -r opt "${pkgdir}/"

  # 🔍 Ищем основной бинарь (Electron)
  BIN=$(find "${pkgdir}/opt" -type f -executable | head -n 1)

  if [[ -z "$BIN" ]]; then
    echo "❌ Executable binary not found in /opt"
    exit 1
  fi

  echo "✅ Found binary: $BIN"

  # Симлинк как в deb
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${BIN#/pkgdir}" "${pkgdir}/usr/bin/next-music"
}
