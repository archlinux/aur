# Maintainer:
# Contributor: slomomojo <slomomojo@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

_pkgname="wings3d"
pkgname="$_pkgname"
pkgver=2.3
pkgrel=1
pkgdesc='3D modeler using the winged edge data structure'
arch=(x86_64)
url='http://www.wings3d.com/' # https is not available
license=(GPL)

depends=(
  erlang
  erlang-cl
)
makedepends=(
  gendesk
  git
)
optdepends=(
  'povray: render scenes with POV-Ray'
)

_pkgext="tar.bz2"
_pkgsrc="${_pkgname%3d}-$pkgver"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"https://sourceforge.net/projects/wings/files/wings/$pkgver/wings-$pkgver.$_pkgext"
  wings.sh
)
sha256sums=(
  '7447fa88f6cf08b98caaf5a3be0111395002656f120ac5ca8b74d696273e6f0b'
  '3f0186e59ea13d5de7fd882e148189cc233c5898903e83fcb01fb7bb6fa998b0'
)

prepare() {
  local _gendesk_options=(
    -f
    -n
    --name 'Wings 3D'
    --pkgname "$pkgname"
    --pkgdesc "$pkgdesc"
    --genericname '3D Modeler'
    --categories 'Graphics;3DGraphics'
  )

  gendesk "${_gendesk_options[@]}"

  sed -i "/desktop-id/ s/com.wings3d.WINGS.desktop/$pkgname.desktop/" "$_pkgsrc/unix/wings.appdata.xml"
}

build() {
  export ERL_LIBS="$srcdir"
  make -C "$_pkgsrc" unix
}

package() {
  install -Dm755 "wings.sh" "${pkgdir:?}/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" -t "${pkgdir:-}/usr/share/applications"

  cd "$_pkgsrc"
  for i in 48 256 ; do
    install -Dm644 "icons/wings_icon_${i}x${i}.png" "${pkgdir:?}/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 unix/wings.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"

  cd build
  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -r "$_pkgsrc-linux/lib/$_pkgsrc"/* "${pkgdir:?}/usr/lib/$_pkgname/"
}
