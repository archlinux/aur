# Maintainer: Alberto OS <https://github.com/AlbertoOS>

pkgname=i3lock-color-albertoos-git
pkgver=2.13.c.5.albertoos.3.r0.4450424
pkgrel=1
pkgdesc="i3lock-color fork: constant-time blur, async lock, security hardening, thread safety, expression caching"
arch=('x86_64')
url="https://github.com/AlbertoOS/i3lock-color"
license=('MIT')
depends=(
  'xcb-util-image'
  'pam'
  'libev'
  'cairo'
  'libxkbcommon-x11'
  'libjpeg-turbo'
  'xcb-util-xrm'
  'pkgconf'
)
makedepends=('git' 'autoconf' 'automake')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock' 'i3lock-color' 'i3lock-color-git')
backup=('etc/pam.d/i3lock')
source=("i3lock-color::git+https://github.com/AlbertoOS/i3lock-color.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/i3lock-color"
  git describe --long --tags | sed 's/-\([0-9]*\)-g/\.r\1\./;s/-/\./g;s/\.$//'
}

build() {
  cd "$srcdir/i3lock-color"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --enable-debug=no \
    --disable-sanitizers
  # Remove the 'all-configured' target that prints a warning during normal builds
  awk '!/all-configured/' Makefile > Makefile.new
  mv Makefile.new Makefile
  make
}

package() {
  cd "$srcdir/i3lock-color"

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 i3lock-bash "${pkgdir}/usr/share/bash-completion/completions/i3lock"
  install -Dm644 i3lock-zsh "${pkgdir}/usr/share/zsh/vendor-completions/_i3lock"
}
