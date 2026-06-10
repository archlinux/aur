# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

_name=wakatime-cli
pkgname=wakatime
pkgver='2.15.1'
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('x86_64')
url="https://github.com/wakatime/wakatime-cli"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go')
# LTO renders GO BUILDID unreproducible: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108534
options=(!lto)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e0dfaad72c69423855e0378726c7a26ae3eaea6cfe466a016a8df24ccbeb5cfff6692bd750f64ed3d060dd89c2b0b68adbc6173794f351074010fa5733023ed0')
b2sums=('acdf48b572e3f2cf05753ed8359f111e5b645a1a447557cf23a734f587a9b9b9a181bfbfc36c1de0a300145ea9e1757eef5c27b59523341cbb368d7f7041719b')

prepare() {
  rm -rf "$_name-$pkgver"/build
  cd "$_name-$pkgver"
  # create build dir and add symlink to built executable so tests can find it
  mkdir -p build
  ln -sv $pkgname build/$_name-linux-amd64

  # replace hardcoded test assumptions
  sed -e "s/<local-build>/${pkgver}/" -i ./main_test.go
}

build() {
  # provide date but make it reproducible
  local _date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" '+%Y-%m-%dT%H:%M:%S %Z')"
  # we don't care about the commit as we are building from source tarball
  local _commit="0000000"
  local _repo="${url#https://}"

  cd "$_name-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o build/$pkgname \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X '${_repo}/pkg/version.OS=linux' -X '${_repo}/pkg/version.Arch=amd64' -X '${_repo}/pkg/version.BuildDate=${_date}' -X '${_repo}/pkg/version.Commit=${_commit}' -X '${_repo}/pkg/version.Version=${pkgver}'"
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 build/$pkgname -t "${pkgdir}"/usr/bin/
  ln -s "${pkgname}" "${pkgdir}"/usr/bin/$_name
  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
