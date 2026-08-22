# Maintainer: itachi_re <xanbenson99@gmail.com>
#
# This file lives at build/arch/PKGBUILD in the yuki-iptv repo. It is a
# TEMPLATE: pkgver/pkgrel/sha256sums get rewritten by the `aur` job in
# .github/workflows/release.yml on every tagged release before it's pushed
# to the AUR git repo — you don't need to bump those by hand.
#
# Verify `depends=()` below against build/debian/control's Depends: line
# and whatever `pyproject.toml`/`requirements.txt` yuki-iptv actually
# ships — this list is a best-effort starting point based on the modules
# under usr/lib/yuki-iptv/yuki_iptv (gui.py -> PyQt, xtream.py -> requests,
# thirdparty/mpv.py -> mpv), not a verified dependency audit.

pkgname=yuki-iptv
pkgver=260822.1
pkgrel=1
pkgdesc="IPTV player with EPG support, based on mpv and Qt"
arch=('any')
url="https://github.com/itachi-re/yuki-iptv"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-pyqt6'
  'mpv'
  'python-requests'
  'python-unidecode'
  'python-orjson'
  'python-chardet'
  'python-gobject'
  'ttf-font'
  'xdg-utils'
)
optdepends=(
  'yt-dlp: playback of yt-dlp-supported stream URLs'
  'ffmpeg: recording support'
)
makedepends=('make' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/itachi-re/yuki-iptv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('739a5b7f0ac7482404d6ae5764d9addd384e98626d50d14175647bb158b78295')

# The Makefile compiles po/*.po -> usr/share/locale/*/LC_MESSAGES/*.mo
# in-place inside the source tree (same thing debian/rules gets for free
# via dh_auto_build calling `make`) — without this, no .mo files exist
# and the app silently falls back to English regardless of locale.
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -a usr "$pkgdir/"

  # debian/rules substitutes this placeholder via
  # override_dh_installdeb + sed at .deb build time; mirror that here,
  # otherwise "About" and log output show the literal string
  # __DEB_VERSION__ instead of a real version.
  find "$pkgdir" -type f -exec sed -i "s/__DEB_VERSION__/$pkgver/g" {} +
}
