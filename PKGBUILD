# Maintainer: Cynthetika Open Source <openDOTsourceATcynthetikaDOTcom>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Vincent Grabner <frankenfruity at protonmail dot com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrothergoogle dot com>

_applet_name=plasma-pstate
pkgname=plasma5-applets-${_applet_name}-git
_pkgname=${pkgname%-git}
pkgver=r307.6abb0a9
pkgrel=3
pkgdesc="\"P-state and CPUFreq Manager\" CPU/GPU performance management widget/plasmoid - includes fix for governor combobox bug - maintained(-ish) fork ('dev' branch) by GitHub user \"frankenfruity\" including CPU hotplug support"
url="https://github.com/frankenfruity/plasma-pstate/tree/dev"
arch=('x86_64')
license=('GPL2')
depends=('plasma-framework' 'kcoreaddons5' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('git' 'gcc' 'cmake' 'extra-cmake-modules'
                                'ki18n5' 'kcoreaddons5'
                                'qt5-base' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2')
optdepends=("libsmbios: to enable vendor-specific features (such as advanced thermal management on some Dell platforms)"
                            "x86_energy_perf_policy: for older processors missing \"EPP\" support (i.e. older generations without \"HWP\")")
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=($_applet_name::"git+${url%/tree/dev}.git#branch=dev"
                 "update-metadata-with-new-url-and-updated-description.patch"
                 "fix-governor-selection-combobox-definition-to-permit-correct-clickable-display.patch"
                 "alternative-patch-to-replace-governor-selection-combobox-with-radio-selector-buttons.patch")
sha256sums=('SKIP'
            '46feaa3b3c1616f19f403e41b998ee774a72bb9373c4b93599afba199d9bee19'
            'e92e5bea66f4eab1b8aa7597aa9115fde74287c703f46cdbff47cf49aa48de1f'
            '08fd7f7df19de1ceb534da08453cf15a9a6e92172d266972698103009139d47e')


pkgver() {
  cd "${srcdir}/${_applet_name}"

  ## Update package version based on the commit checked out for this build.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "${srcdir}/${_applet_name}"

  ## Replace user-displayed plasmoid name and description to more accurately reflect function
  ## (as it provides non-Intel CPU and also limited GPU management).
  git apply "${srcdir}/update-metadata-with-new-url-and-updated-description.patch"

  ## Apply patch to fix intermittent issue with display of governor selection combobox.
  git apply "${srcdir}/fix-governor-selection-combobox-definition-to-permit-correct-clickable-display.patch"
  ## NOTE: The alternative patch below replaces the combobox with a list using selection via large radio buttons.
  ##               This takes up more space but definitely resolves the issue, so if you are still having issues with the
  ##               governor selection combobox not displaying correctly please try changing to the following alternative patch
  ##               (i.e. "comment" the above patch by prepending a hashtag to disable it and remove the hashtag on the
  ##               following line to enable it - you will also need to remove the previously built package or increment the pkgrel).
  #git apply "${srcdir}/alternative-patch-to-replace-governor-selection-combobox-with-radio-selector-buttons.patch"

  ## Explicitly create build output directory if not already present.
  mkdir -p "${srcdir}/${_applet_name}/build"
}


build () {
  cd "${srcdir}/${_applet_name}/build"

  ## Generate Makefile for build.
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_BUILD_TYPE=Release \
                -DKDE_INSTALL_LIBDIR=lib \
                -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                "${srcdir}/${_applet_name}"

  ## Invoke make to initiate actual build.
  make
}


package() {
  cd "${srcdir}/${_applet_name}/build"

  ## Install built plasmoid to intermediate packaging directory.
  make DESTDIR="${pkgdir}" install

  ## Install required polkit policy to allow use by non-root users.
  mkdir -p "${pkgdir}/usr/share/polkit-1/actions"
  install -m 644  "${srcdir}/${_applet_name}/src/plasma_pstate.policy" "${pkgdir}/usr/share/polkit-1/actions"
}

