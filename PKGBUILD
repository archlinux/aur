# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Thibault Molleman <aur at thibaultmol d0t link>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='sejda-desktop'
pkgver='7.7.4'
pkgrel='1'
license=('LicenseRef-EULA')
pkgdesc='PDF editor'
arch=('x86_64')
depends=(libxcb libxfixes nspr alsa-lib libcups at-spi2-core libxrandr libdrm libxrender pango nss libxcomposite cairo libxdamage libxkbcommon mesa gtk3)
depends+=(libx11 glibc bash expat libxext libxtst dbus libxi gcc-libs glib2)
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
md5sums=('2b7950ce803af32df9031ed209517eb0')
sha512sums=('a632548dd2798d2e911acec7dcd632f2848e38620143728705907d4271c8c56c1f6797e64a709668f7bcf0ca0e7b899b760de003a13618969d4d8fbfd23f5a2a')
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
