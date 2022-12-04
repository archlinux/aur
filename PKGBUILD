# Maintainer: Cynthetika Open Source <openDOTsourceATcynthetikaDOTcom>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Vincent Grabner <frankenfruity at protonmail dot com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrothergoogle dot com>

_applet_name=plasma-pstate
pkgname=plasma5-applets-${_applet_name}-git
_pkgname=${pkgname%-git}
pkgver=r307.6abb0a9
pkgrel=2
pkgdesc="Intel P-state and CPUFreq Manager Widget - git 'dev' branch"
url="https://github.com/frankenfruity/$_applet_name/tree/dev"
arch=('x86_64')
license=('GPL2')
depends=('plasma-framework'
         'qt5-graphicaleffects')
makedepends=('git' 'gcc' 'cmake' 'extra-cmake-modules'
             'ki18n' 'kcoreaddons'
             'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2')
optdepends=("libsmbios: Dell's Thermal Management Feature"
            "x86_energy_perf_policy: For processors without the EPP support EPP i.e. older generations without HWP")
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=($_applet_name::"git+${url%/tree/dev}.git#branch=dev"
        "update-metadata-with-new-url-and-updated-description.patch")
sha256sums=('SKIP'
            'c8e3a26d40cf6f305dcd41f9c8d0614b9beb2cce841648892aa166054980bf8c')


pkgver() {
  cd "${srcdir}/${_applet_name}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "${srcdir}/${_applet_name}"

  git apply "${srcdir}/update-metadata-with-new-url-and-updated-description.patch"

  mkdir "${srcdir}/${_applet_name}/build"
}


build () {
  cd "${srcdir}/${_applet_name}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        "${srcdir}/${_applet_name}"

  make
}


package() {
  _polkit_dir="${pkgdir}/usr/share/polkit-1/actions"

  cd "${srcdir}/${_applet_name}/build"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_applet_name}"
  mkdir -p "$_polkit_dir"
  install -m 644  "src/plasma_pstate.policy" "$_polkit_dir"
}

