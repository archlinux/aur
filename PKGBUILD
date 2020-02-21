# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Samuel Kesterson <arch@k-labs.com>

pkgname=brother-hl4150cdn
pkgver=1.1.1
pkgrel=5
pkgdesc='Brother HL-4150CDN CUPS printer driver'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=hl4150cdn_all&os=127&flang=English'
license=('custom:Brother' 'GPL')
depends=('a2ps' 'cups')
makedepends=('libarchive')
depends_x86_64=('lib32-glibc')
install=brother-hl4150cdn.install
source=(0001-brother-hl4150cdn.patch
        Brother.license
        "http://download.brother.com/welcome/dlf005939/hl4150cdnlpr-${pkgver}-${pkgrel}.i386.rpm"
        "http://download.brother.com/welcome/dlf005941/hl4150cdncupswrapper-${pkgver}-${pkgrel}.i386.rpm")
sha512sums=('bd788b498d4c453608540a88216c2ff6f7008ef4a5de1dfd5e6ccb928bd29380deb335697e2dd44e34576cb7f6afb03e6e8b0c1eb1ea28556cf8d6fb1cae6d60'
            '109215f5c3f835b5923d1334ab2812a2faf859a3fa813a214116b44fc3c14a2022deeb0a4a5c6be5a99833cd7b5997cf02b33f2fa13391b7cb02a3cb15e74bb0'
            '999d04ea915fea49e5a80dc2bda848579b1956d708ca14eccba3605a0866d9bbde03d757bb550e0ad8752d6fc3ad13fb2f9844c2d60c63b5a2e773b7204fa251'
            '061e8b777b3a8b6c592d4ac5a99b6782acbdc43b1f4ed85d17f8a91560be136f9c4274a58eff583d18ede7d67e583779fdb8ba7f0b407e6e7bcd89f2119fa4f8')

build() {
  for n in *.rpm; do
    bsdtar xf ${n}
  done

  patch -p1 < 0001-brother-hl4150cdn.patch
}

package() {
  install -d "${pkgdir}"/usr/share
  cp -R usr/bin "${pkgdir}"/usr
  cp -R usr/local/Brother "${pkgdir}"/usr/share/Brother

  # Fixing paths...
  find "${pkgdir}" -type f -exec sed -i s#/usr/local/Brother#/usr/share/Brother#g {} \;

  # Installing PPD
  mkdir -p "${pkgdir}"/usr/share/cups/model/

  PKGDIR="${pkgdir}" SRCDIR="${srcdir}" DESTDIR="${pkgdir}" DRIVER_PREFIX=/usr/share/Brother \
  usr/local/Brother/Printer/hl4150cdn/cupswrapper/cupswrapperhl4150cdn -s

  rm "${pkgdir}"/usr/share/Brother/Printer/hl4150cdn/cupswrapper/cupswrapperhl4150cdn
  rm "${pkgdir}"/usr/share/Brother/Printer/hl4150cdn/inf/setupPrintcapij

  chown root:lp "${pkgdir}"/usr/share/Brother/Printer/hl4150cdn/inf
  chmod 775 "${pkgdir}"/usr/share/Brother/Printer/hl4150cdn/inf
  chown daemon:lp "${pkgdir}"/usr/share/Brother/Printer/hl4150cdn/inf/brhl4150cdnrc
  chmod 664 "${pkgdir}"/usr/share/Brother/Printer/hl4150cdn/inf/brhl4150cdnrc
  install -Dm644 Brother.license "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
