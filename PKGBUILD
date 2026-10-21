# Maintainer: Lucasion <lucasion@hotmail.com>
pkgname=cinemion-bin
# The release name, which may hold a dash (2.0.0-alpha.0); pacman versions can't, so pkgver swaps it for an underscore
_version=0.4.0
pkgver=${_version//-/_}
pkgrel=1
pkgdesc="Self-hosted media server and player for movies, shows and home videos"
arch=('x86_64' 'aarch64')
url="https://github.com/LucasionGS/cinemion"
license=('GPL-3.0-or-later')
depends=('ffmpeg')
optdepends=(
  'intel-media-driver: video conversion on Intel GPUs (VA-API)'
  'vpl-gpu-rt: video conversion on Intel GPUs (Quick Sync)'
  'libva-mesa-driver: video conversion on AMD GPUs'
  'nvidia-utils: video conversion on NVIDIA GPUs (NVENC)'
  'poppler: covers for PDF books'
  'libheif: HEIC photos from phones with older ffmpeg versions'
)
provides=('cinemion')
conflicts=('cinemion')
backup=('etc/cinemion/cinemion.env')
# The binary carries the app after its executable part; stripping it would cut that off
options=('!strip' '!debug')
source=('cinemion.service' 'cinemion.sysusers' 'cinemion.env')
source_x86_64=("cinemion-$_version-linux_x64.tar.gz::$url/releases/download/v$_version/cinemion-$_version-linux_x64.tar.gz")
source_aarch64=("cinemion-$_version-linux_arm64.tar.gz::$url/releases/download/v$_version/cinemion-$_version-linux_arm64.tar.gz")
# Filled in by scripts/aur-publish.sh (updpkgsums) once the release exists
sha256sums=('a2d5d91910dc5cf6e4bc458b1d5c1ea5ffb75d6e58a3f9949bf5e009f99c4191'
            '50583e653975c3d49f6d5fa3524318789eba9e6889d74520345fb2aae40c4d6b'
            '62d15bd61e114e83c21bbd54d30b7bc48a0c68a52ed33c7a1353adfa44c5a634')
sha256sums_x86_64=('6463cd73c8bef42ee5dc06a348f7bd51c7673cedc288906fcbaf31d7b7b144c1')
sha256sums_aarch64=('4f4db977cc2360361a71391f97bf4d143633c63187672d09ede70b6476048bf8')

check() {
  [[ "$("$srcdir/cinemion" version)" == "$_version" ]]
}

package() {
  install -Dm755 "$srcdir/cinemion" "$pkgdir/usr/bin/cinemion"
  install -Dm644 "$srcdir/cinemion.service" "$pkgdir/usr/lib/systemd/system/cinemion.service"
  install -Dm644 "$srcdir/cinemion.sysusers" "$pkgdir/usr/lib/sysusers.d/cinemion.conf"
  install -Dm640 "$srcdir/cinemion.env" "$pkgdir/etc/cinemion/cinemion.env"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
