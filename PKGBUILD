# Maintainer: Carsten Haitzler <raster@rasterman.com>

# Performance note: If you want to run on Nvidia closed drivers in X11
# only then please remove the -Dwl=true line below in build().
# You will lose wayland support but it's not going to work well (with
# acceleration) on proprietary nvidia drivers anyway. If you don't
# disable this line and option then you'll find performance degreads in
# enlightenment.

_pkgname=enlightenment
pkgname=$_pkgname-git-asan
pkgver=0.25.99.24774.gc8b1077de
pkgrel=1
pkgdesc="Enlightenment window manager - Development version - Asan debug build"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git' 'udisks2' 'wayland' 'bluez-libs' 'libexif'
         'xorg-server-xwayland' 'bluez' 'pulseaudio' 'connman' 'bc')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gcc' 'binutils' 'fakeroot' 'ccache' 'wayland-protocols')
optdepends=('acpid: power events on laptop lid close - almost essential for any ACPI based system like intel'
            'gdb: create backtraces on crash - needed for getting backtraces at crash time in ~/.e-crashdump.txt'
            'geoclue2: needed for geolocation module'
            'packagekit: needed for packagekit module'
            'ddcutil: from AUR needed for desktop monitor backlight etc. controls')
provides=("$_pkgname=$pkgver" $_pkgname-git=$pkgver 'notification-daemon')
conflicts=("$_pkgname" $_pkgname-git=$pkgver)
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/e-applications.menu')
options=('!strip' 'ccache')
source=("git+https://git.enlightenment.org/enlightenment/$_pkgname.git"
        "enlightenment_start")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(grep version meson.build | head -1 | sed s/version//g | tr ":'," "   " | awk '{print $1}' | tr "-" ".")

  printf "%s.%s.g%s" "$v_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export ASAN_OPTIONS="detect_leaks=0:abort_on_error=1::new_delete_type_mismatch=0"

  unset CPPFLAGS
  export CFLAGS="-O0 -g3"
  export CXXFLAGS="-O0 -g3"
  rm -rf build
  meson --prefix=/usr \
    -Db_sanitize=address \
    -Dwl=true \
    . build
  ninja -C build
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING

  mv "$pkgdir/usr/bin/enlightenment_start" "$pkgdir/usr/bin/enlightenment_start_real"
  install -Dm755  -t "$pkgdir/usr/bin/" "$srcdir/enlightenment_start"
}

backup=(etc/enlightenment/{sysactions.conf,system.conf})
