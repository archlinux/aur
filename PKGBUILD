# Maintainer: czyt <czytcn@gmail.com>

pkgname=kiri-desktop-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Tiny, fast container runtime speaking the Docker API (with GUI and bundled docker CLI, Compose, buildx)"
arch=('x86_64' 'aarch64')
url="https://runkiri.com"
_gh="https://github.com/libracoder/kiri"
license=('Apache-2.0')
# kiri and kiri-init are static (musl); the rest are kiri-window's ELF needs.
depends=(
  'cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc'
  'gtk3' 'harfbuzz' 'icu' 'libepoxy' 'libgcc' 'libjpeg-turbo' 'libpng'
  'libwebp' 'libxml2' 'libxslt' 'pango' 'polkit' 'sqlite' 'systemd-libs'
  'webkit2gtk-4.1' 'zlib'
)
optdepends=(
  'docker: system docker CLI (preferred over the bundled one when installed)'
  'docker-compose: system Compose plugin (preferred over the bundled one)'
  'docker-buildx: system buildx plugin (preferred over the bundled one)'
)
# Not provides=('kiri'): AUR kiri-git is an unrelated KiCad tool providing
# that name; it also installs /usr/bin/kiri, hence the conflict.
conflicts=('kiri-git' 'kiri-bin' 'kiri-lite-bin' 'kiri-desktop-lite-bin')
install=kiri-desktop-bin.install
options=('!strip' '!debug')

source=('kiri.sysusers' 'kiri-path.sh' 'kiri-desktop-bin.install')
source_x86_64=(
  "kiri-${pkgver}-x86_64.deb::${_gh}/releases/download/v${pkgver}/kiri_${pkgver}_amd64.deb"
)
source_aarch64=(
  "kiri-${pkgver}-aarch64.deb::${_gh}/releases/download/v${pkgver}/kiri_${pkgver}_arm64.deb"
)
sha256sums=('1e8f1730d7bca0eacdc7d1dea9e86e2dc690e1e14434fd90d98ad54bcf48df8d'
            'fa0bd2c3b048b5205b21c66959ba23e63ddde224ee0b1a14a11d2ad13f9375e2'
            '270725dbf2ca755ca30400dab099b56b96f37d5efcd6d316a863de28b5fbc10f')
sha256sums_x86_64=('7b368bc6fa0cb0ae9f33e4378201803ede75b0f68bd58c07c654262c53d166b5')
sha256sums_aarch64=('c6ddb1b2f2c614548bec708309066879b91a49640bc1223253c7f0383d3f0756')
# makepkg would unpack the .deb into srcdir; _unpack_deb does it per package.
noextract=("kiri-${pkgver}-x86_64.deb" "kiri-${pkgver}-aarch64.deb")

# Unpack a .deb's data.tar.* into $pkgdir and fix it up for Arch.
_unpack_deb() {
  local _deb=$1 _tmp
  _tmp=$(mktemp -d "$srcdir/deb.XXXXXX")
  bsdtar -xf "$_deb" -C "$_tmp"
  bsdtar -xpf "$_tmp"/data.tar.* -C "$pkgdir"
  rm -rf "$_tmp"

  # /lib is a symlink to usr/lib on Arch; packages must not ship it.
  install -dm755 "$pkgdir/usr/lib/systemd/system"
  if [[ -f "$pkgdir/lib/systemd/system/kiri.service" ]]; then
    mv "$pkgdir/lib/systemd/system/kiri.service" "$pkgdir/usr/lib/systemd/system/"
  fi
  rm -rf "$pkgdir/lib"

  # The deb's postinst runs groupadd; on Arch, systemd-sysusers does it.
  install -Dm644 "$srcdir/kiri.sysusers" "$pkgdir/usr/lib/sysusers.d/kiri.conf"

  find "$pkgdir" -type d -exec chmod 755 {} +
}

_licenses() {
  local _doc=$1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/doc/$_doc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s "/usr/share/doc/$_doc/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

package() {
  _unpack_deb "kiri-${pkgver}-${CARCH}.deb"

  # Kiri's docker CLI and its wrapper: Arch keeps helpers in /usr/lib/<pkg>,
  # not /usr/libexec. Nothing but the wrapper names the old path.
  mv "$pkgdir/usr/libexec/kiri/bin" "$pkgdir/usr/lib/kiri/bin"
  mv "$pkgdir/usr/libexec/kiri/docker" "$pkgdir/usr/lib/kiri/docker"
  sed -i 's|/usr/libexec/kiri/bin/docker|/usr/lib/kiri/bin/docker|' "$pkgdir/usr/lib/kiri/docker"
  rmdir "$pkgdir/usr/libexec/kiri" 2>/dev/null || true

  # The upstream arm64 deb currently ships no GUI payload (no kiri-window,
  # unit, desktop file, icons, metainfo); keep the common pieces tidy.
  # usr/share/doc/kiri (LICENSE, NOTICE) is kept for _licenses; the Debian
  # copyright stub is packaging metadata, not used on Arch.
  rm -f "$pkgdir/usr/share/doc/kiri/copyright"

  # Arch's docker-compose / docker-buildx packages own
  # /usr/lib/docker/cli-plugins, and the docker CLI searches
  # /usr/libexec/docker/cli-plugins last: system plugins (when installed)
  # win, as upstream intends. The deb's plugins (0.2.x:
  # /usr/libexec/kiri/cli-plugins, 0.1.x: /usr/lib/docker/cli-plugins) are
  # only wired up by update-alternatives, which Arch lacks, so they go where
  # the CLI actually searches. Namcap flags ELF files there; !strip above.
  install -dm755 "$pkgdir/usr/libexec/docker/cli-plugins"
  for _d in "$pkgdir/usr/libexec/kiri/cli-plugins" "$pkgdir/usr/lib/docker/cli-plugins"; do
    if [[ -d "$_d" ]]; then
      mv "$_d"/* "$pkgdir/usr/libexec/docker/cli-plugins/" 2>/dev/null || true
    fi
  done
  rm -rf "$pkgdir/usr/lib/docker" "$pkgdir/usr/libexec/kiri"
  find "$pkgdir/usr/libexec" -type d -empty -delete 2>/dev/null || true

  # Debian uses update-alternatives (priority 10) to put Kiri's docker at
  # /usr/bin/docker. That would conflict with Arch's docker package, so the
  # wrapper goes in its own directory, appended to the end of PATH: any other
  # docker on PATH still wins.
  install -dm755 "$pkgdir/usr/lib/kiri/path"
  ln -s /usr/lib/kiri/docker "$pkgdir/usr/lib/kiri/path/docker"
  install -Dm644 "$srcdir/kiri-path.sh" "$pkgdir/etc/profile.d/kiri.sh"

  _licenses kiri
}
