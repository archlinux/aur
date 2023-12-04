# Maintainer: Alex R <alex at ironrobin dot net>

pkgname=dbeaver-arm
pkgdesc="Free universal SQL Client for developers and database administrators. Community Edition. Linux ARM version."
pkgver=23.3.0
pkgrel=0
arch=('aarch64')
url="https://dbeaver.io/"
license=('Apache')
depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
source=("${pkgname}-${pkgver}.tar.gz"::"https://dbeaver.io/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.aarch64-nojdk.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}.hook"
        "${pkgname}.install")
sha256sums=('fccf60db34abb899fa74ff2e3753f9a2c6757a170ba00255f81511e016f0f34d'
            'a346f25f8bbedec5af99d2d5ea913770363cd1cca97a95431db91993b572f427'
            'c3e7edcb5427de0c8d3d62a7ba98946090bbb69ce969f2b5d2f5e3a0d7064199'
            '6189acf8d2a76ed924064b515bc2db591455fcaa84efb8914214905785f48180'
            'b8569fc7971b37542a0ce1e7d31607f860fcd33b7f39e5d0570b8607f83410e3')
install="${pkgname}.install"

package() {
  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "dbeaver" "${pkgdir}/usr/lib/${pkgname}"

  # Move shared data to /usr/share/dbeaver
  cd "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  for _file in configuration features p2 .eclipseproduct dbeaver.ini readme.txt
  do
    mv "${_file}" "${pkgdir}/usr/share/${pkgname}"
    ln -s "/usr/share/${pkgname}/${_file}" .
  done

  # Install additional licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  mv licenses "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/licenses"

  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  mv icon.xpm "${pkgdir}/usr/share/pixmaps/dbeaver.xpm"

  # Install executable script into /usr/bin
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/dbeaver-arm.sh" "${pkgdir}/usr/bin/dbeaver"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

  # Install system hook
  install -m 755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks"

#   Does not work on ARM

#   # Create configuration file (handled by the hook)
#   cd "${pkgdir}/usr/share/dbeaver-arm/configuration/org.eclipse.equinox.simpleconfigurator"
#   install -m 755 -d "${pkgdir}/etc/${pkgname}/bundles.d"
#   mv "bundles.info" "${pkgdir}/etc/${pkgname}/bundles.d/00-${pkgname}.info"
#   ln -s "/etc/${pkgname}/bundles.info" .
}