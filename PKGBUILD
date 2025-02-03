# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

_pkgname=xfce4-dev-tools
_gitname=$_pkgname
pkgname=${_pkgname}-git
pkgver=4.20.0.r15.g0b950ed
pkgrel=1
pkgdesc="The Xfce development tools"
arch=('i686' 'x86_64')
url="https://gitlab.xfce.org/xfce/xfce4-dev-tools"
license=('GPL-2.0-or-later')
depends=('glib2' 'gtk-doc' 'pkg-config' 'make' 'intltool')
makedepends=('git' 'meson')
optdepends=('docker: xfce-build helper script')
conflicts=($_pkgname)
provides=("${_pkgname}=4.20")
source=("git+https://gitlab.xfce.org/xfce/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
  cd "${srcdir}/${_gitname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${_gitname}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-maintainer-mode
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
