# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=asteroidz-bar
pkgver=0.5.0
pkgrel=1
pkgdesc='The asteroidz shell: status bar and HDR10 wallpaper, out of the compositor'
arch=('x86_64')
url='https://github.com/asteroidzman/asteroidz-bar'
license=('MIT')
depends=(
  'quickshell'        # the shell runtime (quickshell-git provides it)
  'qt6-base'
  'qt6-declarative'
  'qt6-5compat'       # ColorOverlay: the icon tint is a mask, not a blend
  # The wallpaper's, which the QML plugin links statically -- there is no
  # separate wallpaper program any more, so these are this package's own.
  'cairo' 'wayland' 'gdk-pixbuf2' 'libjxl' 'libavif'
  # Apple dynamic wallpapers: several images in one HEIC, of which gdk-pixbuf
  # only ever returns the primary one. libpng writes out the frame that is
  # pulled from it.
  'libheif' 'libpng'
)
makedepends=('meson' 'ninja' 'wayland-protocols' 'git')
# It owns org.freedesktop.Notifications itself, so it satisfies anything asking
# for a notification daemon. Not `conflicts`: having swaync installed is fine,
# running it alongside this is what does not work, and that is a session
# question rather than a packaging one.
provides=('notification-daemon')
optdepends=(
  'asteroidz: the compositor this draws the bar for'
  'cava: the media visualiser'
  'pipewire: the volume module'
  'pipewire-audio: audible notifications (pw-play)'
  'grim: contrib/tray-test.sh'
)
# The released tag, not the local checkout. This is the same shape asteroidz's
# PKGBUILD has, and it is what makes the package publishable to the AUR at all:
# a source anyone can fetch, pinned to a revision the release notes describe.
#
# The cost is that `makepkg` here no longer builds your working tree -- it
# builds the tag. To try local changes, commit them and tag, or build the tree
# directly with meson; packaging uncommitted edits would leave "which version
# is installed" without an answer either way.
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$srcdir/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
  # swaybg's licence, which asteroidzbg is a fork of
  install -Dm644 "$srcdir/$pkgname/subprojects/asteroidzbg/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.asteroidzbg"
}
