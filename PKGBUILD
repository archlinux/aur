# Maintainer: czyt <czytcn@gmail.com>

pkgname=kiri-desktop-lite-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Tiny, fast container runtime speaking the Docker API (engine only)"
arch=('x86_64' 'aarch64')
url="https://runkiri.com"
_gh="https://github.com/libracoder/kiri"
license=('Apache-2.0')
# kiri and kiri-init are static (musl) binaries.
depends=('glibc')
optdepends=(
  'docker: docker CLI to talk to the engine'
  'polkit: pkexec for kiri host-access'
)
# Not provides=('kiri'): AUR kiri-git is an unrelated KiCad tool providing
# that name; it also installs /usr/bin/kiri, hence the conflict.
conflicts=('kiri-git' 'kiri-bin' 'kiri-lite-bin' 'kiri-desktop-bin')
install=kiri-desktop-lite-bin.install
options=('!strip' '!debug')

source_x86_64=(
  "kiri-lite-${pkgver}-x86_64.deb::${_gh}/releases/download/v${pkgver}/kiri-lite_${pkgver}_amd64.deb"
)
source_aarch64=(
  "kiri-lite-${pkgver}-aarch64.deb::${_gh}/releases/download/v${pkgver}/kiri-lite_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('274fbb272a5ec7673ea82ef1917630fb4a30720d2eff46560c1393d44684bc52')
sha256sums_aarch64=('4ed50d79b86bb5d5332efc376b2f93db0c6984c5b5198b4f2833520e665a05ee')
# makepkg would unpack the .deb into srcdir; _unpack_deb does it here.
noextract=("kiri-lite-${pkgver}-x86_64.deb" "kiri-lite-${pkgver}-aarch64.deb")

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
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/kiri.conf" <<'EOF'
# Users in this group can reach /run/kiri/docker.sock (root-equivalent, like the docker group).
g kiri - -
EOF

  # Debian packaging metadata is not used on Arch Linux.
  rm -f "$pkgdir/usr/share/doc/kiri-lite/copyright"

  find "$pkgdir" -type d -exec chmod 755 {} +
}

_licenses() {
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/kiri-lite/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s /usr/share/doc/kiri-lite/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

package() {
  _unpack_deb "kiri-lite-${pkgver}-${CARCH}.deb"
  _licenses
}
