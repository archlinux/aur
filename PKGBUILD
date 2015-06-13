# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Jonathan Frazier <eyeswide@gmail.com>
pkgname=defcon
pkgver=1.60
pkgrel=1
pkgdesc="Global Thermonuclear War game"
arch=('i686' 'x86_64')
url="http://www.introversion.co.uk/defcon/"
license=("custom")
depends=('glu' 'mesa' 'sdl' 'alsa-plugins' 'libpulse'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'xdg-utils')
source=("${pkgname}-${pkgver}.sh"::"http://www.introversion.co.uk/${pkgname}/downloads/${pkgname}.sh"
        "${pkgname}-16.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}-64.png"
        "${pkgname}-128.png"
        "${pkgname}.desktop")
md5sums=('b8533e05218cc2452b6debed263224f0'
         '5fe8db2ddd9d8b729bbdc45ef8ed952e'
         '9f644374d718126ddf5a1b8b6b4bf25e'
         'ba986cfe6c1cdfb2a415c0c551c840e2'
         '15e3ad4bea89ee96d62235ca371fb403'
         'a75d3a0b29668e3ebd2afcaec5d2b199'
         'e470f70aa1c72f6e37b77e27d769da3f')
install="${pkgname}.install"
noextract=("${pkgname}-${pkgver}.sh")

build() {
  sh "${pkgname}-${pkgver}.sh" --noexec --keep
  # Extract archives from Nixstaller archive
  lzmadec "tmp/subarch" | tar xf - instarchive_all instarchive_all_x86 instarchive_all_x86_64
  lzmadec "instarchive_all" | tar xf -
  lzmadec "instarchive_all_x86" | tar xf -
  lzmadec "instarchive_all_x86_64" | tar xf -
}

package() {
  # install desktop file and icon
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 644 -D "${pkgname}-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -m 644 -D "${pkgname}-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -m 644 -D "${pkgname}-48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -m 644 -D "${pkgname}-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -m 644 -D "${pkgname}-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

  #install program files
  cd "Defcon"
  if [ "${CARCH}" = "x36_64" ]
  then
    install -m 755 -D "defcon.bin.x86_64" "${pkgdir}/usr/share/${pkgname}/defcon"
  else
    install -m 755 -D "defcon.bin.x86" "${pkgdir}/usr/share/${pkgname}/defcon"
  fi
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "manual.pdf"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "linux.txt"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "main.dat"
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" "sounds.dat"

  #install symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/defcon" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/bin/xdg-open" "${pkgdir}/usr/share/${pkgname}/xdg-open.sh"

  # Install license
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
