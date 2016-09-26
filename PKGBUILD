# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>

_pkgname=uzebox
pkgname=uzem-git
pkgver=r335.e5faef9
_gitver=e5faef9a287cc98ac9fae2ce99a0117c37be460a
pkgrel=1
pkgdesc="A ${_pkgname^} 8-bit game console emulator"
url="http://belogic.com/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL3')
depends=('sdl2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}-${pkgver}::"git+https://github.com/${_pkgname^}/$_pkgname.git#commit=$_gitver")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/${pkgname%-git}-$pkgver

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${pkgname%-git}-$pkgver/tools/${pkgname%-git}

  # Fix _FORTIFY_SOURCE configure failures and force C++98 standard
  CPPFLAGS+=" -O2 -std=gnu++98"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-schedule-insns2"

  make
}

package() {
  cd $srcdir/${pkgname%-git}-$pkgver

  install -d $pkgdir/usr/bin
  install -Dm755 $srcdir/${pkgname%-git}-$pkgver/tools/${pkgname%-git}/${pkgname%-git}    $pkgdir/usr/bin
  install -Dm755 $srcdir/${pkgname%-git}-$pkgver/tools/${pkgname%-git}/${pkgname%-git}dbg $pkgdir/usr/bin

  # License
  install -Dm644 gpl-3.0.txt $pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE
}
