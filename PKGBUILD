# Maintainer: VGP Project
pkgname=vgp-git
pkgver=0.1.0
pkgrel=1
pkgdesc="GPU-accelerated vector display server and desktop environment"
arch=('x86_64')
url="https://github.com/theesfeld/VGP"
license=('MIT')
depends=(
  'libdrm'
  'libinput'
  'libxkbcommon'
  'seatd'
  'dbus'
  'libvterm'
  'mesa'
  'pam'
)
makedepends=(
  'meson'
  'ninja'
  'git'
)
provides=('vgp')
conflicts=('vgp')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd VGP
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

build() {
  cd VGP
  meson setup build --prefix=/usr -Dbuildtype=release
  meson compile -C build
}

package() {
  cd VGP
  meson install -C build --destdir="$pkgdir"

  # Install session file for greeters
  install -Dm644 vgp.desktop "$pkgdir/usr/share/wayland-sessions/vgp.desktop"

  # License
  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
MIT License

Copyright (c) 2026 VGP Project

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
