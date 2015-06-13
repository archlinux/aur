# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>

pkgname=thunderbird-theme-adwaita-git
pkgver=24.0_60bbde2
pkgrel=1
pkgdesc="Adwaita theme for Thunderbird (Matches the default Gnome Shell theme)"
url="https://addons.mozilla.org/en-US/thunderbird/addon/adwaita-thunderbird"
arch=('any')
license=('MPL')
depends=("thunderbird")
makedepends=('unzip' 'git')
provides=('thunderbird-theme-adwaita')
conflicts=('thunderbird-theme-adwaita')
source=("git://github.com/gnome-integration-team/thunderbird-gnome.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/thunderbird-gnome/theme"
  echo $(cat install.rdf | grep em:version | cut -f2 -d'>' | cut -f1 -d'<')_$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/thunderbird-gnome/theme"
  # Find extension UUID
  _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  # Prepare destination folder
  _dstdir="${pkgdir}/usr/lib/thunderbird/extensions/${_emid}"
  install -d "${_dstdir}"
  # Copy files
  cp -R * "${_dstdir}"
  # Restore standard permissions
  find "${pkgdir}" -type d -print0 | xargs --null chmod 0755
  find "${pkgdir}" -type f -print0 | xargs --null chmod 0644
}
