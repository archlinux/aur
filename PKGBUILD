pkgname=ioruba-desktop-bin
pkgver=1.9.3
pkgrel=1
pkgdesc="Tactile audio mixer for Arduino-based Linux control (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ioruba-desktop' 'ioruba')
conflicts=('ioruba-desktop' 'ioruba')
replaces=('ioruba')
source=(
  "Ioruba_1.9.3_amd64.AppImage::https://github.com/bernardopg/ioruba/releases/download/v${pkgver}/Ioruba_1.9.3_amd64.AppImage"
  "ioruba.png::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
  "ioruba.svg::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/apps/desktop/src-tauri/icons/app-icon.svg"
  "run-appimage-compat.sh::https://raw.githubusercontent.com/bernardopg/ioruba/v${pkgver}/scripts/run-appimage-compat.sh"
)
# makepkg reconhece o payload squashfs e tenta extrair AppImages por
# padrao. Isso deixa no srcdir apenas o runtime ELF (~924 KiB), que o
# package() copiava como se fosse o app completo.
noextract=("Ioruba_1.9.3_amd64.AppImage")
# O AppImage e um ELF static-pie com o squashfs anexado apos o offset
# do runtime. O /extracao de debuginfo padrao do makepkg
# reescreve o ELF e trunca o payload (81 MB -> 923 KiB de runtime
# puro, que monta vazio). Diagnosticado em 2026-09-17: o pacote AUR
# 1.9.2 instalava só o runtime, e o app caia para o AppImage de dev
# do ~/.local/bin via PATH — com WebKit antigo, gerando os SIGABRT
# recorrentes do Doctor de coredump.
options=('!strip' '!debug')
sha256sums=('37ae5a7e4f1e22cc094973a741920435fc0c9933fbca1dae9cc78ccb44ae7bf1' '7aff3ecc3a0cbc1fed8559ae0464d2af330372514c39edfaefd31c2119a2db63' 'cf1b733eb5dbf61daab65b83e825387efdb1bec1bea5daf52864514ee8e4511a' '955b333ea1b0c1b5e6c02b2a3ba3c40d0b721cfe65efb85349e333abeab22836')

package() {
  install -Dm755 "${srcdir}/Ioruba_1.9.3_amd64.AppImage" "${pkgdir}/opt/ioruba/ioruba.AppImage"
  install -Dm755 "${srcdir}/run-appimage-compat.sh" "${pkgdir}/opt/ioruba/run-appimage-compat.sh"
  install -Dm644 "${srcdir}/ioruba.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"
  install -Dm644 "${srcdir}/ioruba.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ioruba.svg"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/io.ioruba.desktop.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Ioruba
GenericName=Audio Mixer
GenericName[pt_BR]=Mixer de Áudio
Comment=Tactile audio mixer for Arduino-based Linux control
Comment[pt_BR]=Mixer de áudio tátil para controle via Arduino no Linux
Exec=ioruba-desktop
Icon=ioruba
Terminal=false
Categories=AudioVideo;Audio;Mixer;
Keywords=audio;mixer;volume;arduino;serial;hardware;potentiometer;
StartupNotify=true
StartupWMClass=io.ioruba.desktop
DESKTOP

  # Os install -D acima criam apenas /opt/ioruba e /usr/share/...; o
  # redirecionamento abaixo nao cria diretorio, entao /usr/bin precisa
  # existir antes.
  install -dm755 "${pkgdir}/usr/bin"
  printf '%s\n'     '#!/usr/bin/env sh'     'exec /opt/ioruba/run-appimage-compat.sh /opt/ioruba/ioruba.AppImage "$@"'     > "${pkgdir}/usr/bin/ioruba-desktop"
  chmod 755 "${pkgdir}/usr/bin/ioruba-desktop"
}
