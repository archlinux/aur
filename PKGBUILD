# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='sejda-desktop'
pkgver='7.2.1'
pkgrel='1'
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
depends=('gconf')
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
md5sums=('7d0705209657685a9814965d6ffade4c')
sha512sums=('b7022583199a3f6b04d841d8a56c7497118ce3faebd011483057f1382eeaad8d3bd2254717d76f332d191bc7f43bab640e3fef6fc0dd666d402e1f33e9ecd69e')
options=('!strip')
PKGEXT='.tar.gz'

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
