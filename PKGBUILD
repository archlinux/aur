# Maintainer: Eldin Beganovic <franklyn@htl-leonding.ac.at>
# Contributor: Franklyn Team <franklyn@htl-leonding.ac.at>

pkgname=franklyn-bin
_pkgname=franklyn-sentinel
# Release version; pkgver is the same without "-", which pkgver does not allow.
_ver=0.9.7-dev.aur.1
pkgver=0.9.7dev.aur.1
pkgrel=1
pkgdesc='Franklyn Sentinel - streams student screen activity to the teacher during exams'
arch=('x86_64' 'aarch64')
url='https://github.com/2526-4ahitm-itp/2526-4ahitm-franklyn'
license=('MIT')
# Plugin set mirrors the one bundled by the Nix `franklyn-sentinel-portable` output:
# coreelements, app, videoconvert, videoscale, videorate, jpeg, ximagesrc, pipewire.
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'openssl'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugin-pipewire'
)
optdepends=(
  'xdg-desktop-portal: screen capture on Wayland (plus a backend such as xdg-desktop-portal-gnome/-kde/-hyprland/-wlr)'
)
provides=('franklyn' "$_pkgname")
conflicts=('franklyn' "$_pkgname" 'franklyn-bin-dev')
options=('!debug')

_release="$url/releases/download/v$_ver"
_dist="$_pkgname-$_ver-$CARCH-linux-dist.tar.zst"

source=("$_pkgname-$pkgver.desktop::https://raw.githubusercontent.com/2526-4ahitm-itp/2526-4ahitm-franklyn/v$_ver/sentinel/resources/franklyn-sentinel.desktop")
source_x86_64=("$_release/$_pkgname-$_ver-x86_64-linux-dist.tar.zst")
source_aarch64=("$_release/$_pkgname-$_ver-aarch64-linux-dist.tar.zst")
# The dist tarball comes out of the Nix store with read-only modes, so it is
# extracted manually in prepare() and made writable to keep rebuilds working.
noextract=("$_dist")

# Updated by .github/workflows/aur.yaml on every release.
sha256sums=('a9275e249c869d6336461f8bff6d80b4ecb955ad8798c148354a2bf683c89699')
sha256sums_x86_64=('6cc760b1b5979a6ffb164a4474c9943415b1ede94da77002befccbf974e5c21a')
sha256sums_aarch64=('2dd9ddc48b170f381d5035e24e28eabf09a72c794ba74056c1be868908b5eccf')

prepare() {
  if [[ -d dist ]]; then
    chmod -R u+w dist
    rm -rf dist
  fi
  mkdir dist
  bsdtar -xf "$_dist" -C dist
  chmod -R u+w dist
}

package() {
  cd dist

  install -Dm755 bin/franklyn "$pkgdir/usr/bin/franklyn"

  find share/icons -type f -name '*.png' -exec install -Dm644 {} "$pkgdir/usr/{}" \;

  sed -e "s|@VERSION@|$pkgver|" \
    -e "s|@BINARY_PATH@|/usr/bin/franklyn|" \
    "$srcdir/$_pkgname-$pkgver.desktop" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 GSTREAMER_LICENSE "$pkgdir/usr/share/licenses/$pkgname/GSTREAMER_LICENSE"
}
