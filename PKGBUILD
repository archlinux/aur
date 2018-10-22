# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=azuredatastudio
pkgver=1.1.3
pkgrel=1
pkgdesc="Azure Data Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW (formerly SQL Operations Studio)."
arch=('x86_64')
url="https://github.com/Microsoft/azuredatastudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
makedepends=('sed')
optdepends=('krb5: Windows authentication support')
provides=('sqlops')
conflicts=('sqlops')
options=('staticlibs')
source=("https://github.com/Microsoft/${pkgname}/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz"
	"${pkgname}.desktop")
sha256sums=('46aefa7549bfe1f3d31e777accfc76bc1be13de8c98c194a86078bb7bdc1c3d4'
            '42299d94a2b355c07a91f3c54bd79f6aa65c69dc1063689caad288be2d6c650b')

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/${pkgname}-linux-x64/"* "${pkgdir}/usr/share/${pkgname}"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Also add an alias for the previous name to hopefully not break things too much
  ln -s "/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/sqlops"

  # Add the .desktop file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s/{pkgname}/${pkgname}/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the license file
  install -D -m644 "${srcdir}/${pkgname}-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
