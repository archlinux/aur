_pkgname=polybar-dwm
_pkgver=3.7.1
pkgname="${_pkgname}-git"
pkgver=3.7.1.r0.g09eac084
pkgrel=1
pkgdesc="polybar fork with a dwm module"
arch=("i686" "x86_64")
url="https://github.com/pgrondek/${_pkgname}"
license=("MIT")
depends=("cairo" "xcb-util-image" "xcb-util-wm" "xcb-util-xrm" "xcb-util-cursor"
         "alsa-lib" "libpulse" "libmpdclient" "libnl" "jsoncpp" "curl")
optdepends=("i3-wm: i3 module support"
            "ttf-unifont: Font used in example config"
            "siji-git: Font used in example config"
            "xorg-fonts-misc: Font used in example config")
makedepends=("cmake" "git" "python" "pkg-config" "python-sphinx" "i3-wm")
provides=("polybar")
conflicts=("polybar")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  git -C "${_pkgname}" describe --long --all | sed "s/-/.r/;s/-/./g" | sed "s/heads\/master/${_pkgver}/g"
}

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build" || exit 1
  # Force cmake to use system python (to detect xcbgen)
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
