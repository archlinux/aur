# Maintainer: Lucas Nascimento <lucasnascimento95@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Arne Hoch <arne@derhoch.de>

_simplifiedpkgname=dbeaver
_fullpkgname=${_simplifiedpkgname}-ce
pkgname=${_fullpkgname}-bin
pkgver=24.2.5
pkgrel=1
_COMMON_COMMIT_ID='5437f631851ca28a4aca9b2f578d670f4d1d2571'
pkgdesc="Free universal SQL Client for developers and database administrators (community edition)"
arch=('x86_64')
url="https://dbeaver.io/"
license=("Apache-2.0")
depends=('java-runtime>=17' 'gtk3' 'gtk-update-icon-cache' 'libsecret')
makedepends=('maven' 'java-environment>=17')
optdepends=('dbeaver-plugin-office: export data in Microsoft Office Excel format'
            'dbeaver-plugin-svg-format: save diagrams in SVG format')
conflicts=('dbeaver-plugin-sshj-lib' "${_simplifiedpkgname}")
# replaces=('dbeaver-plugin-sshj-lib' "${_pkgname}")
provides=('dbeaver' 'dbeaver-debug' 'dbeaver-plugin-sshj-lib')
source=("${_fullpkgname}-${pkgver}.linux.gtk.${arch}-nojdk.tar.gz"::"https://github.com/dbeaver/dbeaver/releases/download/${pkgver}/${_fullpkgname}-${pkgver}-linux.gtk.${arch}-nojdk.tar.gz"
        "io.${_simplifiedpkgname}.DBeaver.desktop"
        "${_simplifiedpkgname}.sh"
        "${_simplifiedpkgname}.hook"
        "${_simplifiedpkgname}.install")
sha256sums=('2e726adb7a3ad1cf98b34578e9eb0fd5b224727ce3dba850501bb752df5b3093'
            '9480a7d08f680e10c399db070c5a04cbabf282442602a2ef83d1159fe7c3e88b'
            '406a2980806c394670e88b1ae70134900be376c2ea4a4216610591cc8b557526'
            'f8b763ca210bfa4d9a4e407b656ba4f5d1bf2f3f54c67044f7a4dd0c3625fc22'
            'f8d65dd933049b587a5815ea75a30ef944300b812df383ca1c2dcd68280bc7ab')
install="${_simplifiedpkgname}.install"

prepare() {

  # extract tar
  tar -xvf "${_fullpkgname}-${pkgver}.linux.gtk.${arch}-nojdk.tar.gz"
}

package() {

  # Initially install everything into /usr/lib/dbeaver
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "dbeaver" "${pkgdir}/usr/lib/${_simplifiedpkgname}"

  # Move shared data to /usr/share/dbeaver
  cd "${pkgdir}/usr/lib/${_simplifiedpkgname}"
  rm "${_fullpkgname}.desktop"
  install -m 755 -d "${pkgdir}/usr/share/${_simplifiedpkgname}"
  for _file in configuration features p2 .eclipseproduct dbeaver.ini readme.txt
  do
    mv "${_file}" "${pkgdir}/usr/share/${_simplifiedpkgname}"
    ln -s "/usr/share/${_simplifiedpkgname}/${_file}" .
  done

  # Install additional licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses"
  mv licenses "${pkgdir}/usr/share/licenses/${_simplifiedpkgname}"
  ln -s "/usr/share/licenses/${_simplifiedpkgname}" "${pkgdir}/usr/lib/${_simplifiedpkgname}/licenses"

  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  mv dbeaver.png "${pkgdir}/usr/share/pixmaps/${_simplifiedpkgname}.png"
  mv icon.xpm "${pkgdir}/usr/share/pixmaps/${_simplifiedpkgname}.xpm"

  # Install executable script into /usr/bin
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/dbeaver.sh" "${pkgdir}/usr/bin/${_simplifiedpkgname}"

  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/io.${_simplifiedpkgname}.DBeaver.desktop"

  # Install system hook
  install -m 755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m 644 "${srcdir}/${_simplifiedpkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks"

  # Create configuration file (handled by the hook)
  cd "${pkgdir}/usr/share/dbeaver/configuration/org.eclipse.equinox.simpleconfigurator"
  install -m 755 -d "${pkgdir}/etc/${_simplifiedpkgname}/bundles.d"
  mv "bundles.info" "${pkgdir}/etc/${_simplifiedpkgname}/bundles.d/00-${_simplifiedpkgname}.info"
  ln -s "/etc/${_simplifiedpkgname}/bundles.info" .
}
