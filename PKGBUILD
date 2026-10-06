pkgname=fluxer-bin-domainchoose
pkgver=2026.1006.171735
pkgrel=1
pkgdesc="Fluxer Desktop Application (gives you the ability to change the domain)"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'nodejs' 'zenity' 'pnpm')
provides=('fluxer')
conflicts=('fluxer')
options=('!strip')

source=("fluxer.desktop" "fluxer-wrapper.sh")
sha256sums=('981daa8015b823fef254bb8e79fe6b28f77dda02cdc374796443bd64f5041de1'
            '901aac1f3fa6541ec0b2436e2bd9e24312688d900db5a2d2347c2e2aa0e75d22')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('b69836b50b0a64ad0542fc0fa531bd6219069198bf13601d9a1405f81e5bdfd1')

source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('402a3aa5981483c3db7da6813c4008d5a64e1e16b4770cf9a14a06a8a0c87cfd')

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
  cp "$pkgdir/opt/fluxer/resources/app.asar" "$pkgdir/opt/fluxer/resources/app.asar.original"
  cp -r "$pkgdir/opt/fluxer/resources/app.asar.unpacked" "$pkgdir/opt/fluxer/resources/app.asar.original.unpacked"
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
