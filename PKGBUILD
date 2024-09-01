# Maintainer: Edgar Vincent <e-v@posteo.net>
# Contributor: lectrode <electrodexsnet at gmail dot com>
_pkgname=waked
pkgname=${_pkgname}-git
pkgver=v0.1.1.r0.g05729fb
pkgrel=2
pkgdesc="Daemon to let other applications wake up the system"
url="https://gitlab.com/seath1/waked"
license=('GPL2')
arch=('aarch64' 'x86_64')
depends=(sdbus-cpp)
makedepends=(git cmake)
provides=("${_pkgname}=${pkgver:0:6}")
install="${_pkgname}.install"
source=(
  "git+https://gitlab.com/seath1/waked.git"
  "0002-Include-typedef-for-uint64_t-fixes-compilation.patch"
  "0003-use-relative-times-for-broken-RTCs.patch"
)
b2sums=(
  'SKIP'
  '9ed60148f313b6b9038775eb36b5a7d54d21f3e5224f244834784fae288ddf6f543b8327a0571363d14678bd54039e8e62bf5694466406c7228505b538730813'
  'f16dddeebea8a3b370179eddd97bd675202f04cd9db91040acebcd9482ff48b49e1d9f50873289b9e6561b0d5344a8e28a1d92f7faec1a3a48fd3604bee1db0c'
)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  #https://gitlab.alpinelinux.org/alpine/aports/-/commit/bfc0a8a016a823b9470dddfb603f41a3460500bc
  echo "patch: fix compiling..."
  patch -p1 -i "$srcdir/0002-Include-typedef-for-uint64_t-fixes-compilation.patch"
  echo "patch: fix wake feature on select hardware..."
  patch -p1 -i "$srcdir/0003-use-relative-times-for-broken-RTCs.patch"
}

build() {
  cd "$_pkgname"
  cmake src
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 waked "${pkgdir}"/usr/bin/waked
  install -Dm644 waked.service "${pkgdir}"/usr/lib/systemd/system/waked.service
  install -Dm644 de.seath.Waked.conf "${pkgdir}"/usr/share/dbus-1/system.d/de.seath.Waked.conf
}
