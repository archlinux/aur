# Maintainer: levinion <levinnion@gmail.com>
pkgname=foot-lv
_pkgname=foot
pkgver=1.24.0.r3.g44a674ed
pkgrel=1
pkgdesc="foot (https://codeberg.org/dnkl/foot) with custom patches"
url=" 	https://codeberg.org/dnkl/foot"
conflicts=('foot')
replaces=('foot-themes')
provides=('foot')
arch=('x86_64' 'aarch64')
license=(mit)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'python' 'wayland-protocols' 'tllist') # ‘llvm’, for PGO with clang
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'ncurses' 'fcft>=3.0.0')
optdepends=("foot-terminfo: alternative to ncurses' terminfo, with additional non-standard capabilities"
  "libnotify: desktop notifications"
  "xdg-utils: URI launching"
  "bash-completion: bash completions for foot itself")
source=(
  "patch::git+https://github.com/levinion/foot.git"
  "foot::git+https://codeberg.org/dnkl/foot.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  git apply -v ../patch/foot.patch
  ./pgo/pgo.sh \
    auto \
    . build \
    --prefix=/usr \
    --wrap-mode=nodownload \
    -Dterminfo=disabled
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/foot/LICENSE"
}
