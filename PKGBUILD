# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
_pkgname=azuredatastudio
pkgver=1.0.0
pkgrel=1
pkgdesc="Azure Data Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW (formerly SQL Operations Studio)."
arch=('x86_64')
url="https://github.com/Microsoft/azuredatastudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
makedepends=('sed')
optdepends=('krb5: Windows authentication support')
options=('staticlibs')
source=("https://github.com/Microsoft/${_pkgname}/releases/download/${pkgver}/${_pkgname}-linux-${pkgver}.tar.gz"
	"${_pkgname}.desktop")
sha256sums=('d5f1119abc16fa3f6dc50cd804251151a4052f5c8781bd734fe38da8b8007f4a'
            '42299d94a2b355c07a91f3c54bd79f6aa65c69dc1063689caad288be2d6c650b')

package() {
  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}-linux-x64/"* "${pkgdir}/usr/share/${_pkgname}"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  # Also add an alias for the previous name to hopefully not break things too much
  ln -s "/usr/share/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Add the .desktop file
  install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i "s/{pkgname}/${_pkgname}/g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install the license file
  install -D -m644 "${srcdir}/${_pkgname}-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
