# Maintainer: Your Name <you at example dot com>

pkgname=pulsar-mouse-linux-bin
_pkgname=pulsar-mouse-linux
pkgver=0.1.34
pkgrel=1
pkgdesc="Configuration tool (CLI + GTK4/libadwaita GUI) for Pulsar gaming mice (X2A, X2H, Xlite, and more) - prebuilt release"
arch=('any')
url="https://github.com/packerlschupfer/pulsar-mouse-linux"
license=('MIT')
depends=(
  'python'
  'python-pyusb'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'libdbusmenu-glib'
  'hicolor-icon-theme'
)
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git" 'pulsar-x2a-linux')
replaces=('pulsar-x2a-linux')
install="${pkgname}.install"
noextract=("${_pkgname}_${pkgver}_all.deb")
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_all.deb"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/packerlschupfer/${_pkgname}/v${pkgver}/LICENSE"
)
sha256sums=('ad86b08f8665e94d95e2576a93f1bfd470703429571e466450c4ea3e48bd6823'
            '037292e5878197a269682c03fb29586fa0fd3098edf1fa919f375047eff093c1')

package() {
  # Unpack the .deb's payload straight into the package root
  bsdtar -xOf "${_pkgname}_${pkgver}_all.deb" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"

  # Debian puts Python modules in dist-packages; Arch's Python only looks in site-packages
  local _site
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  local _deb
  for _deb in "$pkgdir"/usr/lib/python3/dist-packages \
              "$pkgdir"/usr/local/lib/python3*/dist-packages \
              "$pkgdir"/usr/lib/python3.*/dist-packages; do
    [[ -d $_deb ]] || continue
    install -d "$pkgdir$_site"
    cp -a "$_deb"/. "$pkgdir$_site"/
    rm -rf "$_deb"
  done
  rmdir -p --ignore-fail-on-non-empty "$pkgdir"/usr/lib/python3 "$pkgdir"/usr/local/lib 2>/dev/null || true

  # Arch keeps packaged udev rules in /usr/lib/udev/rules.d (/etc is for the admin)
  local _rules
  for _rules in "$pkgdir"/lib/udev/rules.d "$pkgdir"/etc/udev/rules.d; do
    [[ -d $_rules ]] || continue
    install -d "$pkgdir"/usr/lib/udev/rules.d
    mv "$_rules"/* "$pkgdir"/usr/lib/udev/rules.d/
  done
  rm -rf "$pkgdir"/lib "$pkgdir"/etc/udev
  rmdir "$pkgdir"/etc 2>/dev/null || true

  # Debian-only docs
  rm -f "$pkgdir"/usr/share/doc/"${_pkgname}"/changelog.Debian.gz

  # Byte-compile like any other Arch Python package
  python -m compileall -q -f -s "$pkgdir" -p / "$pkgdir$_site"
  python -O -m compileall -q -f -s "$pkgdir" -p / "$pkgdir$_site"

  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
