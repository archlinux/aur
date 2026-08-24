# Maintainer: swim <swim853279614@163.com>

pkgname=plasma-nethogs-git
_srcname=plasma-nethogs
pkgver=r6.g88c78a8
pkgrel=1
pkgdesc="Plasma 6 widget showing which applications are using the network, fed by an eBPF collector"
arch=('x86_64' 'aarch64')
url="https://github.com/swim233/plasma-nethogs"
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'kcmutils'
  'kirigami'
  'ksvg'
  'libbpf'
  'libplasma'
  'libstdc++'
  # plasmashell, which hosts the applet. No file in the package points at it,
  # so namcap reports it as possibly unneeded; it is not.
  'plasma-workspace'
  'plasma5support'
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'bpf'
  'clang'
  'cmake'
  'extra-cmake-modules'
  'git'
  'kpackage'
  'ninja'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("${_srcname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # vmlinux.h is generated from /sys/kernel/btf/vmlinux, so the build machine's
  # kernel needs CONFIG_DEBUG_INFO_BTF=y. devtools chroots mount /sys, so a
  # clean-chroot build works. CO-RE resolves the relocations against whatever
  # kernel is running at load time, so the result is not tied to this one.
  cmake -S "$_srcname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_srcname/README.md" \
    "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
