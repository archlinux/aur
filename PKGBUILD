# Maintainer: Lucas Nascimento <lucasnascimento95@gmail.com>
# Maintainer: witt <1989161762 at qq dot com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Arne Hoch <arne@derhoch.de>
pkgname=dbeaver-ce-latest
pkgver=24.3.0
pkgrel=1
pkgdesc="Free universal database tool and SQL client (community edition)"
arch=('x86_64' 'aarch64')
url="https://dbeaver.io/"
license=("Apache-2.0")
options=('!strip')
depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
# makedepends=('maven' 'java-environment>=17')
makedepends=('tar')
optdepends=('dbeaver-plugin-office: export data in Microsoft Office Excel format'
            'dbeaver-plugin-svg-format: save diagrams in SVG format')
conflicts=('dbeaver-plugin-sshj-lib' 'dbeaver' 'dbeaver-ce-bin' 'dbeaver-ce')
# replaces=('dbeaver-plugin-sshj-lib' "${_pkgname}")
provides=('dbeaver' 'dbeaver-ce' 'dbeaver-debug' 'dbeaver-plugin-sshj-lib')
source_x86_64=("https://github.com/dbeaver/dbeaver/releases/download/${pkgver}/${pkgname%-latest}-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz")
source_aarch64=("https://github.com/dbeaver/dbeaver/releases/download/${pkgver}/${pkgname%-latest}-${pkgver}-linux.gtk.aarch64-nojdk.tar.gz")
source=("${pkgname%-ce-latest}.sh")
sha256sums=('26fe0f096cfd4d8c6b444489532dad0395f45bc35660331e48c36d31809502b1')
sha256sums_x86_64=('eed9b3e93853ea81f678c465e574dfd7e9ebfee7c3969e01bc6c8a1480a24d1c')
sha256sums_aarch64=('89d9d37a1dfb130e9f83581d25aa0517ec298284a17096689265ac89dea0de8c')

package() {

  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/share"
  cp -r "dbeaver" "${pkgdir}/usr/share/${pkgname%-latest}"

  # Install the license
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  cd "${pkgdir}/usr/share/licenses"
  ln -s "../${pkgname%-latest}/licenses" "${pkgdir}/usr/share/licenses/${pkgname%-latest}"

  # Install the application launcher script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/dbeaver.sh" "${pkgdir}/usr/bin/${pkgname%-ce-latest}"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/usr/share/applications"
  # replace the Exec and Name fields in the desktop file
  sed -i "s|Exec=.*|Exec=${pkgname%-ce-latest}|g" "${pkgdir}/usr/share/${pkgname%-latest}/dbeaver-ce.desktop"
  sed -i "s|Name=.*|Name=${pkgname%-ce-latest}|g" "${pkgdir}/usr/share/${pkgname%-latest}/dbeaver-ce.desktop"

  ln -s "../${pkgname%-latest}/dbeaver-ce.desktop" "${pkgdir}/usr/share/applications/${pkgname%-ce-latest}.desktop"
}
