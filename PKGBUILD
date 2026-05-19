# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname=arduino-flasher-cli
pkgver=0.5.1
pkgrel=1
pkgdesc="Arduino UNO Q image flasher"
arch=('x86_64' 'aarch64')
url="https://github.com/arduino/arduino-flasher-cli"
license=('GPL-3')
makedepends=(
	'go'
	'go-task'
)
depends=('qdl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5fff4bded7754078986190d15f38dd55f0b25fba4c425680c767663345e0b6a6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Pre-populate qdl artifacts from system binary to avoid gh download from private repo
  local artifacts_dir="internal/updater/artifacts"
  local qdl_bin="/usr/local/bin/qdl"
  for dir in resources_linux_amd64 resources_linux_arm64 resources_darwin_amd64 resources_darwin_arm64; do
    mkdir -p "${artifacts_dir}/${dir}"
    cp "$qdl_bin" "${artifacts_dir}/${dir}/qdl"
  done
  mkdir -p "${artifacts_dir}/resources_windows_amd64"
  cp "$qdl_bin" "${artifacts_dir}/resources_windows_amd64/qdl.exe"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go-task init
  go-task build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
