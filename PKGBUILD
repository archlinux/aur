# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dockbarx-plugin
pkgname=$_pkgname-gtk3-git
epoch=2
pkgver=r62+f7585b5
pkgrel=2
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/m7s/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx-gtk3-git' 'xfce4-panel>=4.12')
makedepends=('git' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_branch='pygi-python3'
source=("${_pkgname}::git+https://github.com/M7S/${_pkgname}#branch=${_branch}"
        'fixes.patch::https://github.com/M7S/xfce4-dockbarx-plugin/pull/2.patch')
sha256sums=('SKIP'
            '8f529817c1de28dc4ef2047254863d446f6c83a0120f90af9eac3f1524179f31')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Apply xuzhen's fixes for background color while waiting on pull request to be accepted
  patch -Np1 -r- -i ../fixes.patch

  PREFIX=/usr python ./waf configure
}

build() {
  cd "${srcdir}/${_pkgname}"
  python ./waf build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" python ./waf install
}

