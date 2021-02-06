# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=ocz-ssd-utility
pkgver=2.3.2963
pkgrel=3
pkgdesc="A GUI based tool for managing OCZ SSD including firmware and BIOS updates."
arch=('i686' 'x86_64')
url="https://ocz.com/us/download/"
license=('custom:OCZ EULA')
depends=('libxrender' 'fontconfig' 'libgl')
source=("https://personal.kioxia.com/content/dam/kioxia/shared/software/legacy-ssd-utility/SSDUtility_${pkgver}_Linux.zip"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}_polkit"
        "org.archlinux.pkexec.${pkgname}.policy")
sha256sums=('cd5b535bd081457057a12103ce6e3992f5ec45db122a60d2574b0a1778889fcc'
            '69dd55520a01972e74d421d68afd5673bf4835f618b2e671880c6f9497fe1ce2'
            'a5bab72e67578ceabf29e081063b00b1e1c3c2b9419fcbf888f3c24e65cf1035'
            'db802f83d5e9e09f5691669e1bc0b1e3191e4243b26784558ae0aa530d974336'
            '975b153475f98aa177cdd6911a549c07dee9ce5b15877a396be0a4e20414a2bf')

build() {
  bsdtar -xf "SSDUtility_${pkgver}.tar.gz"
}

package() {
  # Install policy file
  install -m 755 -d "${pkgdir}/usr/share/polkit-1/actions"
  install -m 644 -t "${pkgdir}/usr/share/polkit-1/actions" "org.archlinux.pkexec.${pkgname}.policy"
  # Install launcher script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}_polkit"
  install -m 644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m 644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  # Install license files
  cd "SSDUtility"
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "SSD_UTILITY_EULA_English.pdf"
  # Install files
  if [ "$CARCH" = "x86_64" ]; then
    cd "linux64"
  else
    cd "linux32"
  fi
  install -m 755 "SSDUtility" "${pkgdir}/usr/bin/${pkgname}"
}
