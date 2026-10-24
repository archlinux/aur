# Maintainer: jnmbk <ugur.jnmbk@gmail.com>
pkgname=rnazar
pkgver=0.8.3
pkgrel=1
pkgdesc="System tray evil eye ward and crash notifier"
arch=('x86_64' 'aarch64')
url="https://github.com/jnmbk/rnazar"
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
)
makedepends=('cargo' 'git')
source=("rnazar::git+https://github.com/jnmbk/rnazar.git#tag=v${pkgver}")
sha256sums=('567e6f63f0946c39515aa67f09695ba0b6e3d1b243ace84a676a37aa9f7e59c7')

build() {
    cd "${srcdir}/rnazar"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/rnazar"

    # Binary
    install -s -Dm755 "target/release/rnazar" "${pkgdir}/usr/bin/rnazar"

    # Desktop & DBus
    install -Dm644 "assets/rnazar.desktop" "${pkgdir}/usr/share/applications/rnazar.desktop"
    install -Dm644 "assets/dbus/org.rnazar.Notifier.service" "${pkgdir}/usr/share/dbus-1/services/org.rnazar.Notifier.service"

    # License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Icons
    install -Dm644 "assets/icons/nazar.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rnazar.svg"
    for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        if [ -f "assets/icons/png/${size}.png" ]; then
            install -Dm644 "assets/icons/png/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/rnazar.png"
        fi
    done
}

