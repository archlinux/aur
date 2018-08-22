# Maintainer:  dreieck
# Contributor: tuxce <tuxce;net@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>

# Based on the aur/yaourt PKGBUILD.

pkgname=yaourtix
pkgver=1.9
pkgrel=1
pkgdesc='Yaourt (= a pacman wrapper with extended features and AUR support) patched with user definable repo-support for building from source, and other customizepkg-enhancements.'
arch=('any')
url="https://github.com/archlinuxfr/yaourt"
license=('GPL')
depends=(
  'package-query>=1.8'
  'pacman>=5.0'
)
optdepends=(
  'aurvote: Vote for your favorite AUR packages.'
  'git: Retrieve PKGBUILDs from Artix Linux and other repositories.'
  'subversion: Retrieve PKGBUILDs from some unofficial user repositories.'
  'customizepkg: Automatically modify PKGBUILD during install/upgrade.'
)
provides=(
  "yaourt=${pkgver}"
  "yaourt-git=${pkgver}"
  "yaourtix=${pkgver}"
)
conflicts=(
  "yaourt"
  "yaourt-git"
  "yaourtix"
)
backup=(
  "etc/yaourtrc"
  "etc/yaourtix/abs-logic.sh"
)
source=(
  "yaourt-${pkgver}.tar.gz::https://github.com/archlinuxfr/yaourt/releases/download/${pkgver}/yaourt-${pkgver}.tar.gz"
  "abs-logic.sh::http://ix.io/1kYS"
  "yaourt_customizepkg-abort-on-error.patch::http://ix.io/STN"
  "abs-logic.patch::http://ix.io/1kYR"
  "abs.abort-on-error.patch::http://ix.io/1kYT"
)
sha256sums=(
  '9a485cef9d50e80b8abae5dbb147e09bdeb8818d29316b65e892fb560c48517d'
  'eb03ef2c373b3e1f0128a96870fcd50c11d56041b6a56c92c5109ce3b54083e8'
  '99ee7a66e5468d9a95fa855ed245234224961159e85f215a9705410fa393a84f'
  '90a28218294ee2ba70193e9b5a77aab982f0ceae3800e8157e37f675fc1093f2'
  '1b0f81e2a516777922ab312d46ab2a95a679af556ca4dba84f9868bf9797511e'
)

prepare() {
  cd "yaourt-${pkgver}"
  for _patch in 'yaourt_customizepkg-abort-on-error.patch' 'abs-logic.patch' 'abs.abort-on-error.patch'; do
    msg "Applying patch '${_patch}' ..."
    patch -N -p1 --follow-symlinks -i "${srcdir}/${_patch}"
  done
}

build() {
  cd "yaourt-${pkgver}"
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var
}
 
package() {
  cd "yaourt-${pkgver}"
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
  
  install -D -v -m755 "${srcdir}/abs-logic.sh" "${pkgdir}/etc/yaourtix/abs-logic.sh"
  
  cd "${pkgdir}/usr/bin"
  ln -sv 'yaourt' 'yaourtix'
}
