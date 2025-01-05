# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Lucas Nascimento <lucasnascimento95@gmail.com>
# Contributor: Arne Hoch <arne@derhoch.de>

_pkgname=dbeaver
pkgname=dbeaver-ce-bin
pkgver=24.3.1
pkgrel=2
pkgdesc="Free universal SQL Client for developers and database administrators (community edition)"
arch=('x86_64')
url="https://dbeaver.io/"
license=("Apache-2.0")
depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
optdepends=('dbeaver-plugin-office: export data in Microsoft Office Excel format'
            'dbeaver-plugin-svg-format: save diagrams in SVG format')
conflicts=('dbeaver')
provides=('dbeaver')
source=("${_pkgname}-${pkgver}.linux.gtk.${arch}-nojdk.tar.gz"::"https://github.com/dbeaver/dbeaver/releases/download/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.${arch}-nojdk.tar.gz"
        "io.dbeaver.DBeaver.desktop"
        "${pkgname}.sh"
        "${pkgname}.hook"
        "${pkgname}.install")
sha256sums=('6e09a68ad58f35494ce0a3676aef197eff9e6a883a6dad22544f30bab02f37de'
            '9480a7d08f680e10c399db070c5a04cbabf282442602a2ef83d1159fe7c3e88b'
            '406a2980806c394670e88b1ae70134900be376c2ea4a4216610591cc8b557526'
            'f8b763ca210bfa4d9a4e407b656ba4f5d1bf2f3f54c67044f7a4dd0c3625fc22'
            'f8d65dd933049b587a5815ea75a30ef944300b812df383ca1c2dcd68280bc7ab')
install="${pkgname}.install"

package() {
  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "dbeaver" "${pkgdir}/usr/lib/${_pkgname}"

  # Move shared data to /usr/share/dbeaver
  cd "${pkgdir}/usr/lib/${_pkgname}"
  rm "dbeaver-ce.desktop"
  install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
  for _file in configuration features p2 .eclipseproduct dbeaver.ini readme.txt
  do
    mv "${_file}" "${pkgdir}/usr/share/${_pkgname}"
    ln -s "/usr/share/${_pkgname}/${_file}" .
  done

  # Install additional licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  mv licenses "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgname}" "${pkgdir}/usr/lib/${_pkgname}/licenses"

  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  mv dbeaver.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  mv icon.xpm "${pkgdir}/usr/share/pixmaps/${_pkgname}.xpm"

  # Install executable script into /usr/bin
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/dbeaver"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/io.dbeaver.DBeaver.desktop"

  # Install system hook
  install -m 755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks"

  # Create configuration file (handled by the hook)
  cd "${pkgdir}/usr/share/${_pkgname}/configuration/org.eclipse.equinox.simpleconfigurator"
  install -m 755 -d "${pkgdir}/etc/dbeaver/bundles.d"
  mv "bundles.info" "${pkgdir}/etc/dbeaver/bundles.d/00-${pkgname}.info"
  ln -s "/etc/${pkgname}/bundles.info" .
}

