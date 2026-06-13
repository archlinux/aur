# Maintainer: yhshzh0 <yhshzh0@gmail.com>

pkgname=libfprint-fpc-10a5-9924-git
pkgver=1.94.10.r45.g0dc384b
pkgrel=1
pkgdesc="Patched libfprint with experimental Fingerprint Cards 10a5:9924 support"
arch=('x86_64')
url="https://github.com/Terrydaktal/libfprint-fpc-10a5-9924"
license=('LGPL-2.1-or-later')
groups=('fprint')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'libgudev'
  'libgusb'
  'openssl'
  'pixman'
)
makedepends=(
  'git'
  'glib2-devel'
  'meson'
  'systemd'
)
optdepends=(
  'fprintd: D-Bus service and command-line tools for fingerprint enrollment and verification'
)
provides=(
  "libfprint=${pkgver}"
  'libfprint-2.so=2-64'
)
conflicts=(
  'libfprint'
  'libfprint-git'
)
source=(
  'libfprint::git+https://gitlab.freedesktop.org/libfprint/libfprint.git'
  "${pkgname}-patches::git+https://github.com/Terrydaktal/libfprint-fpc-10a5-9924.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd libfprint

  git describe --tags --long --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd libfprint

  git reset --hard
  git clean -xdf

  git apply "${srcdir}/${pkgname}-patches/patches/0001-fpcmoc-add-10a5-9924-experimental-support.patch"

  if ! grep -q '^usb:v10A5p9924\*' data/autosuspend.hwdb; then
    if grep -q '^usb:v10A5p9B24\*' data/autosuspend.hwdb; then
      sed -i '/^usb:v10A5p9B24\*/a usb:v10A5p9924*' data/autosuspend.hwdb
    else
      printf '\nusb:v10A5p9924*\n' >> data/autosuspend.hwdb
    fi
  fi
}

build() {
  arch-meson libfprint build \
    -Ddrivers=fpcmoc \
    -Ddoc=false \
    -Dintrospection=false \
    -Dinstalled-tests=false

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
