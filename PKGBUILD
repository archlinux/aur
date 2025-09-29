# Maintainer: k8ie <k8ie@mcld.eu>
# Co-Maintainer: ItsDrike <itsdrike@protonmail.com>

pkgname=('libproidplus-gui')
pkgver=2.5.0
pkgrel=3
pkgdesc="Library for ProID+ SmartCards"
makedepends=(curl libarchive)
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')

_appcenter_url="https://appcenter.proid.cz/download?solutionId=0e627b2e-fe68-49e9-aef9-a2ead6a21d9b"

prepare() {
  # Obtain the source URL for the deb from the page JavasCript (this will always be the latest version)
  _sourceurl="$(curl "$_appcenter_url" | grep sasurl | sed -n 's/.*sasurl:"\([^"]*\)".*/\1/p' || exit 1)"

  # Pull the archive and extract it
  curl -s -L -o "proidplus.deb.zip" "$_sourceurl"
  bsdtar -xf "proidplus.deb.zip"

  # Verify hash
  _debfile=(libproidplus-gui-*.amd64.deb)
  _shafile=(libproidplus-gui-*.amd64.deb.sha256)
  _sha="$(cut -d ' ' -f1 "$_shafile")"
  echo "$_sha $_debfile" | sha256sum --check --status

  # Extract the deb
  bsdtar -xf "$_debfile"
}

pkgver() {
  bsdtar -O -xf "$srcdir/control.tar.xz" - ./control | awk '/^Version:/ {print $2}'
}

package() {
  bsdtar -C "$pkgdir" -xf "$srcdir/data.tar.xz"

  # /usr/lib/x86_64-linux-gnu -> /usr/lib
  mv "$pkgdir/usr/lib/x86_64-linux-gnu/"* "$pkgdir/usr/lib"
  rmdir "$pkgdir/usr/lib/x86_64-linux-gnu"

  # Fix symlinks that still reference x86_64-linux-gnu
  find "$pkgdir/usr/lib" -type l | while read -r link; do
    target="$(readlink "$link")"
    case "$target" in
    /usr/lib/x86_64-linux-gnu/*)
      new="/usr/lib/${target#/usr/lib/x86_64-linux-gnu/}"

      # Sanity check to make sure the file we point to exists in pkgdir
      if ! realpath -qm "$pkgdir$new" >/dev/null; then
        exit 1
      fi

      ln -sf "$new" "$link"
      ;;
    esac
  done

  # Fix hardcoded Debian multiarch paths in config files
  grep -rlZ '/usr/lib/x86_64-linux-gnu/' "$pkgdir" | while IFS= read -r -d '' file; do
    sed -i 's|/usr/lib/x86_64-linux-gnu/|/usr/lib/|g' "$file"
  done

  # NOTE: Ideally, we would also move /usr/local/etc -> /etc (since /usr/local is only meant for
  # manually installed programs, the package manager should not use it). However, the libs
  # have the path hard-coded in the binaries and only look in /usr/local/etc/crplus for config.
  # For this reason, we can't really changed this, keep it as-is, even though non-standard.

  # Include libproidproxy and libproidqcm11 libs in /usr/lib/pkcs11
  ln -s /usr/lib/libproidproxyp11.so "$pkgdir/usr/lib/pkcs11"
  ln -s /usr/lib/libproidqcm11.so "$pkgdir/usr/lib/pkcs11"

  # Include ProID+ Q module and the proxy module for p11-kit too (on top of the existing ProID+ one)
  # NOTE: Theoretically, it should be enough to just have the proxy, replacing the
  # libproidcm11 default module, as it should be forwarding to the other modules.
  # However, I had some trouble with the proxy alone not picking up the card, so
  # also keep the direct module (and add the ProID+ Q one).
  echo "module: libproidqcm11.so" >"$pkgdir/usr/share/p11-kit/modules/proidplusq.module"
  echo "module: libproidproxyp11.so" >"$pkgdir/usr/share/p11-kit/modules/proidproxy.module"

  # Normalize directory permissions (Debian uses 775, arch 755)
  find "$pkgdir" -type d -exec chmod 755 {} +

  # Ensure everything is owned by root
  chown -R root:root "$pkgdir"
}
