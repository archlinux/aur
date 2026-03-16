# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: yubimusubi <possum plus aur at possum dot cc>

_reponame=3dstool
pkgname=$_reponame-git
pkgver=1.2.6.r15.g3771ae96
pkgrel=1
epoch=1
pkgdesc="An all-in-one tool for extracting/creating 3ds roms (git)"
arch=('x86_64')
url="https://github.com/dnasdw/$_reponame"
license=('MIT')
depends=('glibc' 'curl' 'openssl')
makedepends=('cmake' 'git')
source=(
  "git+${url}.git"
  "$_reponame-paths.patch"
)
b2sums=('SKIP'
  '226f75f5154d849aec1816064aa5d87db0e41c07d02edb85df5b2b397172a30b32603bccfdfa09a5431f9fbc12fcbbd9a5baccf6d82523d9253a430af0432108')
provides=("$_reponame")
conflicts=("$_reponame")

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  patch -Np1 -i "../$_reponame-paths.patch" -d "$_reponame"
}

build() {
  cd "$_reponame"

  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE='Release'
    -D BUILD64=ON
    -D USE_DEP=OFF
    -D CMAKE_SKIP_RPATH=ON
    -D CMAKE_BUILD_WITH_INSTALL_RPATH=OFF
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  cd "$_reponame"

  install -Dm755 "bin/Release/$_reponame" -t "$pkgdir/usr/bin"
  install -Dm644 "bin/ignore_$_reponame.txt" -t "$pkgdir/usr/share/$_reponame"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
