# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Amos Onn <amosonn@gmail.com>
# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: syncrtl64 <syncrtl64@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=3.9.0
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
sha512sums=('42f629d6413e4e481ef68d019ec3071515b45d01fdb004a545c8b977a9bf2439581ca8a67ad7dead9a12a0d24e8e46ba02c5dc47abd76597451b09847cf5d78b'
            'a8388d51d9115cdfa64933f9abf9fa8b48c05f5454b7c622ba3743f133cbfc9d46eeecad3001f32cdb852006d79328aa9233bf40c6d42dc317586513833ef3ae')

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
