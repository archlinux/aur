# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
# Built by packaging/linux/build-package.sh arch, which sets pkgver from
# Cargo.toml. For the AUR, replace SKIP with the release tarball's checksum.
pkgname=lorenz
pkgver=1.2.3
pkgrel=1
pkgdesc='Local file conversion with radial wheels'
arch=('x86_64')
url='https://github.com/Chaos-Tic/Lorenz'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
optdepends=(
    'ffmpeg: video and audio'
    'imagemagick: images'
    'pandoc-cli: documents'
    'poppler: PDF text and pages'
    'qpdf: merge and split PDF'
    'ghostscript: compress PDF'
    'libarchive: archives'
    'libreoffice-fresh: Word, PowerPoint and spreadsheet files'
    'libnotify: notifications'
    'wl-clipboard: copy files on Wayland'
    'xclip: copy files on X11'
    'kwin: KDE Plasma Wayland drag gesture'
    'extra-cmake-modules: automatic KWin extension rebuild on KWin updates'
    'vulkan-headers: automatic KWin extension rebuild on KWin updates'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a865215079a15df66de9467eb684123b015afd0697abd1d347877427c019138')

build() {
    cd "Lorenz-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    cd "Lorenz-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --prefix /usr --strip
    install -Dm644 packaging/arch/lorenz-kwin.hook "$pkgdir/usr/share/libalpm/hooks/90-lorenz-kwin.hook"
}
