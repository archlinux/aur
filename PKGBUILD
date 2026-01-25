# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=2.3.0
pkgrel=2
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

  # Указываем точный Linux-бинарь
  BIN="${pkgdir}/opt/Next Music/next-music"

  if [[ ! -x "$BIN" ]]; then
    echo "❌ Linux binary not found or not executable: $BIN"
    exit 1
  fi

  echo "✅ Found Linux binary: $BIN"

  # Создаём launcher-скрипт в /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/next-music" <<EOF
#!/bin/bash
exec "$BIN" "\$@"
EOF

  chmod +x "${pkgdir}/usr/bin/next-music"
}
