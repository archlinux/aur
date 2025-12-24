pkgname=tlauncher-installer
pkgver=1.0
pkgrel=1
arch=('any')
pkgdesc="TLauncher (prebuilt binary from upstream .deb)"
url="https://tlauncher.org"
license=('MIT')
depends=()
source=("tlauncher-linux-installer.deb::https://dl1.tlauncher.org/f.php?f=files%2Ftlauncher-linux-installer.deb")
noextract=("tlauncher-linux-installer.deb")
sha256sums=('418871838de35f024a285a7cebff5eb31b24cc3b3ddb086946a7027855cbff1a')

package() {
  cd "${srcdir}"

  # resolve potential name::url source syntax
  debfile="${source[0]}"
  if printf '%s' "$debfile" | grep -q '::'; then
    debfile="${debfile%%::*}"
  fi

  [ -f "$debfile" ] || { echo "Source .deb not found: $debfile"; return 1; }

  # extract .deb and data archive
  ar x "$debfile" || return 1
  data_tar=$(ls -1 data.tar.* 2>/dev/null | head -n1)
  [ -n "$data_tar" ] || { echo "data.tar.* not found"; return 1; }

  tmpdir="${srcdir}/.deb_tmp"
  rm -rf "$tmpdir" && mkdir -p "$tmpdir"
  tar -xpf "$data_tar" -C "$tmpdir" || return 1

  # move only the runtime files into the package: usr/games and usr/share
  if [ -d "$tmpdir/usr/games" ]; then
    mkdir -p "$pkgdir/usr"
    mv "$tmpdir/usr/games" "$pkgdir/usr/"
  fi
  if [ -d "$tmpdir/usr/share" ]; then
    mkdir -p "$pkgdir/usr/share"
    cp -a "$tmpdir/usr/share/." "$pkgdir/usr/share/"
  fi

  rm -rf "$tmpdir"

  # ensure directories have sensible permissions
  find "$pkgdir" -type d -exec chmod 755 {} + || true
}
