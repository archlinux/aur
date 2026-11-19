# Maintainer: czyt <czytcn@gmail.com>

pkgname=kiri-desktop-lite-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Tiny, fast container runtime speaking the Docker API (engine only)"
arch=('x86_64' 'aarch64')
url="https://runkiri.com"
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

# download.runkiri.com is the download host the release notes link to, and the
# one place with every .deb: the GitHub release for 0.2.1 shipped no checksum
# file at all and no kiri (full) .deb, while every file both hosts carry is
# identical. www.runkiri.com/releases/ lists these very URLs.
_dl="https://download.runkiri.com"
source_x86_64=(
  "kiri-lite-${pkgver}-x86_64.deb::${_dl}/kiri-lite_${pkgver}_amd64.deb"
)
source_aarch64=(
  "kiri-lite-${pkgver}-aarch64.deb::${_dl}/kiri-lite_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('24798125ee50bb24db86594a9ee1469b1032d9b2ffd7da616b06e40763c723b9')
sha256sums_aarch64=('5388bd5651db97a23d7eb9f057881522cbad8a27b3463d293f337b8c8797d7f2')
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
