# Maintainer: honjow <honjow@gmail.com>

pkgname=ally-motion-evdev-git
_pkgname=ally-motion-evdev
pkgver=r114.b9b9aab
pkgrel=1
pkgdesc="Tool to redirect ROG Ally accelerometer and gyro data from iio to evdev for use in games and applications."
arch=('x86_64')
url="https://github.com/KWottrich/ally-motion-evdev"
makedepends=('git' 'cmake' 'gcc' 'make')
source=("git+https://github.com/KWottrich/ally-motion-evdev.git"
        "ally-motion-evdev.service"
        "65-bmi323.rule"
        )
sha256sums=('SKIP'
            'a45e68ebac79aef1f6ff2381834369702f7f33cb3ddd2d2079fa9e9487fefd50'
            '6954a9e1c614be8ff7ebf5456713d31735f1d3b0dfc92365e2c378ca3e99de6d'
            )

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install

  # service file
  install -Dm644 "$srcdir/ally-motion-evdev.service" "$pkgdir/usr/lib/systemd/system/ally-motion-evdev.service"

  # udev rule
  install -Dm644 "$srcdir/65-bmi323.rule" "$pkgdir/usr/lib/udev/rules.d/65-bmi323.rule"
}
