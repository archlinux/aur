pkgname=fluxer-bin-domainchoose
pkgver=2026.1001.230522
pkgrel=1
pkgdesc="Fluxer Desktop Application (gives you the ability to change the domain)"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'nodejs' 'zenity')
provides=('fluxer')
conflicts=('fluxer')
options=('!strip')

source=("fluxer.desktop" "fluxer-wrapper.sh")
sha256sums=('981daa8015b823fef254bb8e79fe6b28f77dda02cdc374796443bd64f5041de1'
            '5be539e013dcd041e6ce8797bb62b5b35c94dfabda7af1b7c5e2510a1c254975')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('b5204b0e565bb9ce738a34395e851a62207935f969aa87034b77ddccd2d806c7')

source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('137ed6bdd96acb95629127242e2b69911cd734bcfcf5056ab5e6a6c6eb490420')

package() {
  local _dir
  case "$CARCH" in
  x86_64) _dir="Fluxer-${pkgver}-linux-x64" ;;
  aarch64) _dir="Fluxer-${pkgver}-linux-arm64" ;;
  esac
  if [ ! -d "$srcdir/$_dir" ]; then
    _dir=$(cd "$srcdir" && ls -d [Ff]luxer*"${pkgver}"*/ 2>/dev/null | head -n1)
    _dir="${_dir%/}"
  fi
  if [ -z "$_dir" ] || [ ! -d "$srcdir/$_dir" ]; then
    echo "Error: could not find extracted directory for $CARCH" >&2
    return 1
  fi

  install -d "$pkgdir/opt/fluxer"
  cp -a "$srcdir/$_dir/." "$pkgdir/opt/fluxer/"

  # Wrapper
  install -Dm755 "$srcdir/fluxer-wrapper.sh" "$pkgdir/usr/bin/fluxer"

  install -Dm644 "$srcdir/fluxer.desktop" "$pkgdir/usr/share/applications/fluxer.desktop"
  install -dm777 "$pkgdir/opt/fluxer/resources"
  install -Dm666 /dev/null "$pkgdir/etc/fluxer.conf"

  local _icon _size _found=0
  for _icon in "$srcdir/$_dir"/resources/icons/[0-9]*x[0-9]*.png; do
    [ -f "$_icon" ] || continue
    _size="$(basename "$_icon" .png)"
    install -Dm644 "$_icon" \
      "$pkgdir/usr/share/icons/hicolor/$_size/apps/fluxer.png"
    _found=1
  done
  if [ "$_found" -eq 0 ]; then
    echo "Error: no icons" >&2
    return 1
  fi
}
