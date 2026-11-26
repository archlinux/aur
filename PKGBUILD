# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/greeter>
pkgname=hornero-greeter-greetd
pkgver=0.1.2
pkgrel=1
pkgdesc='HorneroOS graphical greeter for greetd on Hornero Signal (Qt6/QML, cage)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/greeter'
license=('GPL-3.0-only')
# Runtime: greetd runs the greeter under cage (a kiosk Wayland
# compositor); Qt6 Quick renders the Signal panel and needs the Wayland
# platform plugin (qt6-wayland). ttf-ibm-plex supplies the Signal type
# families; without it fontconfig falls back and the greeter still works.
depends=('greetd' 'cage' 'qt6-base' 'qt6-declarative' 'qt6-wayland' 'ttf-ibm-plex')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
# Named "$pkgname" so the checkout lands at "${srcdir}/$pkgname", like
# the SDDM theme package; build functions only read from there.
source=("$pkgname::git+https://github.com/HorneroOS/greeter.git#commit=e516d11067617ec32ea11f349e2c5e5a55b3c5b6")
sha256sums=('SKIP')
install=hornero-greeter-greetd.install

build() {
  cmake -S "$srcdir/$pkgname/greetd" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # Seat prerequisites, as reviewable examples (never auto-installed
  # into /etc): the greetd-greeter PAM stack with pam_systemd and the
  # greetd config pointing at the session wrapper.
  local src="$srcdir/$pkgname" doc="$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$src/greetd/config/greetd-greeter.pam.example" \
    "$doc/greetd-greeter.pam.example"
  install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
