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
b2sums=('fb972e5d2b1f6154800cca0c81f2344a45e1b5fe4bcbb69c1f72c5e3ff50e5a50951acb8a564b5e5851ab0f8d86df992642d86867d49f41d60245548735e733a'
        '324d06c56e852a1aa5b9d71c8c6495913a4483d55d5360d7adb8e563090d55185de724e7a8588a6787d4ce75c476d1dc49ddd6c2a8daed4f27f96dd98255bf14'
        '9295cd34aca9e4912e64314870e4e3cad7333592f2f10014fd4160e04fa01e3b5e0f7a62467648ea3f01914866122c3aba79d2017f4d6cfc0f930782c7f36b1c'
        '20d0fcf390113cc08b81dcf5edb5376a3bdc92a0d1f2e61437d07628b1b44edbe35f4c3f904c944bb601fddab14dab706958e18f565b19da16428d6160745f92')

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
