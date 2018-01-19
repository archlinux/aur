# Maintainer: Chih-Hsuan Yen (a.k.a Yen Chi Hsuan) <yan12125@gmail.com>
# Modified from aur/keybase-git
# Contributor: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-headless-git
pkgdesc='The Keybase Go client and filesystem. No GUI part'
license=('BSD')
url='https://keybase.io'
pkgver=1.0.39+17925.050a48cc6e
pkgver() {
  "$srcdir/client/packaging/linux/arch/keybase_git_version.sh"
}
pkgrel=2
arch=('i686' 'x86_64')
depends=(bash glibc fuse2)
makedepends=(go git)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-bin keybase-git)
source=(
  'git+https://github.com/keybase/client'
  'git+https://github.com/keybase/kbfs'
  'no-gui.patch'
)
md5sums=('SKIP'
         'SKIP'
         'f5ebf72c2edbfca1f3326e0aced42ca9')
install=keybase.install

prepare() {
  cd "$srcdir/client"

  patch -Np1 -i ../no-gui.patch
}

build() {
  if [ "$CARCH" = "i686" ] ; then
    export KEYBASE_SKIP_64_BIT=1
  elif [ "$CARCH" = "x86_64" ] ; then
    export KEYBASE_SKIP_32_BIT=1
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
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cp -r "$srcdir/build_dir/binaries/$deb_arch"/* "$pkgdir"

  # Delete GUI-specific files
  rm "$pkgdir/usr/lib/systemd/user/keybase.gui.service"
  rm -r "$pkgdir/usr/share/"{applications,icons}
}
