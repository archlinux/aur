# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

# Split package: one upstream release, two .debs. kiri-bin is the full app
# (engine, window, bundled docker CLI + Compose + buildx); kiri-lite-bin is
# the engine only. Bump pkgver once and both follow.
pkgbase=kiri-bin
pkgname=('kiri-bin' 'kiri-lite-bin')
pkgver=0.1.17
pkgrel=1
pkgdesc="Tiny, fast container runtime speaking the Docker API"
arch=('x86_64' 'aarch64')
url="https://runkiri.com"
_gh="https://github.com/libracoder/kiri"
license=('Apache-2.0')
# Prebuilt (static Rust/Go) binaries: nothing to strip, no debug info.
options=('!strip' '!debug')
source=('kiri.sysusers' 'kiri-path.sh' 'kiri.install')
source_x86_64=(
  "kiri-${pkgver}-x86_64.deb::${_gh}/releases/download/v${pkgver}/kiri_${pkgver}_amd64.deb"
  "kiri-lite-${pkgver}-x86_64.deb::${_gh}/releases/download/v${pkgver}/kiri-lite_${pkgver}_amd64.deb"
)
source_aarch64=(
  "kiri-${pkgver}-aarch64.deb::${_gh}/releases/download/v${pkgver}/kiri_${pkgver}_arm64.deb"
  "kiri-lite-${pkgver}-aarch64.deb::${_gh}/releases/download/v${pkgver}/kiri-lite_${pkgver}_arm64.deb"
)
# makepkg would unpack both .debs into the same data.tar.*; _unpack_deb does it.
noextract=(kiri{,-lite}-"${pkgver}"-{x86_64,aarch64}.deb)
sha256sums=('1e8f1730d7bca0eacdc7d1dea9e86e2dc690e1e14434fd90d98ad54bcf48df8d'
            'fa0bd2c3b048b5205b21c66959ba23e63ddde224ee0b1a14a11d2ad13f9375e2'
            'cc85676414f87b4c07af61e8df1a298fd3cc82fed4ec7024dec250fc629ced47')
sha256sums_x86_64=('1065eb98a95ab20b7898bad467d2e963e7bf0b1d2649c01a3e102c2d39da0b44'
                   '0dd842bbf48e7705e1f53b9d79d65190746e71def3f800788dadd872dc7aa17c')
sha256sums_aarch64=('41623f60f6fc9111e25a0e1ecdbec12fb2ccc481aca709b1e498e16329687ad6'
                    '3cf93765c9349a805497f490c44c9b7234214ee38d723030e53d957160a3d5fa')

# Unpack a .deb's data.tar.* into $pkgdir and fix it up for Arch.
_unpack_deb() {
  local _deb=$1 _tmp
  _tmp=$(mktemp -d "$srcdir/deb.XXXXXX")
  bsdtar -xf "$_deb" -C "$_tmp"
  bsdtar -xpf "$_tmp"/data.tar.* -C "$pkgdir"
  rm -rf "$_tmp"

  # /lib is a symlink to usr/lib on Arch; packages must not ship it.
  install -dm755 "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/lib/systemd/system/kiri.service" "$pkgdir/usr/lib/systemd/system/"
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

package_kiri-bin() {
  pkgdesc+=" (with GUI and bundled docker CLI, Compose, buildx)"
  # kiri and kiri-init are static; these are kiri-window's ELF dependencies.
  depends=('gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'polkit' 'webkit2gtk-4.1')
  optdepends=(
    'docker: system docker CLI (preferred over the bundled one when installed)'
    'docker-compose: system Compose plugin (preferred over the bundled one)'
    'docker-buildx: system buildx plugin (preferred over the bundled one)'
  )
  # Not provides=('kiri'): the AUR's kiri-git is an unrelated KiCad tool that
  # provides that name. It also installs /usr/bin/kiri, hence the conflict.
  conflicts=('kiri-lite-bin' 'kiri-git')
  install=kiri.install

  _unpack_deb "kiri-${pkgver}-${CARCH}.deb"

  # Kiri's docker CLI and its wrapper: Arch keeps helpers in /usr/lib/<pkg>,
  # not /usr/libexec. Nothing but the wrapper names the old path.
  mv "$pkgdir/usr/libexec/kiri/bin" "$pkgdir/usr/lib/kiri/bin"
  mv "$pkgdir/usr/libexec/kiri/docker" "$pkgdir/usr/lib/kiri/docker"
  sed -i 's|/usr/libexec/kiri/bin/docker|/usr/lib/kiri/bin/docker|' "$pkgdir/usr/lib/kiri/docker"
  rmdir "$pkgdir/usr/libexec/kiri"

  # Arch's docker-compose / docker-buildx own /usr/lib/docker/cli-plugins.
  # /usr/libexec/docker/cli-plugins is the one other system directory the
  # docker CLI searches, after that one, so the system plugins (when
  # installed) win, as upstream intends. namcap flags ELF files there.
  install -dm755 "$pkgdir/usr/libexec/docker"
  mv "$pkgdir/usr/lib/docker/cli-plugins" "$pkgdir/usr/libexec/docker/cli-plugins"
  rm -rf "$pkgdir/usr/lib/docker"

  # Debian uses update-alternatives (priority 10) to put Kiri's docker at
  # /usr/bin/docker. That would conflict with Arch's docker package, so the
  # wrapper goes in its own directory, appended to the end of PATH: any other
  # docker on PATH still wins.
  install -dm755 "$pkgdir/usr/lib/kiri/path"
  ln -s /usr/lib/kiri/docker "$pkgdir/usr/lib/kiri/path/docker"
  install -Dm644 "$srcdir/kiri-path.sh" "$pkgdir/etc/profile.d/kiri.sh"

  _licenses kiri
}

package_kiri-lite-bin() {
  pkgdesc+=" (engine only)"
  depends=('glibc')
  optdepends=(
    'docker: docker CLI to talk to the engine'
    'polkit: pkexec for kiri host-access'
  )
  conflicts=('kiri-bin' 'kiri-git')
  install=kiri.install

  _unpack_deb "kiri-lite-${pkgver}-${CARCH}.deb"
  _licenses kiri-lite
}
