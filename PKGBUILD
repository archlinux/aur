# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=jiri-git
pkgver=r1336
pkgrel=1
pkgdesc='A tool for multi-repo development similar to Android repo'
arch=(i686 x86_64)
url='https://fuchsia.googlesource.com/jiri'
license=(MIT)
depends=()
makedepends=(git go-pie cmake ninja python2)
source=(
  git+https://fuchsia.googlesource.com/jiri
  git+https://fuchsia.googlesource.com/third_party/git2go
  git+https://fuchsia.googlesource.com/third_party/boringssl#commit=438229a8d724058cb4de1af6814204f03ce734ed
  git+https://fuchsia.googlesource.com/third_party/curl#commit=280e8c6e371ebd0f2e0a907e016ab44d6c9549af
  git+https://fuchsia.googlesource.com/third_party/libssh2#commit=615210a03ecf36e1c55ffb7101d53e5c231c2f43
  git+https://fuchsia.googlesource.com/third_party/libgit2#commit=25a4b97b1bd0b5316deb77866756a3db772e08a2
  git+https://fuchsia.googlesource.com/third_party/zlib#commit=871bb1c83c0a4cc180c66ac89b14cb08675bef0d

  fix_libgit2_build.patch
  fix_libssh2_build.patch
)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          '798fbefdda5144f30e9fe6bde7ef0df01c0e9caf'
          '011af8785b96372b73e95d3c04012ad0bb34344a')

pkgver() {
  cd jiri
  echo r$(git rev-list --count master)
}

prepare() {
  cd jiri

  # script sets GOPATH to fuchsia wide location, we do not have it
  sed -i 's/export GOPATH=.*//' scripts/build.sh
  mkdir -p go

  mkdir -p go/src/fuchsia.googlesource.com
  rm -rf go/src/fuchsia.googlesource.com/jiri
  ln -sfT $srcdir/jiri go/src/fuchsia.googlesource.com/jiri
  mkdir -p go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2
  rm -rf go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go
  ln -sfT $srcdir/git2go go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go
  mkdir -p go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor
  rm -rf go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/boringssl
  ln -sfT $srcdir/boringssl go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/boringssl
  mkdir -p go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor
  rm -rf go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/curl
  ln -sfT $srcdir/curl go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/curl
  mkdir -p go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor
  rm -rf go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/libssh2
  ln -sfT $srcdir/libssh2 go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/libssh2
  mkdir -p go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor
  rm -rf go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/libgit2
  ln -sfT $srcdir/libgit2 go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/libgit2
  mkdir -p go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor
  rm -rf go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/zlib
  ln -sfT $srcdir/zlib go/src/fuchsia.googlesource.com/jiri/vendor/github.com/libgit2/git2go/vendor/zlib

  cd $srcdir/libgit2
  patch -p1 < ../fix_libgit2_build.patch

  cd $srcdir/libssh2
  patch -p1 < ../fix_libssh2_build.patch
}

build() {
  cd jiri

  GOPATH=`pwd`/go ./scripts/build.sh
}

package() {
  cd jiri
  install -D -m755 jiri "$pkgdir"/usr/bin/jiri
  install -D -m644 scripts/jiri-bash-completion.sh "$pkgdir"/usr/share/bash-completion/completions/jiri
}
