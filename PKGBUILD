# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='sejda-desktop'
pkgver='7.0.8'
pkgrel='1'
license=('custom:EULA')
pkgdesc='PDF editor'
arch=('x86_64')
url='http://www.sejda.com/desktop'
source=("https://sejda-cdn.com/downloads/sejda-desktop_${pkgver}_amd64.deb")
md5sums=('f1cc8db5c3cf4663e8882fe14d8850f4')
sha512sums=('499a400452e3cd188e41893d0d4311a269ea4d91fa35012a8fb6cd21b7d2777db8239cdf843bec910dd2c04520940d188c3a24b3efa3933a44f4d48df7b5a09f')
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
