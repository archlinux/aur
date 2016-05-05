# Contributor: SSF <punx69 at gmx dot net>

pkgname=thinkfan-git
pkgver=1.0_beta1.r1.72bb1ff
pkgrel=1
pkgdesc="The minimalist fan control program"
arch=('i686' 'x86_64')
url="https://github.com/vmatare/thinkfan/"
license=('GPL3')
depends=('libatasmart')
makedepends=('cmake' 'git')
optdepends=('lm_sensors: hwmon support')
provides=("thinkfan=$pkgver")
conflicts=("thinkfan")
source=("git+https://github.com/vmatare/thinkfan.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  # fix cmake file
  sed -i 's/^\(install(FILES \)NEWS /\1/' CMakeLists.txt

  cmake -DUSE_ATASMART:BOOL=ON \
        -DCMAKE_BUILD_TYPE:STRING="Release" \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    .
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install DESTDIR="$pkgdir"

  install -dm755 "$pkgdir/usr/lib/modprobe.d/"
  echo "options thinkpad_acpi fan_control=1" > "$pkgdir/usr/lib/modprobe.d/thinkpad_acpi.conf"

  # install systemd files
  install -dm755 "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 rcscripts/systemd/*.service "$pkgdir/usr/lib/systemd/system/"
}
