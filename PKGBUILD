# Maintainer: Jesse R Codling <jclds139 at gmail dot com>

_pkgbase=goodix-touchscreen
pkgname=${_pkgbase}-dkms-git
pkgver=r25.6562922
pkgrel=1
pkgdesc="Modified Goodix Touchscreen Driver with Active Pen Support"
arch=('i686' 'x86_64')
url="https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver"
license=('GPL2')
depends=('dkms')
source=("${pkgname}::git+${url}.git"
        'dkms.conf')
md5sums=('SKIP'
         'df911d9c87cf394dc7808ed926663261')

pkgver() {
	cd "$srcdir/${pkgname}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${srcdir}/${pkgname}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
