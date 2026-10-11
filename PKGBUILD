pkgname=fcitx5-areca-git
_pkgname=fcitx5-areca
_reponame=ArecaIME
pkgver=r187.07dc508
pkgrel=1
pkgdesc='Areca Vietnamese input method for Fcitx5 using the Bamboo engine'
arch=('x86_64')
url='https://github.com/xhkzeroone/ArecaIME'
license=('MIT')
depends=(
  'fcitx5'
  'libinput'
  'libei'
  'libportal'
  'systemd-libs'
  'sdl3'
  'fontconfig'
  'libx11'
  'libxtst'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'go'
  'ninja'
  'pkgconf'
  'dbus'
  'sdl3'
  'fontconfig'
  'libx11'
  'libxtst'
)
optdepends=('fcitx5-configtool: graphical configuration tool')
_bamboo_commit='b2e49a2b48c7d3772a3673142a7747eccd9d5f79'
source=(
  "${_pkgname}::git+${url}"
  "bamboo-core::git+https://github.com/BambooEngine/bamboo-core.git#commit=${_bamboo_commit}"
)
sha256sums=('SKIP' 'SKIP')
options=(!debug !strip)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${_pkgname}" submodule init
  git -C "${srcdir}/${_pkgname}" config \
    submodule.bamboo/bamboo-core.url "${srcdir}/bamboo-core"
  git -C "${srcdir}/${_pkgname}" -c protocol.file.allow=always \
    submodule update
}

build() {
  export CXXFLAGS+=" -ffile-prefix-map=${srcdir}=."
  export GOFLAGS="${GOFLAGS:-} -trimpath"
  cmake -S "${srcdir}/${_pkgname}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build --parallel
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --strip
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/bamboo/bamboo-core/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.bamboo-core"
}
