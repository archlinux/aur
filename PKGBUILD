# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ldraw-parts-library
pkgver=20251027
pkgrel=1
pkgdesc="A collection of LDraw-format CAD files representing many of LEGO bricks produced"
arch=(any)
url="https://library.ldraw.org/updates"
license=('CCPL: cc-by-2.0')
options=(!strip)
source=("$pkgname-$pkgver.zip::https://library.ldraw.org/library/updates/complete.zip"
        "$pkgname.sh"
        "license")
sha256sums=('bf3ff5027b28f6f663a5fce5364771e65837be0aff1aca2b306aa0b15e3ac806'
            '7cbd598861cc678e86ce07da220e97d0f9d27f2b8d0d03b794400b999fd6fc42'
            '783990d0de8daf6b0e18b1c06578438f7d70e106a1a351686872d8d6eeeba7ac')

xpkgver() {
  local version=$(grep -oP '^0 !LDRAW_ORG Configuration UPDATE \K.+$' "$srcdir/ldraw/LDConfig.ldr")
  echo ${version//[^0-9]/}
}

package() {
  cd "${srcdir}/ldraw/"

  # Install data
  mkdir -p                      "${pkgdir}/usr/share/ldraw"
  mv LDConfig.ldr               "${pkgdir}/usr/share/ldraw/"
  mv p                          "${pkgdir}/usr/share/ldraw/"
  mv parts                      "${pkgdir}/usr/share/ldraw/"

  # Fix permissions
  find "${pkgdir}/usr/share/ldraw" -type f -exec chmod 644 {} +
  find "${pkgdir}/usr/share/ldraw" -type d -exec chmod 755 {} +

  # Install the old version 2.0 CC-by license
  install -D -m644 ../license                "${pkgdir}/usr/share/licenses/${pkgname}/license"

  install -D -m755 ../ldraw-parts-library.sh "${pkgdir}/etc/profile.d/ldraw-parts-library.sh"
}
