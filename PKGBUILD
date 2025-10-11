# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: ston <2424284164@qq.com>

pkgname=auto-editor
pkgver=29.2.0
pkgrel=1
pkgdesc="A command line application for automatically editing video and audio."
url="https://auto-editor.com/"
arch=('x86_64')
license=("Unlicense")
provides=("auto-editor")
conflicts=("auto-editor-bin")
depends=("lame" "gcc-libs" "dav1d" "x264" "ffmpeg" "opus" "libvpx" "svt-av1" "x265" "glibc")
optdepends=(
  'yt-dlp: download and use URLs as inputs'
  'xdg-utils: automatically open completed files with xdg-open')
makedepends=("nim" "git") # git is required to bring in the required Nim version (>=2.2.2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WyattBlue/auto-editor/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('00caecef5da2c4525eb65ba36ba6682ad622a7f6f9911a52ceb9ed0a0e73126a')

prepare() {
  cd ${pkgname}-${pkgver}

  # Fixes a build error where Nim generates code that technically works, but causes gcc to error out.
  # Echoing into a file is fine for 29.0.5, but future releases will have an existing nim.conf and some sort of
  # patching will be required, especially since the current nim.conf on master statically builds.
  echo '--passC:"-Wno-incompatible-pointer-types"' >> nim.cfg
  echo '--passC:"-Wl,-z,relro,-z,now"' >> nim.cfg # Build with full relro (Relocation Read-Only)
}

build() {
	cd ${pkgname}-${pkgver}

	nimble make
}

package() {
	cd ${pkgname}-${pkgver}

	install -Dm755 "./auto-editor" "${pkgdir}/usr/bin/auto-editor"
}

# vim: ft=sh ts=2 sw=2 et
