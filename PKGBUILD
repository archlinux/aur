# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

_pkgname=xfce4-dev-tools
_gitname=$_pkgname
pkgname=${_pkgname}-git
pkgver=4.19.1.r18.g194f6b6
pkgrel=1
pkgdesc="The Xfce development tools"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://gitlab.xfce.org/xfce/xfce4-dev-tools"
depends=('pkg-config' 'gtk-doc' 'make' 'intltool')
makedepends=('git')
conflicts=($_pkgname)
provides=("${_pkgname}=4.19")
options=('!libtool')
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

build() {
  cd "${srcdir}/${_gitname}"

  msg "Starting build..."
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR=${pkgdir} install
}
