# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=awesome-themes-git
pkgver=20131121
pkgrel=2
pkgdesc="Theme Collection for AwesomeWM, updated for 3.5.2. This is the successor of awesome34-themes-git"
arch=('any')
url="https://github.com/mikar/awesome-themes"
license=('GPL')
depends=('awesome')
makedepends=('git')

_gitroot="git://github.com/mikar/awesome-themes.git"
_gitname="awesome-themes"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build
}

package() {
  cd ${srcdir}/${_gitname}-build
  
  # Create installation directories
  install -d -m755 "${pkgdir}/usr/share/awesome/themes/"

  # Install the themes
  cp -rf * "${pkgdir}/usr/share/awesome/themes/"
  
  # Fix permissions. Stupid ntfs.
  find "$pkgdir" -type d -print0 | xargs -0 chmod -R 755
  find "$pkgdir" -type f -print0 | xargs -0 chmod -R 644
  # But keep some scripts functional (currently only used with niceandclean theme)
  find "$pkgdir" -type f -regex ".*\.sh$" -print0 | xargs -0 chmod 755
}
