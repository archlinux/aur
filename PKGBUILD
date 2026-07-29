# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

_name=wakatime-cli
pkgname=wakatime
pkgver='2.23.0'
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
sha512sums=('b7760bf6a73d2b59c39a6504a79e92416ddbaf2aa1a5015f85a845f8962043d4564353d42ebfe181be337d9dd905e31313b3dde64fcbbf30299c23f40f016aba')
b2sums=('cbf44410e7a712c422b890081e3f4f33b27d831e42e04f0fabadd8fc3daa76a8af82ea5839bea1e660b00458119c45483a90492cc19ebf782924d0950144a52d')

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
