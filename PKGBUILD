# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Thibault Molleman <aur at thibaultmol d0t link>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='sejda-desktop'
pkgver=7.7.5
pkgrel=1
license=('LicenseRef-EULA')
pkgdesc='PDF editor'
arch=('x86_64')
depends=(libxcb libxfixes nspr alsa-lib libcups at-spi2-core libxrandr libdrm libxrender pango nss libxcomposite cairo libxdamage libxkbcommon mesa gtk3)
depends+=(libx11 glibc bash expat libxext libxtst dbus libxi gcc-libs glib2)
url='http://www.sejda.com/desktop'
source=("https://downloads.sejda-cdn.com/sejda-desktop_7.7.5_amd64.deb")
md5sums=('f2b840d0b2a0fa3184fc79d5e88562eb')
sha512sums=('d6c0c4788f7953a0bb9a162c589716ebab3eba8e4f809bf9c458a62a6d1a30f0092bcd817d65abe3b6e97fce006bd9e6eabef745fcb212aeea8d50da338953f6')
options=('!strip')

prepare() {
  bsdtar -xf 'control.tar.gz'
  sed -e 's:/opt/:opt/:g' 'postinst' > 'postinst.Arch'
}

package() {
  bsdtar --no-same-owner --no-same-permissions -xf 'data.tar.gz' -C "${pkgdir}"
  cd "${pkgdir}"
  install -d 'usr/bin'
  ln -s '/opt/sejda-desktop/sejda-desktop' 'usr/bin/sejda-desktop'

  find -type 'f' '(' -name '.DS_Store' -o -iname '*.bat' ')' -delete

  # fix permissions
  bash "${srcdir}/postinst.Arch"

  # symlink licenses
  install -d "usr/share/licenses/${pkgname}"
  local _i
  for _i in 'EULA.pdf' 'LICENSE.electron' 'LICENSES.chromium.html'; do
    ln -s "/opt/sejda-desktop/${_i}" "usr/share/licenses/${pkgname}/${_i}"
  done
}
