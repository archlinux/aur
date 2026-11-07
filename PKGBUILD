# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=refryt-git
pkgver=0.2.2.r0.geb059cb
pkgrel=1
pkgdesc='A fast, native YouTube Music client (latest git)'
arch=('x86_64')
url='https://github.com/gridoe/refryt'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'mpv' 'webkit2gtk-4.1' 'gtk3'
         'libsoup3' 'libxkbcommon' 'wayland' 'yt-dlp')
makedepends=('git' 'rust' 'cmake' 'python-pillow')
provides=('refryt')
conflicts=('refryt' 'refryt-bin')
source=('git+https://github.com/gridoe/refryt.git')
sha256sums=('SKIP')

pkgver() {
  cd refryt
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd refryt
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p refryt --bin refryt
}

package() {
  cd refryt
  install -Dm755 target/release/refryt "${pkgdir}/usr/bin/refryt"
  install -Dm644 assets/refryt.desktop "${pkgdir}/usr/share/applications/refryt.desktop"
  python3 - "${PWD}" "${pkgdir}" << 'EOF'
import os, sys
from PIL import Image
root, pkgdir = sys.argv[1], sys.argv[2]
src = Image.open(os.path.join(root, "assets/icons/app/refryt-master.png")).convert("RGBA")
base = os.path.join(pkgdir, "usr/share/icons/hicolor")
for s in (16, 32, 48, 64, 128, 256, 512):
    d = os.path.join(base, f"{s}x{s}/apps")
    os.makedirs(d, exist_ok=True)
    src.resize((s, s), Image.LANCZOS).save(os.path.join(d, "refryt.png"))
EOF
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
