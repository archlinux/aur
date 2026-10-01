# PKGBUILD
# Maintainer: Javier Tia <floss@jetm.me>

# Replaces upstream's own whatsit-git, which tracks the master branch head
# through a pkgver() git-describe call. pikaur's --devel check re-evaluates
# every -git package's pkgver() on every run regardless of whether upstream
# has actually moved, so whatsit-git showed up as "up to date -- reinstalling"
# on every single pikaur -Syu with a 0.00 MiB net change. Pinning to one
# upstream tag turns it back into an ordinary versioned package that pikaur
# only re-checks when a newer version is actually published.
#
# b21be244ab15e907731d33690c945f8895f23719 is upstream's v5.0.3 tag exactly
# (confirmed via `gh api repos/devlinman/whatsit/tags`), so this builds from
# the tagged release source with a real checksum rather than a git clone -
# whatsit-git's own sha256sums=('SKIP') is flagged in the AUR packaging
# guidelines for exactly this reason, and a tagged commit has a real tarball
# to hash.
#
# To move to a newer upstream release: bump pkgver and _tag, reset pkgrel to
# 1, run updpkgsums, then regenerate .SRCINFO.

pkgname=whatsit-jetm
pkgver=5.0.3
pkgrel=1
_tag="v${pkgver}"
pkgdesc="Lightweight (KDE) native Qt6 WhatsApp Web client, pinned to a release tag instead of tracking master"
arch=('x86_64')
url="https://github.com/devlinman/whatsit"
license=('MIT')

depends=(
  'qt6-base'
  'qt6-webengine'
  'kconfig'
  'knotifications'
  'kstatusnotifieritem'
  'kwidgetsaddons'
  'kiconthemes'
)

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)

provides=("whatsit=$pkgver")
conflicts=('whatsit' 'whatsit-git')
replaces=('whatsit-git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('b84664c745c5d2fdbb3f8ea241e90d9569ce75689000d1e01e0496b2542b63f7')

build() {
  cd "whatsit-${pkgver}"

  cmake -B build -S . \
    -GNinja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "whatsit-${pkgver}"

  DESTDIR="$pkgdir" cmake --install build

  # CMakeLists.txt hardcodes share/licenses/whatsit regardless of pkgname,
  # which namcap flags as a missing license file under this package's own
  # name - reinstall it where namcap (and pacman -Qi -L) expect to find it.
  rm -rf "$pkgdir/usr/share/licenses/whatsit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
