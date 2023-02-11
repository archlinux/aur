# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

_yyyy=2021
pkgname=easytax-ag-${_yyyy}
pkgver=1.3
pkgrel=2
pkgdesc="Aargau tax declaration software."
arch=(any)
url="https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp"
license=('custom')
depends=("jre8-openjdk")
source=(
  "https://msg-easytax.ch/ag/${_yyyy}/EasyTax${_yyyy}AG_unix_$(echo ${pkgver} | sed 's/\./_/').tar.gz"
  "https://upload.wikimedia.org/wikipedia/commons/d/d9/Wappen_Aargau.svg"
  "$pkgname.desktop"
  "easytax-ag.patch"
)
sha256sums=(
  '1dce65837fe258fda921035f11e724d6d19680c6ca6cab94e0551a8dd406be18'
  '253d315b20371cd9add777dc990f96545c60d5d07a3f34cd33720d5148e82486'
  '3a92fb4332f4e731ecb8f5394d0cc923b7edd761c25f32795517f2099c029d1b'
  '4341d0b441118509ec21539aed95e2a1ac33c88deba0a341af075db114cca8bd'
)

package() {
  # only necessary to set openjdk as its default
  patch "$srcdir"/EasyTax*AG/EasyTax*_AG <"$srcdir"/easytax-ag.patch

  # package the software, the xdg desktop file so GUI finds it
  # and the link in bin so commandline finds it.
  mkdir -p "$pkgdir"/usr/lib
  mv "$srcdir"/EasyTax${_yyyy}AG/ "$pkgdir"/usr/lib/$pkgname/

  mkdir -p "$pkgdir"/usr/share/applications
  cp *.desktop "$pkgdir"/usr/share/applications/

  mkdir -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  cp Wappen_Aargau.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/wappen-aargau-${_yyyy}.svg

  mkdir -p "$pkgdir"/usr/bin
  binname=$(basename "$pkgdir"/usr/lib/$pkgname/EasyTax*)
  ln -sf /usr/lib/${pkgname}/$binname "$pkgdir"/usr/bin/$pkgname
}
