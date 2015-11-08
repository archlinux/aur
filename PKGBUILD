# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Jonathan Frazier <eyeswide@gmail.com>
pkgname=defcon
pkgver=1.60
pkgrel=2
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
sha256sums=('1259314c58ec99a6e83cb540f40008d209d1cbb34339fb25f0d66c0107d69a76'
            '07ef73da65038dd161e2b3364f216b96548ad74b1f8d5aeb0cd0f3171a3d8d5a'
            '8d050bb639082c337cc440d396972e5c24a92b054b58b09bf38adfa99437214a'
            '226643a2b02468773337b2f98d4201698e98870c4a939915b9a8646b9d7eae5d'
            '604feca6e953c0e028ea9585874abfa06409b5ce1a64310737678dd32e83c0bd'
            'bf94e634f6b7cc2727af8a11111fa1741a01a553dee3973f225e1158727cece7'
            '90a8f19391f25580c40c4c7b3fe073e4caa1f3232c912e1b81da32ba95e1eaed')
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
  # Install desktop file and icon
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  for _size in 16 32 48 64 128
  do
    install -m 644 -D "${pkgname}-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  # Install program files
  cd "Defcon"
  if [ "${CARCH}" = "x86_64" ]
  then
    install -m 755 -D "defcon.bin.x86_64" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  else
    install -m 755 -D "defcon.bin.x86" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  fi
  install -m 644 -t "${pkgdir}/usr/share/${pkgname}" \
    "manual.pdf" "linux.txt" "main.dat" "sounds.dat"

  # Install symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/bin/xdg-open" "${pkgdir}/usr/share/${pkgname}/xdg-open.sh"

  # Install license
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
