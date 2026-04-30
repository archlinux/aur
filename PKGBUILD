pkgname=fuzzel-ime-git
pkgver=1.14.1.r4.g02f7346
pkgrel=2
pkgdesc="Fuzzel(a wayland launcher) with Input Method support."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/dnkl/fuzzel"
license=('MIT')
depends=('fcft' 'libxkbcommon' 'pixman' 'tllist' 'wayland' 'glibc')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland-protocols')
provides=("fuzzel=${pkgver}")
conflicts=('fuzzel' 'fuzzel-git')
source=("fuzzel::git+https://codeberg.org/dnkl/fuzzel.git#branch=master"
        "ime-support.patch")
sha256sums=('SKIP'
            '2c912de8ccdeac16ae1493b681d01b8937ecfde6b8d3fa66093b8185a7df88d3')

pkgver() {
  cd fuzzel
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd fuzzel
  patch -Np1 -i "${srcdir}/ime-support.patch"
}

build() {
  arch-meson fuzzel build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 fuzzel/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
