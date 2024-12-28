# Maintainer: The Arcane Brony <root@thearcanebrony.net>
# Maintainer: witt <1989161762 at qq dot com>

pkgname=dbeaver-ue
pkgver=24.3.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Multifunctional database tool with native AWS, Azure, and Google Cloud support."
arch=('x86_64' 'aarch64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
options=('!strip')
makedepends=('tar')
conflicts=('dbeaver-plugin-sshj-lib' 'dbeaver' 'dbeaver-ce' 'dbeaver-le' 'dbeaver-ue' 'dbeaver-ee')
provides=('dbeaver' 'dbeaver-ue' 'dbeaver-ue-bin')
# source=(dbeaver-ue.desktop dbeaver-ue.install)
source=("dbeaver.sh")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://dbeaver.com/files/${pkgver}/${pkgname}-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://dbeaver.com/files/${pkgver}/${pkgname}-${pkgver}-linux.gtk.aarch64-nojdk.tar.gz")
sha256sums=('31b14de25fbaa1e5acc9063d9cddb3c78c44d02d415438126cd513c67df227a0')
sha256sums_x86_64=('e85a36d479cdeb2367da15158b52e45eb84d7ff3d665276ec34b5c78c8a5692c')
sha256sums_aarch64=('2951b8fe34ba9b62d43e5e887d06869c5eb595e5312491f65b91e8a0736a9b17')


package() {

  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/share"
  cp -r "dbeaver" "${pkgdir}/usr/share/${pkgname}"

  # Install the license
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  cd "${pkgdir}/usr/share/licenses"
  ln -s "../${pkgname}/licenses" "${pkgdir}/usr/share/licenses/${pkgname}"

  # Install the application launcher script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/dbeaver.sh" "${pkgdir}/usr/share/${pkgname}/${pkgname}.sh"
  ln -s "../share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "../share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/dbeaver"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/usr/share/applications"
  # replace the Exec and Name fields in the desktop file
  sed -i "s|Exec=.*|Exec=${pkgname}|g" "${pkgdir}/usr/share/${pkgname}/${pkgname}.desktop"
  sed -i "s|Name=.*|Name=DBeaver|g" "${pkgdir}/usr/share/${pkgname}/${pkgname}.desktop"

  ln -s "../${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
