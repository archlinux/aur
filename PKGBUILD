# Maintainer: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: SSF <punx69 at gmx dot net>

pkgname=thinkfan-git
pkgver=1.0_beta3.r35.1aa6ea0
pkgrel=2
pkgdesc="The minimalist fan control program"
arch=('i686' 'x86_64')
url="https://github.com/vmatare/thinkfan/"
license=('GPL3')
depends=('libatasmart' 'yaml-cpp')
makedepends=('boost' 'cmake' 'git')
optdepends=('lm_sensors: hwmon support')
provides=("thinkfan=$pkgver")
conflicts=("thinkfan")
source=("git+https://github.com/vmatare/thinkfan.git")
md5sums=('SKIP')

backup=(etc/systemd/system/thinkfan.service.d/override.conf)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cmake -DUSE_ATASMART:BOOL=ON \
        -DCMAKE_BUILD_TYPE:STRING="Release" \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_SBINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    .
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install DESTDIR="$pkgdir"

  install -dm755 "$pkgdir/usr/lib/modprobe.d/"
  echo "options thinkpad_acpi fan_control=1" > "$pkgdir/usr/lib/modprobe.d/thinkpad_acpi.conf"

  # fix systemd ExecStart
  sed -ri 's@^(ExecStart=/usr/)local/s(bin/thinkfan)$@\1\2@' "$pkgdir/usr/lib/systemd/system/thinkfan.service"
}
