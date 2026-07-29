# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cosmic-ext-applet-now-playing-extended-git
_srcname=cosmic-ext-applet-now-playing
pkgver=0.1.0.r39.g6be9750
pkgrel=1
pkgdesc='Extended MPRIS now-playing applet for the COSMIC panel'
arch=('x86_64')
url='https://github.com/AdityaHebballe/cosmic-ext-applet-now-playing'
license=('GPL-3.0-only')
depends=('dbus' 'gcc-libs' 'glibc' 'libxkbcommon')
# Rust's Linux toolchain invokes the LLVM linker through `cc -fuse-ld=lld`.
# Declare it explicitly so clean AUR builds do not rely on a preinstalled lld.
makedepends=('cargo' 'git' 'lld')
provides=('cosmic-ext-applet-now-playing')
conflicts=('cosmic-ext-applet-now-playing')
source=("${_srcname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"

  printf '0.1.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_srcname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_srcname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 target/release/cosmic-ext-applet-now-playing \
    -t "${pkgdir}/usr/bin"
  install -Dm644 res/com.github.DiegoMMR.CosmicExtAppletNowPlaying.desktop \
    "${pkgdir}/usr/share/applications/com.github.DiegoMMR.CosmicExtAppletNowPlaying.desktop"
  install -Dm644 res/com.github.DiegoMMR.CosmicExtAppletNowPlaying.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.github.DiegoMMR.CosmicExtAppletNowPlaying.metainfo.xml"

  for size_dir in res/icons/hicolor/*; do
    install -Dm644 \
      "${size_dir}/apps/com.github.DiegoMMR.CosmicExtAppletNowPlaying.svg" \
      "${pkgdir}/usr/share/icons/hicolor/$(basename "${size_dir}")/apps/com.github.DiegoMMR.CosmicExtAppletNowPlaying.svg"
  done
}
