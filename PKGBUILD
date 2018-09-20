# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
pkgver=0.32.9
pkgrel=1
pkgdesc="SQL Operations Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW from Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/Microsoft/sqlopsstudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
makedepends=('sed')
optdepends=('krb5: Windows authentication support')
options=('staticlibs')
source=("https://github.com/Microsoft/sqlopsstudio/releases/download/${pkgver}/sqlops-linux-${pkgver}.tar.gz"
	'sqlops.desktop')
sha256sums=('55e293062a3084c01e8031a9052d4208b80d32255be19e531d61941ca5da8697'
            'b14a6335e172e0da67ba777b9cd8ae82c23fc8002dfce8c1f5b0f0388a42d7ee')

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${srcdir}/sqlops-linux-x64/"* "${pkgdir}/usr/share/${pkgname}"

  # Symlink the SQL Service package as Unknown to workaround distro detection issues
  ln -s "./Linux" "${pkgdir}/usr/share/${pkgname}/resources/app/extensions/mssql/sqltoolsservice/Unknown"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/sqlops" "${pkgdir}/usr/bin/${pkgname}"

  # Add the .desktop file
  install -D -m644 "${srcdir}/sqlops.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s/{pkgname}/${pkgname}/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the license file
  install -D -m644 "${srcdir}/sqlops-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
