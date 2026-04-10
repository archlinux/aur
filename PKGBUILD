# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Amos Onn <amosonn@gmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: syncrtl64 <syncrtl64@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=3.10.0
pkgrel=1
pkgdesc="Complete set of tools that provides a virtual environment for Android."
arch=('x86_64')
url="http://www.genymotion.com/"
depends=('e2fsprogs' 'keyutils' 'krb5' 'libgpg-error' 'lz4' 'systemd-libs'
         'xz' 'zlib')
optdepends=('virtualbox')
install="${pkgname}.install"
license=('LicenseRef-custom')
options=('!strip')
source=("genymotion.desktop"
        "https://dl.genymotion.com/releases/genymotion-${pkgver}/${pkgname}-${pkgver}-linux_x64.run")
sha256sums=('cfe3db36490d38a0331a64f50e85c432994e4543f48d2719e7feaee9f442f6e1'
            'cb9924009a51b7d10e6009a0a2cd3e5fa5c53e0776cf65c4b42abbeaf015b7c7')

package(){
  install -d "${pkgdir}/opt/${pkgname}"

  _src="${pkgname}-${pkgver}-linux_x64.run"

  # Retrieve line number where tar.bzip2 binary begins
  _skip=$(awk '/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }' "${_src}")
  [ $? -ne 0 ] && return 1

  # Untar following archive
  tail -n +${_skip} "${_src}" \
      | tar -xj --no-same-owner -C "${pkgdir}/opt/${pkgname}"
  [ ${PIPESTATUS[0]} -ne 0 -o ${PIPESTATUS[1]} -ne 0 ] && return 1

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/genymotion" "${pkgdir}/usr/bin/genymotion"
  ln -s "/opt/${pkgname}/genymotion-shell" "${pkgdir}/usr/bin/genymotion-shell"
  ln -s "/opt/${pkgname}/player" "${pkgdir}/usr/bin/genymotion-player"
  ln -s "/opt/${pkgname}/gmtool" "${pkgdir}/usr/bin/gmtool"
  install -D -m 644 "genymotion.desktop" "${pkgdir}/usr/share/applications/genymotion.desktop"
  chown -R root:root "${pkgdir}/opt/${pkgname}"
}
