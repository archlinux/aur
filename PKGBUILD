# Maintainer:  dreieck
# Contributor: tuxce <tuxce;net@gmail.com>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>

# Based on the aur/yaourt-git PKGBUILD.

pkgname=yaourtix-git
pkgver=1.9.r3.gfe1bcdd
pkgrel=4

pkgdesc='Yaourt (= a pacman wrapper with extended features and AUR support) patched with user definable repo-support for building from source, and other customizepkg-enhancements. Artix support included.'
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=('GPL')
depends=(
  'package-query>=1.8'
  'pacman>=5.0'
)
makedepends=('git')
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
  "yaourt::git+https://github.com/archlinuxfr/yaourt.git"
  "abs-logic.sh::http://ix.io/1l0E"
  "yaourt_customizepkg-abort-on-error.patch::http://ix.io/1l0z"
  "abs-logic.patch::http://ix.io/1l0D"
  "abs.abort-on-error.patch::http://ix.io/1l0y"
)
sha256sums=(
  'SKIP'
  '918f828518854e944fbfade270a7d9f2969f663010315c1c0f0063842d068c8e'
  'b778a8f800c52a662bca9c981371b01f430838da0d2380bf6f8fcfba7d04d124'
  '33773ffaf79f0852ab80d477fab9939c15a5d648e6d5e94588e1ef5091485b08'
  'fd3f1beb524f3994a2086e4931fc6104c6a7640676ad9de2fea3796b2940c97d'
)

prepare() {
  cd yaourt/src
  for _patch in 'yaourt_customizepkg-abort-on-error.patch' 'abs-logic.patch' 'abs.abort-on-error.patch'; do
    msg "Applying patch '${_patch}' ..."
    patch -N -p1 --follow-symlinks -i "${srcdir}/${_patch}"
  done
}

pkgver () {
  cd yaourt/src
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
  cd yaourt/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var
}
 
package() {
  cd yaourt/src
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
  
  install -D -v -m755 "${srcdir}/abs-logic.sh" "${pkgdir}/etc/yaourtix/abs-logic.sh"
  
  cd "${pkgdir}/usr/bin"
  ln -sv 'yaourt' 'yaourtix'
}
