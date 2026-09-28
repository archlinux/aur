pkgname=fluxer-bin-domainchoose
pkgver=2026.927.142044
pkgrel=2
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
            '77cf42d44b60ec32e3732f08ee0f0defa4e8853c3430563c82894f6beda3d94e')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('126dbef18f4cad1cdc930fd469b059d82b09d10f6493ea8c9dbbfe5861364c82')

source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('d6e40b0ee5b6adf6cbdba7c14748c2f409d5644166ed08815af6393f0900e140')

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
