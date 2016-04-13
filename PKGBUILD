# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-git
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
pkgver=1.0.15+8025.be6878d
pkgver() {
  "$srcdir/client/packaging/linux/arch/version.sh"
}
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse)
makedepends=(go npm git rsync)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release)
source=(
  'git+https://github.com/keybase/client'
  'git+https://github.com/keybase/kbfs-beta'
)
md5sums=('SKIP' 'SKIP')
install=keybase.install

build() {
  # Hack the kbfs-beta repo into the kbfs shape, by moving the contents of its
  # kbfs subdir to the top level. It's not enough to just copy a subdirectory,
  # because we run `git rev-parse ...` in the build scripts.

  # The kbfs folder contains YET ANOTHER kbfs folder, so we need an extra
  # couple steps of hacks to avoid colliding the name >.<
  mv "$srcdir/kbfs-beta/kbfs" "$srcdir/kbfs-beta/dummy_name"
  mv "$srcdir"/kbfs-beta/dummy_name/* "$srcdir/kbfs-beta"
  rmdir "$srcdir/kbfs-beta/dummy_name"
  mv "$srcdir/kbfs-beta" "$srcdir/kbfs"

  # At this point the pseudo-kbfs repo's status is totally mangled, but the
  # working copy looks right, and it has a valid HEAD.
  "$srcdir/client/packaging/linux/build_binaries.sh" prerelease "$srcdir/build_dir"
}

package() {
  if [ "$CARCH" = x86_64 ] ; then
    debian_arch=amd64
  else
    debian_arch=i386
  fi
  cp -r "$srcdir/build_dir/binaries/$debian_arch"/* "$pkgdir"
}
