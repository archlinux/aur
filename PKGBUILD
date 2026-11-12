pkgname=ibus-areca-git
_pkgname=ibus-areca
pkgver=r32.2b7f74e
pkgrel=1
pkgdesc='Areca Vietnamese input method for IBus using the Bamboo engine'
arch=('x86_64')
url='https://github.com/xhkzeroone/ibus-areca'
license=('MIT')
depends=(
  'ibus'
  'glib2'
  'libxkbcommon'
  'gtk4'
  'python'
  'python-gobject'
  'gdk-pixbuf2'
  'libinput'
  'libei'
  'libportal'
  'systemd-libs'
  'dbus'
  'libx11'
  'libxtst'
)
makedepends=(
  'cmake'
  'git'
  'go'
  'ninja'
  'pkgconf'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
options=(!debug)
_bamboo_commit='b2e49a2b48c7d3772a3673142a7747eccd9d5f79'
source=(
  "${_pkgname}::git+${url}.git"
  "bamboo-core::git+https://github.com/BambooEngine/bamboo-core.git#commit=${_bamboo_commit}"
)
sha256sums=('SKIP' 'SKIP')

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
    -DCMAKE_INSTALL_LIBEXECDIR=lib/ibus \
    -DBUILD_TESTING=ON
  cmake --build build --parallel
  test -x build/ibus-engine-areca
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
