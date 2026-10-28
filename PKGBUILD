# Maintainer: CPT_Dawn <dev@cptdawn.dev>
#
# Tracks Linuwu-Sense main. See docs/adr/0002-own-linuwu-sense-dkms-git.md.
_pkgname=linuwu-sense
pkgname=linuwu-sense-dkms-git
pkgver=r169.4483b6c
pkgrel=1
pkgdesc='Linuwu-Sense kernel module for Acer Predator/Nitro laptops (DKMS, git, clang-aware)'
arch=('any')
url='https://github.com/0x7375646F/Linuwu-Sense'
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
optdepends=(
  'linux-headers: build the module for the stock Arch kernel (use your kernel'\''s headers package)'
  'clang: build the module for clang-built kernels (CachyOS and friends)'
  'lld: build the module for clang-built kernels (CachyOS and friends)'
  'llvm: build the module for clang-built kernels (CachyOS and friends)'
)
provides=('linuwu-sense-dkms')
conflicts=('linuwu-sense-dkms')
install=linuwu-sense-dkms-git.install
# Temporary: upstream main lost the PH16-71 (Linuwu-Sense#103). Drop this and its
# prepare() step once https://github.com/0x7375646F/Linuwu-Sense/pull/152 merges.
_ph16_71_patch=0001-restore-predator-ph16-71-dmi-entry.patch
source=(
  "$_pkgname::git+$url.git"
  'dkms.conf.in'
  'Kbuild'
  'linuwu-sense.modprobe.conf'
  'linuwu-sense.modules-load.conf'
  "$_ph16_71_patch"
)
sha256sums=('SKIP'
            '60847063de1bc013b0c426cdab46e08ba8d4e5a6844528674c2820b4b6ada48c'
            '5a77a374f071164ce51b4b50d5fdff2c3cdc52ae435b3317c6aa951f546cdffc'
            'f4a17978d732f3c74cae8eade7bba21aab9cb54af0cd47c92b6239cf58946d8f'
            'b98f144b07ec367c2ac334ef3abcf6634200ccb23ea2884c9eff95bd18bcd6e1'
            '0c1f66d5f52aa60e9f437da2068b58d2685a1327ac12fa6f04c3188f4274894f')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  if grep -Eq 'DMI_PRODUCT_NAME, *"Predator PH16-71"' src/linuwu_sense.c; then
    echo "Upstream has the PH16-71 DMI entry; skipping $_ph16_71_patch (time to drop it)"
    return 0
  fi
  # git apply refuses fuzz: a patch that no longer fits fails the build loudly.
  if ! git apply --verbose "$srcdir/$_ph16_71_patch"; then
    echo "$_ph16_71_patch no longer applies to upstream; refresh it from Linuwu-Sense#152" >&2
    return 1
  fi
}

package() {
  local dest="$pkgdir/usr/src/$_pkgname-$pkgver"

  # DKMS source tree: our own dkms.conf and Kbuild (upstream's Makefile has a
  # sudo-based signing block that has no business inside a DKMS build).
  install -dm755 "$dest/src"
  install -m644 "$_pkgname/src/linuwu_sense.c" "$dest/src/"
  install -m644 Kbuild "$dest/Kbuild"
  sed "s/@PKGVER@/$pkgver/" dkms.conf.in >"$dest/dkms.conf"
  chmod 644 "$dest/dkms.conf"

  # acer_wmi claims the same WMI GUIDs; keep it out of the way.
  install -Dm644 linuwu-sense.modprobe.conf "$pkgdir/usr/lib/modprobe.d/linuwu-sense.conf"
  install -Dm644 linuwu-sense.modules-load.conf "$pkgdir/usr/lib/modules-load.d/linuwu-sense.conf"

  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
