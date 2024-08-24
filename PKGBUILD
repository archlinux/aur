# Maintainer: Blair Bonnett <blair.bonnett at gmail>
# Contributor: Doug Newgard (brewtarget PKGBUILD)
# Contributor: David Phillips <dbphillipsnz at gmail> (brewtarget PKGBUILD)
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget PKGBUILD)
# Contributor: Michael Straube <straubem@gmx.de> (previous brewtarget-git package)

pkgname=brewtarget-git
pkgver=4.0.2.r0.g0b1b936
pkgrel=1
pkgdesc="Brewing recipe designer and calculator (Git version)"
url='https://www.brewtarget.beer/'
arch=('x86_64')
license=('GPL-3.0-or-later AND WTFPL AND (CC-BY-SA-3.0 OR LGPL-3.0-or-later) AND LGPL-2.1-only')

conflicts=('brewtarget')
provides=('brewtarget')
depends=(
  'qt5-base'
  'qt5-multimedia'
  'qt5-svg'
  'xalan-c'
  'xerces-c'
)
optdepends=(
  'postgresql-libs: PostgreSQL database support'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'meson'
  'pandoc-bin'
  'qt5-tools'
)

source=(
  'git+https://github.com/Brewtarget/brewtarget.git'
  'git+https://github.com/tristanpenman/valijson'
)
sha256sums=(
  'SKIP'
  'SKIP'
)


pkgver() {
  cd brewtarget
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd brewtarget

  # Remove backtrace and boost's stacktrace_backtrace from the build. This
  # seems to be only provided by Debian.
  # https://github.com/Brewtarget/brewtarget/issues/723
  git rm third-party/libbacktrace
  sed -i "/boostModules += 'stacktrace_backtrace'/ {N;N;d}" meson.build
  sed -i "/compiler\.find_library('backtrace'/ {n;s/true/false/}" meson.build
  sed -i "s|, 'third-party/libbacktrace'||" meson.build

  # Configure the Git submodule for the header-only valijson library to point
  # to the local clone in our sources.
  git submodule init
  git config submodule.third-party/valijson.url "$srcdir/valijson"
  git -c protocol.file.allow=always submodule update

  # Disable static linking
  sed -i 's/static : true/static : false/g' meson.build

  # Don't screw with Arch's build flags
  sed -i '/if compiler.get_id/ s/gcc/disable/' meson.build
}

build() {
  meson setup --prefix=/usr brewtarget build
  meson compile -C build
}

# The tests just hang and time out. This appears to be how they are run in the
# Brewtarget CI. Disabled for now.
# check() {
#   QT_QPA_PLATFORM=offscreen QT_DEBUG_PLUGINS=1 meson test -C build
# }

package() {
  meson install -C build --destdir "$pkgdir"
}
