# Maintainer: Brian Picciano <mediocregopher@gmail.com>
# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-git-arm
pkgdesc='the Keybase Go client, filesystem, and GUI (built for arm)'
license=('BSD')
url='https://keybase.io'
pkgver=3.0.0+29116.3552b8044a
pkgver() {
  "$srcdir/client/packaging/linux/arch/keybase_git_version.sh"
}
pkgrel=1
arch=('armv7h' 'aarch64')
depends=(fuse gconf libxss gtk2) # don't change this without changing the SRCINFO template too
makedepends=(go yarn npm git rsync patch)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-bin keybase-git)
source=(
  'git+https://github.com/keybase/client'
  'git+https://github.com/keybase/kbfs'
)
md5sums=('SKIP' 'SKIP')

build() {
  echo 'diff --git a/packaging/linux/build_binaries.sh b/packaging/linux/build_binaries.sh
index b7b7e1d16..999636177 100755
--- a/packaging/linux/build_binaries.sh
+++ b/packaging/linux/build_binaries.sh
@@ -170,20 +170,7 @@ build_one_architecture() {
 # resinit_nix.go and fail the i386 build
 export CGO_ENABLED=1
 
-if [ -z "${KEYBASE_SKIP_64_BIT:-}" ] ; then
-  export GOARCH=amd64
-  export debian_arch=amd64
-  export electron_arch=x64
-  build_one_architecture
-else
-  echo SKIPPING 64-bit build
-fi
-
-if [ -z "${KEYBASE_SKIP_32_BIT:-}" ] ; then
-  export GOARCH=386
-  export debian_arch=i386
-  export electron_arch=ia32
-  build_one_architecture
-else
-  echo SKIPPING 32-bit build
-fi
+export GOARCH=arm64
+export debian_arch=arm64
+export electron_arch=arm64
+build_one_architecture' | (cd client && patch -p1)

  "$srcdir/client/packaging/linux/build_binaries.sh" prerelease "$srcdir/build_dir"
}

package() {
  # use sh so that glob works
  sh -c "cp -r $srcdir/build_dir/binaries/arm64/* $pkgdir"
}

post_install() {
  /opt/keybase/post_install.sh
}

post_upgrade() {
  /opt/keybase/post_install.sh
}
