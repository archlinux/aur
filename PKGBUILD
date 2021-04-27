# Maintainer: Carsten Haitzler <raster@rasterman.com>
# Contributor: Gavin Fernandes <gavinfernandes2012@gmail.com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

# Performance note: If you want to run on Nvidia closed drivers in X11
# only then please remove the -Dwl=true line below in build().
# You will lose wayland support but it's not going to work well (with
# acceleration) on proprietary nvidia drivers anyway. If you don't
# disable this line and option then you'll find performance degreads in
# enlightenment.

_pkgname=enlightenment
pkgname=$_pkgname-git
pkgver=0.24.99.24572.gea14bdf0d
pkgrel=1
pkgdesc="Enlightenment window manager - Development version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git' 'udisks2' 'wayland' 'bluez-libs' 'libexif'
         'xorg-server-xwayland' 'bluez' 'pulseaudio' 'connman' 'bc')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot' 'ccache')
optdepends=('acpid: power events on laptop lid close - almost essential for any ACPI based system like intel'
            'gdb: create backtraces on crash - needed for getting backtraces at crash time in ~/.e-crashdump.txt'
            'geoclue2: needed for geolocation module'
            'packagekit: needed for packagekit module'
            'ddcutil: from AUR needed for desktop monitor backlight etc. controls')
provides=("$_pkgname=$pkgver" 'notification-daemon')
conflicts=("$_pkgname")
backup=('etc/enlightenment/sysactions.conf'
        'etc/enlightenment/system.conf'
        'etc/xdg/menus/e-applications.menu')
options=('debug' 'ccache')
source=("git+https://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(grep version meson.build | head -1 | sed s/version//g | tr ":'," "   " | awk '{print $1}' | tr "-" ".")

  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  rm -rf build
  meson --prefix=/usr \
    -Dwl=true \
    . build
  ninja -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
