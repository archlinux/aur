# Maintainer: martiuk <me at martinke dot mp>

_pkgname=xorgproto
pkgname="$_pkgname-explicit-sync-git"
pkgver=2023.2.8.r2754.g1c8128d
pkgrel=1
pkgdesc='combined X.Org X11 Protocol headers with explicit sync support (git version)'
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=(
	'git'
	'meson'
	'xorg-util-macros'
)
checkdepends=('python-libevdev')
provides=('xorgproto')
conflicts=('xorgproto')
source=(
	"$_pkgname::git+https://gitlab.freedesktop.org/xorg/proto/xorgproto.git"
	"https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/merge_requests/59.patch"
)
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  echo $(git describe --long | cut -d "-" -f2-3 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f4)
}

prepare() {
  mkdir -p build
  cd "$_pkgname"
	patch -Np1 -i "${srcdir}/59.patch"
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # missing docs
  install -m755 -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 "$_pkgname"/PM_spec "${pkgdir}/usr/share/doc/${_pkgname}/"

  # licenses
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 "$_pkgname"/COPYING* "${pkgdir}/usr/share/licenses/${_pkgname}/"
  # remove licences of legacy stuff we don't ship anymore
  rm -f "${pkgdir}"/usr/share/licenses/${_pkgname}/COPYING-{evieproto,fontcacheproto,lg3dproto,printproto,xcalibrateproto,xf86rushproto}

  # cleanup
  rm -f "${pkgdir}"/usr/include/X11/extensions/apple*
  rm -f "${pkgdir}"/usr/share/licenses/${_pkgname}/COPYING-{apple,windows}wmproto
  rm -f "${pkgdir}"/usr/share/pkgconfig/applewmproto.pc
}

