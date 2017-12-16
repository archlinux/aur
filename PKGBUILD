# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-git
pkgver=4.13.1.r117.g10473391
pkgrel=1
pkgdesc="A desktop manager for Xfce (git version)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui>=4.13.0' 'garcon>=0.6.0' 'hicolor-icon-theme' 'libwnck3') # 'thunar')
makedepends=('intltool' 'git' 'xfce4-dev-tools')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("${_pkgname}::git://git.xfce.org/xfce/xfdesktop")
sha256sums=('SKIP')

# Desktop plugin has been ported to thunarx-3. If thunar-git is installed, it will be built so 
# add to dependencies, otherwise add missing dependencies that thunar would otherwise satisfy.
[[ "`pkg-config --modversion thunarx-3 2>/dev/null`" != '' && $( vercmp '1.7.0' "`pkg-config --modversion thunarx-3 2>/dev/null`" ) -ge 0 ]] && depends+=('thunar>=1.7.0') || depends+=('exo>=0.11.0' 'libnotify')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/^${_pkgname}.//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-notifications \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
