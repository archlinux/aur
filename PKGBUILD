# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Vincent Grabner <frankenfruity at protonmail dot com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrothergoogle dot com>

_applet_name=plasma-pstate
pkgname=plasma5-applets-${_applet_name}
pkgver=2.0.0
pkgrel=1
pkgdesc="Intel P-state and CPUFreq Manager Widget"
url="https://github.com/frankenfruity/$_applet_name"
arch=('x86_64')
license=('GPL2')
depends=('plasma-framework')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=("libsmbios: Dell's Thermal Management Feature"
            "x86_energy_perf_policy: For processors without the EPP support EPP i.e. older generations without HWP")
source=(
  $pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz"
  )
sha256sums=('9e5bf2852f43f1187ab8e4e706c4aa2f9375f1050a61c2b935d78b2ceef7d19b')

prepare() {
  mkdir "${srcdir}/build"
}

build () {
  cd "${srcdir}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        "${srcdir}/${_applet_name}-${pkgver}"
  make
}

package() {
  _polkit_dir="$pkgdir/usr/share/polkit-1/actions"

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_applet_name}-${pkgver}"
  mkdir -p "$_polkit_dir"
  install -m 644  "src/plasma_pstate.policy" "$_polkit_dir"
}
