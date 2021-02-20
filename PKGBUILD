# Maintainer: Yurii Kolesnykov
# Based on [extra]'s xorgproto by AndyRTR <andyrtr@archlinux.org>

_pkgname=xorgproto
pkgname=$_pkgname-git
pkgver=2020.1.43.r2680.ge5d8af9
pkgrel=1
pkgdesc="Combined X.Org X11 Protocol headers (git version)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=(
	'git'
	'meson'
	'python-libevdev'
	'xorg-util-macros'
)
provides=('xorgproto')
conflicts=(${provides[@]})
source=("$pkgname::git://anongit.freedesktop.org/xorg/proto/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git describe --long | cut -d "-" -f2-3 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f4)
}

prepare() {
  rm -rf build
  mkdir build
}

build() {
  arch-meson "$pkgname" build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # missing docs
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "$pkgname"/*.txt "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 "$pkgname"/PM_spec "${pkgdir}/usr/share/doc/${pkgname}/"
  rm "${pkgdir}"/usr/share/doc/${pkgname}/meson_options.txt

  # licenses
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${pkgname}"/COPYING* "${pkgdir}/usr/share/licenses/${pkgname}/"
  # remove licences of legacy stuff we don't ship anymore
  rm -f "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING-{evieproto,fontcacheproto,lg3dproto,printproto,xcalibrateproto,xf86rushproto}

  # cleanup
  rm -f "${pkgdir}"/usr/include/X11/extensions/apple*
  rm -f "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING-{apple,windows}wmproto
  rm -f "${pkgdir}"/usr/share/pkgconfig/applewmproto.pc
}
