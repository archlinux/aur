# Maintainer: Ash <xash at riseup d0t net>

pkgname=iw4x-launcher-git
_upstream=launcher
pkgver=1.1.8.b.18.r1.ge7995e4
pkgrel=1
pkgdesc='Launcher/Updater for the IW4x MW2 (2009) mod'
arch=('x86_64')
url='https://github.com/iw4x/launcher'
license=('GPL3')
provides=('iw4x-launcher')
conflicts=('iw4x-launcher')
makedepends=('build2>=0.18' 'git' 'boost' 'pkgconf')
depends=('glibc' 'perl')
options=('!lto')

source=("$_upstream::git+https://github.com/iw4x/launcher.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_upstream"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_upstream"

  local _config_marker="$srcdir/launcher-gcc/.iw4x-arch-static"

  if [[ -d .bdep && -d ../launcher-gcc && -f "$_config_marker" ]]; then
    return
  fi

  rm -rf .bdep .bdep.tmp ../launcher-gcc ../launcher-host

  bdep init --no-sync -C @gcc --no-auto-sync \
    cc config.c=/usr/bin/gcc config.cxx=/usr/bin/g++ \
    config.bin.lib=static \
    config.c.loptions="-static-libgcc" \
    config.cxx.loptions="-static-libgcc -static-libstdc++"

  touch "$_config_marker"
}

build() {
  cd "$srcdir/$_upstream"
  bdep sync --yes --create-host-config
  b
}

check() {
  cd "$srcdir/$_upstream"
  b test
}

package() {
  cd "$srcdir/$_upstream"

  install -Dm755 "$srcdir/launcher-gcc/launcher/launcher/iw4x-launcher" \
    "$pkgdir/usr/bin/iw4x-launcher"

  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
