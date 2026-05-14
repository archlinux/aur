# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="fluxcast"
pkgname="$_pkgname-git"
pkgver=r28.f4f396b
pkgrel=1
pkgdesc="Stream your Linux desktop to a Smart TV via Miracast/WFD, DLNA, or Cast"
arch=('any')
url="https://github.com/IlyaP358/fluxcast"
license=('BSD-3-Clause')

depends=(
  ffmpeg
  glib2
  gst-plugins-bad
  gst-plugins-good
  gst-python
  gstreamer
  iw
  libpulse
  networkmanager
  python-gobject
  wf-recorder
  wpa_supplicant
  xdg-desktop-portal
)
optdepends=(
  'python-pychromecast: Needed for the Cast protocol'
  'python-upnpclient: Needed for the DLNA protocol'
  'python-dbus-next: WFD portal capture control plane for KDE/GNOME Wayland'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  ( set -o pipefail                         # CHANGE THIS ONCE A TAGGED RELEASE COMES OUT
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_pkgsrc/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 "$_pkgsrc/capture.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/cast.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/diagnostics.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/dlna.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/main.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/portal_capture.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/server.py" -t "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$_pkgsrc/wfd.py" -t "$pkgdir/opt/$_pkgname/"

  install -Dm755 "../fluxcast.sh" "$pkgdir/usr/bin/fluxcast"
}

