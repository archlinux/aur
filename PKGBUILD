# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-git
pkgname=(handbrake-git handbrake-cli-git)
pkgver=1.9.2.r0.ge117cfe7f
pkgrel=2
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, nvdec, qsv, vce, numa, hardened, libdovi. Last stable branch"
arch=(i686 x86_64)
url="https://github.com/HandBrake/HandBrake"
license=(GPL-2.0-only)
source=("git+https://github.com/HandBrake/HandBrake.git#branch=1.9.x")
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame libjpeg-turbo
             x264 libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk4 libgudev)
makedepends=(git intltool python nasm wget cmake meson llvm clang cargo-c
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for Nvidia users, enable Nvidia nvenc'
            'cuda: for Nvidia users, enable Nvidia nvdec'
            'amf-amdgpu-pro: for enabling AMD AMF')
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "HandBrake"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # contrib: update SVT-AV1 to 3.0.0
  git -C HandBrake cherry-pick --no-commit 75f9c84c140c8841cfe1324ef59452025899ad8b
  # contrib: add cpuinfo
  git -C HandBrake cherry-pick --no-commit 2012ab9e674a744c1366b96b8cf2720e75670248
  # contrib: update to SVT-AV1 3.0.1
  git -C HandBrake cherry-pick --no-commit eb3a7e7c01313d687ebd487b59e08c700fe753d1
  # contrib: update SVT-AV1 to version 3.0.2
  git -C HandBrake cherry-pick --no-commit f9e7678bd4e42232188315e842e32387af9ac3ca

  # Update bundled x265 to fix build with current cmake
  # contrib: update to x265 rev 13212
  git -C HandBrake cherry-pick --no-commit a53d20a48bfca3c7dbf4f50710505c65e4334c89
}

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd "HandBrake"

  ./configure \
    --prefix=/usr \
    --harden \
    --enable-x265 \
    --enable-libdovi \
    --enable-numa \
    --enable-nvdec \
    --enable-nvenc \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-git() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
               'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "$srcdir/HandBrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-git() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/HandBrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
