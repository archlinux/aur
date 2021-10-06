# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Thibault Molleman <aur at thibaultmol d0t link>

pkgname='sejda-desktop'
pkgver='7.3.6'
pkgrel='1'
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
depends=('gconf')
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
md5sums=('06b6f91ab9b653697728a096e6d2a1fc')
sha512sums=('f6c98bb3ded0175884c45928e54bbff79a73243cf59667bd0c8351ec69530cd19bb927816bdae578a9741ba68260a0a2163bde2aea4be0312ab5a1eb42046cc0')
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
