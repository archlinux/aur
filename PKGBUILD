# Maintainer: Florian Dejonckheere <florian[at]floriandejonckheere.be>
# Contributor: Corrado Primier <ilbardo.gmail.com>

pkgname=truecrypt-nogui
_pkgname=truecrypt
pkgver=7.1a
pkgrel=1
pkgdesc="Free open-source cross-platform disk encryption software (CLI)"
url="http://www.truecrypt.org/"
arch=('i686' 'x86_64')
license=('custom:truecrypt')
depends=('fuse>=2.8.0' 'device-mapper')
makedepends=('nasm')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
conflicts=('truecrypt')
provides=('truecrypt')
# N.B. Truecrypt's web-based source download is incompatible with
# makepkg. Source has been placed on ftp.archlinux.org instead
source=("ftp://ftp.archlinux.org/other/tc/${_pkgname}-${pkgver}.tar.gz" \
        'ftp://ftp.archlinux.org/other/tc/pkcs-2.20.tar.gz'\
        'http://prdownloads.sourceforge.net/wxwindows/wxWidgets-2.8.12.tar.gz')
md5sums=('102d9652681db11c813610882332ae48'
         'ce6a707b79411e82e8e558aa03e764b0'
         '2fa39da14bc06ea86fe902579fedc5b1')

# Source: http://kenfallon.com/truecrypt-on-a-respberry-pi-no-gui/
build() {
  export PKCS11_INC="${srcdir}/pkcs-2.20"
  cd ${srcdir}/${_pkgname}-${pkgver}-source
  make NOGUI=1 WX_ROOT="${srcdir}/wxWidgets-2.8.12" wxbuild
  make NOGUI=1 WXSTATIC=1
}

package() {
  # Install Binary
  install -D -m755 ${srcdir}/${_pkgname}-${pkgver}-source/Main/${_pkgname} \
    ${pkgdir}/usr/bin/${_pkgname}

  # Install License
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}-source/License.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/License.txt
}
