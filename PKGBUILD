# Maintainer: Doug Newgard <dnewgard at outlook dot com>
# Maintainer : David Phillips <dbphillipsnz at gmail>
# Contributor: Ricardo Leuck <leuck.r at gmail> (original brewtarget-git PKGBUILD)

pkgname=brewtarget
pkgver=4.2.1
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="https://www.brewtarget.beer/"
arch=('x86_64' 'i686')
license=('GPL-3.0-or-later AND WTFPL AND (CC-BY-SA-3.0 OR LGPL-3.0-or-later) AND LGPL-2.1-only')
depends=('openssl' 'qt6-base' 'qt6-multimedia' 'qt6-svg' 'xalan-c' 'xerces-c')
makedepends=('boost' 'clang' 'cmake' 'git' 'meson' 'ninja' 'pandoc' 'qt6-declarative' 'qt6-tools')
source=("git+https://github.com/Brewtarget/brewtarget.git#tag=v${pkgver}"
        "git+https://github.com/tristanpenman/valijson.git")
sha512sums=('72aa256e61b6a42c4ecf3d86c9729678dc7a548cdc60c228b9d2ec9bf1776b1488af43f624a2b845ed8b01a155f83a3de2017b692561ab5a4b94c9564a325e4c'
            'SKIP')

prepare() {
  cd ${pkgname}

# valijson submodule is now required
  git submodule init third-party/valijson
  git config submodule.third-party/valijson.url "$srcdir/valijson"
  git -c protocol.file.allow=always submodule update

# Disable boost-stacktrace_backtrace, requires an optional boost lib that's only built in Debianland
  sed -i "/boostModules += 'stacktrace_backtrace'/ {N;N;d}" meson.build
# Make libbacktrace not required, we're not running the bt script
  sed -i "/compiler\.find_library('backtrace'/ {n;s/true/false/}" meson.build
# Disable static linking
  sed -i 's/static : true/static : false/g' meson.build
# Don't screw with Arch's build flags
  sed -i '/if compiler.get_id/ s/gcc/disable/' meson.build
}

build() {
  PATH="$PATH:/usr/lib/qt6/bin/" \
  meson setup --prefix=/usr ${pkgname} build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja install -C build
  install -Dm644 "${pkgname}/COPYRIGHT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
