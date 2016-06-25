# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=dcompmgr-git
pkgver=r95.0eddc6e
pkgrel=1
pkgdesc="Dana's composite manager (not for production use)"
arch=(i686 x86_64)
url="http://git.openbox.org/?p=dana/dcompmgr.git;a=summary"
license=('GPL')
depends=('libgl' 'glproto')
source=("${pkgname}::git://git.openbox.org/dana/dcompmgr"
        '0001-xcb-libs.patch')
md5sums=('SKIP'
         '11d81b16ff87085d64c6e84628c936a3')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 < "../0001-xcb-libs.patch"

  # There is no option to disable shadows
  _X_SHADOWOFFSET=0
  _Y_SHADOWOFFSET=0
  sed -i -e "s#d->xshadowoff = 2;#d->xshadowoff = ${_X_SHADOWOFFSET};#" -e "s#d->yshadowoff = 2;#d->yshadowoff = ${_Y_SHADOWOFFSET};#" *.c
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m 0755 dcompmgr "${pkgdir}/usr/bin/dcompmgr"
}
