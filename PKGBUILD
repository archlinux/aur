# Written by tools/packaging/arch-pkgbuild.sh of
# https://git.connected-rails.org/Connected-Rails/connected-rails for every release:
# changes go there, not here.

pkgname=connected-rails-nightly-bin
_tag=nightly-20261124-f43834a
pkgver=0.1.0nightly202611241839
pkgrel=1
pkgdesc="Train simulator with editors for lines, vehicles and signal kits (nightly builds of main, untested)"
arch=('x86_64')
url="https://connected-rails.org"
license=('EUPL-1.2' 'Apache-2.0' 'LicenseRef-NVIDIA-DLSS')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxrandr' 'systemd-libs' 'vulkan-icd-loader' 'wayland')
optdepends=('vulkan-driver: a Vulkan driver for the GPU (vulkan-radeon, vulkan-intel, nvidia-utils)'
  'blender: the light bake in the import dialog of the module editor')
provides=('connected-rails')
conflicts=('connected-rails')
# The release's own binaries and libraries (Steam Audio, DLSS), as shipped.
options=('!strip' '!debug')
_cdn=https://cdn.connected-rails.org/releases
_archive="train-sim-${_tag}-x86_64-unknown-linux-gnu"
source=("${_archive}.tar.gz::${_cdn}/${_tag}/${_archive}.tar.gz")
sha256sums=('ec845d2caa98f85b6ac870dea84f5d18dd6d0105cffa314aa21c1ba908b33588')

package() {
  local opt="$pkgdir/opt/connected-rails"
  install -d "$opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  cp -a --no-preserve=ownership "$srcdir/$_archive/." "$opt/"
  # The desktop integration goes where the system looks for it; the script that
  # installs it for an unpacked archive has no use in a package.
  mv "$opt/share/"* "$pkgdir/usr/share/"
  rmdir "$opt/share"
  rm "$opt/install-desktop-entries.sh"

  # The programs that write into a game directory start through the launcher, the
  # command-line tools as they are.
  local program
  for program in train-sim trainsim-route-editor trainsim-vehicle-editor trainsim-signal-editor; do
    ln -s /opt/connected-rails/connected-rails-launch "$pkgdir/usr/bin/$program"
  done
  for program in crails-check import-line import-module module-tool; do
    ln -s "/opt/connected-rails/$program" "$pkgdir/usr/bin/$program"
  done

  local file
  for file in LICENSE THIRD_PARTY_LICENSES.md STEAMAUDIO-LICENSE.txt STEAMAUDIO-THIRDPARTY.md DLSS-LICENSE.txt; do
    ln -s "/opt/connected-rails/$file" "$pkgdir/usr/share/licenses/$pkgname/$file"
  done
}
