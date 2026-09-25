# Local AUR-style binary package. Review before building; not published to AUR.
# The runtime is deliberately per-user so upstream updates cannot modify /opt.
pkgname=firma4ng-bin
pkgver=1.6.20
pkgrel=2
pkgdesc='InfoCamere Firma4NG signing and verification (binary, per-user runtime)'
arch=('x86_64')
url='https://id.infocamere.it/documentazione/it/software_di_firma.html'
license=('LicenseRef-Bit4id')
depends=(
  'bash' 'coreutils' 'tar' 'util-linux' 'xdg-utils'
  'glibc' 'gcc-libs' 'pcsclite'
  'lib32-glibc' 'lib32-gcc-libs' 'lib32-glib2'
  'lib32-libx11' 'lib32-libxext' 'lib32-libxrender'
  'lib32-libsm' 'lib32-fontconfig' 'lib32-zlib'
)
optdepends=(
  'ccid: PC/SC driver for compatible USB smart-card readers'
  'xorg-xwayland: run the bundled X11 GUI in a Wayland session'
)
provides=("firma4ng=$pkgver")
conflicts=('firma4ng')
# Vendor bytes remain unchanged; no stripping or debug-package splitting.
options=('!strip' '!debug')

_archive="Firma4NG_linux-${pkgver}.tar.gz"
_source_dir="Firma4NG_${pkgver}"
_inner_sha256='39807b7e667514874c6ca54fc2567fe4056491f6ec7766b0ed56a2f7377491bb'
source=(
  "${_archive}::https://id.infocamere.it/assets/software/Firma4NG_linux.tar.gz"
  'firma4ng'
  'firma4ng.desktop'
  'README.md'
)
noextract=("$_archive")
sha256sums=(
  '36d39e7ca23f54e392d344901c02de5168b6700c20c2a8ca51a77d0f77811c14'
  '313c63c6c05144c1b26174e5288dde8bba0325df8675bde03eec7bc6d23f8947'
  '0458c13dcb4fb2effd0285705af41001a70e9963caddfaa3a4197bfdefc4a9b2'
  'fbb300231fef1a263711efd2ca476a3ae135d948dd0bd08ca093f7b096643ac2'
)

prepare() {
  # GNU tar detects compression automatically when reading this archive file.
  # Extract only the seed archive, license, upstream README, and application icon.
  tar -xf "$srcdir/$_archive" -C "$srcdir" \
    --no-same-owner --no-same-permissions \
    "$_source_dir/Firma4NG.tar.gz" \
    "$_source_dir/licenza.txt" \
    "$_source_dir/README.txt" \
    "$_source_dir/resources/icons/Firma4NG.png" || return 1

  printf '%s  %s\n' "$_inner_sha256" \
    "$srcdir/$_source_dir/Firma4NG.tar.gz" | sha256sum --check - || return 1
}

check() {
  # No vendor code, installer, smart-card operation, or network update is run.
  bash -n "$srcdir/firma4ng" || return 1
  tar -tzf "$srcdir/$_source_dir/Firma4NG.tar.gz" > /dev/null || return 1
}

package() {
  local _vendor="$srcdir/$_source_dir"

  # A root-owned seed, read-only to ordinary users; the launcher creates a private writable copy.
  install -Dm644 "$_vendor/Firma4NG.tar.gz" \
    "$pkgdir/opt/firma4ng/Firma4NG.tar.gz" || return 1
  printf '%s  Firma4NG.tar.gz\n' "$_inner_sha256" \
    > "$pkgdir/opt/firma4ng/SHA256SUMS" || return 1
  printf '%s-%s\n' "$pkgver" "$pkgrel" \
    > "$pkgdir/opt/firma4ng/seed-version" || return 1
  chmod 644 "$pkgdir/opt/firma4ng/"{SHA256SUMS,seed-version} || return 1

  install -Dm755 "$srcdir/firma4ng" "$pkgdir/usr/bin/firma4ng" || return 1
  install -Dm644 "$srcdir/firma4ng.desktop" \
    "$pkgdir/usr/share/applications/firma4ng.desktop" || return 1
  install -Dm644 "$_vendor/resources/icons/Firma4NG.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/firma4ng.png" || return 1
  install -Dm644 "$_vendor/licenza.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  install -Dm644 "$_vendor/README.txt" \
    "$pkgdir/usr/share/doc/$pkgname/UPSTREAM-README.txt" || return 1
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md" || return 1
}
