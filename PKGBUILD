# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="fake-gcs-server"
pkgver=1.56.1
pkgrel=1
pkgdesc="Google Cloud Storage emulator & testing library"
arch=('aarch64' 'x86_64')
url="https://github.com/fsouza/${pkgname}"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('go>=2:1.26')
checkdepends=('curl')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a322297f949d5339a8e521eb15a35b80c8023f970b0f6511a7bb84e72932ca2c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  # Use Arch's compiler; never download a prebuilt toolchain implicitly.
  export GOTOOLCHAIN=local
  go build -v -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"

  # Fetch test-only module sources while the outbound proxy is still active.
  # The ordinary build only fetched modules imported by the server binary.
  export GOTOOLCHAIN=local
  go mod download

  # Keep loopback requests in the tests and functional probe off outbound proxies.
  unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY all_proxy ALL_PROXY
  export NO_PROXY='127.0.0.1,localhost'
  export GOTOOLCHAIN=local

  go test ./...

  local runtime_dir="${srcdir}/runtime" server_pid
  rm -rf "${runtime_dir}"
  install -d "${runtime_dir}/data/sample-bucket" "${runtime_dir}/storage"
  printf 'source-built emulator\n' > \
    "${runtime_dir}/data/sample-bucket/proof.txt"
  "build/${pkgname}" -scheme http -host 127.0.0.1 -port 4443 \
    -filesystem-root "${runtime_dir}/storage" \
    -data "${runtime_dir}/data" >"${runtime_dir}/server.log" 2>&1 &
  server_pid=$!
  trap 'kill "${server_pid}" 2>/dev/null || true' RETURN

  curl --retry 30 --retry-connrefused --retry-delay 0 -fsS \
    'http://127.0.0.1:4443/storage/v1/b' >"${runtime_dir}/buckets.json"
  grep -Fq 'sample-bucket' "${runtime_dir}/buckets.json"
  curl -fsS 'http://127.0.0.1:4443/storage/v1/b/sample-bucket/o' \
    >"${runtime_dir}/objects.json"
  grep -Fq 'proof.txt' "${runtime_dir}/objects.json"
  curl -fsS \
    'http://127.0.0.1:4443/download/storage/v1/b/sample-bucket/o/proof.txt?alt=media' \
    >"${runtime_dir}/proof.txt"
  grep -Fxq 'source-built emulator' "${runtime_dir}/proof.txt"

  kill "${server_pid}"
  wait "${server_pid}" || true
  trap - RETURN
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
