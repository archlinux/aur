# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

set -u
_pkgname='dropbox-uploader'
pkgname="${_pkgname}-git"
pkgver=0.20c.r4.gc2d1d9e
pkgrel=1
pkgdesc='A bash script to manage Dropbox from the CLI'
arch=('any')
#url='https://github.com/andreafabrizi/Dropbox-Uploader'
url='https://github.com/severach/Dropbox-Uploader'
license=('GPL3')
depends=('bash' 'curl')
makedepends=('git')
#source=('git://github.com/andreafabrizi/Dropbox-Uploader.git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=('git+https://github.com/severach/Dropbox-Uploader.git')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${srcdir}/Dropbox-Uploader"
  git describe --tags --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
  set +u
}

prepare() {
  set -u
  cd "${srcdir}/Dropbox-Uploader"
  sed -i -e 's/dropbox_uploader.sh/dropbox_uploader/g' 'dropShell.sh'
  set +u
}

package() {
  set -u
  cd "${srcdir}/Dropbox-Uploader"
  install -Dpm755 'dropbox_uploader.sh' "${pkgdir}/usr/bin/dropbox_uploader"
  install -Dpm755 'dropShell.sh' "${pkgdir}/usr/bin/dropShell"
  sed -i -e 's:^BRANDING=.*$'":BRANDING='Arch Linux':g" \
         -e '# curl depends on ca-certificates so this message should never be seen' \
         -e 's:^PACKAGE_CACERT_INSTALL=.*$'":PACKAGE_CACERT_INSTALL='pacman -S ca-certificates':g" \
    "${pkgdir}/usr/bin"/{dropShell,dropbox_uploader}
  set +u
}
set +u
