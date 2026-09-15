# Maintainer: taxin-404 <taxin404@duck.com>
#
# Prebuilt counterpart to packaging/aur/cordial/PKGBUILD. Where cordial (and
# cordial-git) build the Rust workspace with cargo, this package downloads the
# .pkg.tar.zst that upstream CI attaches to the GitHub release -- itself the
# output of `makepkg` against packaging/aur/cordial/PKGBUILD on the same tag --
# and repacks it untouched. No compilation, so arch lives with that artifact.
#
# The release asset name embeds the `git describe` build id
# (0.14.2.r0.g05e7605 in this case), so a release bump touches both $pkgver
# and the pinned URL below. Regenerate the checksum with `sha256sum` on the
# downloaded file.

pkgname=cordial-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="Roblox's official Android build, run natively on Linux -- Cordial ships no Roblox code and fetches a signature-verified one (prebuilt)"
arch=('x86_64')
url="https://github.com/luohoa97/cordial"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
  'zlib'
  'glib2'
  'pango'
  'graphene'
  'libsoup3'
  'libgcc'
  'libstdc++'
  'glibc'
  'vulkan-icd-loader'
  'wayland'
  'libxkbcommon'
  'libglvnd'
  'pipewire'
  'hicolor-icon-theme'
  'deno'
)
conflicts=('cordial' 'cordial-git')
install="$pkgname.install"
# The binaries in the artifact were already stripped by CI's own makepkg;
# stripping them again fails and would not make them byte-identical.
options=('!strip' '!debug')
source=("cordial.pkg.tar.zst::https://github.com/luohoa97/cordial/releases/download/v$pkgver/cordial-0.14.2.r0.g05e7605-1-x86_64.pkg.tar.zst")
sha256sums=('3e03b5250e966363f1c8f2c73691a66ac84060f21caa508f103958adb10043c4')

package() {
  bsdtar -xf "$srcdir/cordial.pkg.tar.zst" -C "$pkgdir"
  # The artifact is itself a pacman package; makepkg regenerates these as the
  # cordial-bin package's own instead of letting them leak through.
  rm -f "$pkgdir"/.BUILDINFO "$pkgdir"/.INSTALL "$pkgdir"/.MTREE "$pkgdir"/.PKGINFO
}