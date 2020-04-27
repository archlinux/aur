# Maintainer: Keybase <linux-packages@keybase.io>
# Contributor: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-git
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=5.5.0+35896.807c29924b
pkgver() {
  "$srcdir/client/packaging/linux/arch/keybase_git_version.sh"
}
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=(fuse libxss gtk2 lsof) # don't change this without changing the SRCINFO template too,
                                # and the keybase-bin files in keybase/client/packaging/linux/arch
makedepends=(go-pie yarn npm git rsync)
provides=(keybase keybase-gui kbfs)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-bin keybase-gui kbfs)
source=(
  'git+https://github.com/keybase/client'
)
md5sums=('SKIP')
install=keybase.install

build() {
  if [ "$CARCH" = "i686" ] ; then
    export KEYBASE_SKIP_64_BIT=1
  elif [ "$CARCH" = "x86_64" ] ; then
    export KEYBASE_SKIP_32_BIT=1
  elif [ "$CARCH" = "aarch64" ] || [ "$CARCH" = "armv7h" ] ; then
    export KEYBASE_BUILD_ARM_ONLY=1
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  "$srcdir/client/packaging/linux/build_binaries.sh" prerelease "$srcdir/build_dir"
}

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  elif [ "$CARCH" = "aarch64" ] || [ "$CARCH" = "armv7h" ] ; then
    deb_arch="arm64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi
  sh -c "cp -r $srcdir/build_dir/binaries/$deb_arch/* $pkgdir"
}
