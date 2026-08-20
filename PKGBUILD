# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Kris Nóva <kris@nivenly.com> R.I.P.

pkgname='falco'
pkgver='0.44.1'
_rules_ver='5.1.0'
_libs_ver='0.25.4'
_driver_ver='10.2.0'
_ctl_ver='0.13.0'
_p_container_ver='0.7.1'
pkgrel='4'
pkgdesc='Falco is a cloud native runtime security tool for Linux operating systems'
arch=('x86_64' 'aarch64')
url="https://${pkgname}.org/"
_uri="github.com/${pkgname}security"
license=('Apache2.0')
depends=('curl' 'zlib' 'jsoncpp>=1.9.5' 'libssh2' 'e2fsprogs' 're2' 'onetbb>=2022.1.0' 'yaml-cpp>=0.9.0'
         'libbpf' 'libelf' 'openssl' 'brotli')
makedepends=('cmake' 'cxxopts>=3.3.1' 'clang' 'jemalloc' 'go>=1.25.7' 'git' 'bpf' 'gperftools'
             'cpp-httplib>=0.23.1' 'nlohmann-json>=3.11.3' 'uthash>=1.9.8' 'valijson>=1.0.2')
checkdepends=('cppcheck')
backup=("etc/${pkgname}/${pkgname}.yaml"
        "etc/${pkgname}/${pkgname}_rules.yaml")
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/${pkgver}"
	"rules-${_rules_ver}.tar.gz::https://codeload.${_uri}/rules/tar.gz/refs/tags/${pkgname}-rules-${_rules_ver}"
	"libs-${_libs_ver}.tar.gz::https://codeload.${_uri}/libs/tar.gz/refs/tags/${_libs_ver}"
	"libs-${_driver_ver}-driver.tar.gz::https://codeload.${_uri}/libs/tar.gz/refs/tags/${_driver_ver}+driver"
	"${pkgname}ctl-${_ctl_ver}.tar.gz::https://codeload.${_uri}/${pkgname}ctl/tar.gz/refs/tags/v${_ctl_ver}"
	"plugins-plugins-container-v${_p_container_ver}.tar.gz::https://codeload.${_uri}/plugins/tar.gz/refs/tags/plugins/container/v${_p_container_ver}"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles")
sha256sums=('661d0dc62f0eb82352f8b176e423bd34fdc44ca4c98b3f329fd73d984f0c50f5'
            '8b1a9e61030e88ca3e8727cfe20bab8f662d6e2e6b13178e2be57d38e025af24'
            '272a5a0c05e7c10a658ed9649023e6179061a4ab29e012602893586ac64b5938'
            '0e585f5fc2b76696ef2cb902f0901ea39a2f2df87e1f091f3348f968b9085f39'
            '804a37e6372201ee21d3bc99ffea6079484b557ece0aa17719dbc6e8cb2b5fec'
            '111223c2c85344856ac371243efbb0ea4b07538a62738bf80e00bac17e3cf7d6'
            '64edf36a93fceb949d186505d703c1fb49a47892b63d77d49f4db92ee69df535'
            'ce971a3f52ab84182146da14651eabbac9b33157bacebe5efc087f461d18bc49'
            '5c7f1ba69b9af0e919deea901b8b9dfc1fa8d9e287b0c5a189e7dca9956558e1')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${GOPATH}/tmp"
  mkdir -p "${GOPATH}/src/${_uri}"
  mkdir -p "${GOTMPDIR}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  ln -snf "${srcdir}/${pkgname}ctl-${_ctl_ver}" "${GOPATH}/src/${_uri}/${pkgname}ctl"

  # Use distro FORTIFY_SOURCE
  sed --in-place \
    --expression 's|-D_FORTIFY_SOURCE=2||g' \
    "${pkgname}-${pkgver}/cmake/modules/CompilerFlags.cmake"

  # Do not listen 0.0.0.0/0 by default!
  sed --in-place \
    --expression 's|listen_address: 0.0.0.0|listen_address: 127.0.0.1|g' \
    "${pkgname}-${pkgver}/${pkgname}.yaml"

  # plugin/container golang code - set flags for cache
  sed --in-place \
    --expression 's|CGO_ENABLED=1||g' \
    --expression 's|ldflags="-s -w"|ldflags "-linkmode external -extldflags '\''${LDFLAGS}'\''"|g' \
    --expression 's|go build|go build -trimpath -mod=readonly -modcacherw|g' \
    "plugins-plugins-container-v${_p_container_ver}/plugins/container/go-worker/Makefile"

  # plugin/container CXX - do not strip, save debug symbols
  sed --in-place \
    --expression 's| -s||g' \
    "plugins-plugins-container-v${_p_container_ver}/plugins/container/cmake/modules/compiler.cmake"
}

build() {
  # This is CMake prepare for plugin/container - very req plugin due hardcode in falco_rules.yaml file
  cmake -B "plugin-container-build" -S "plugins-plugins-container-v${_p_container_ver}/plugins/container" \
    -Wno-author \
    -D CMAKE_BUILD_TYPE="Release" \
    -D LIBS_DIR="${srcdir}/libs-${_libs_ver}" \
    -D USE_BUNDLED_DEPS=Off \
    -D USE_BUNDLED_DRIVER=Off \
    -D USE_BUNDLED_JSONCPP=Off \
    -D USE_BUNDLED_CXXOPTS=Off \
    -D USE_BUNDLED_RE2=Off \
    -D USE_BUNDLED_TBB=Off \
    -D USE_BUNDLED_UTHASH=Off \
    -D USE_BUNDLED_VALIJSON=Off \
    -D USE_BUNDLED_ZLIB=Off
  # This is build for plugins/container
  cmake --build "plugin-container-build" --target "container" --config "Release"

  # This is CMake prepare for eBPF files that req for actual falco build
  cmake -B "skeleton-build" -S "${pkgname}-${pkgver}" \
    -Wno-author \
    -D CMAKE_BUILD_TYPE="Release" \
    -D DRIVER_SOURCE_DIR="${srcdir}/libs-${_driver_ver}-driver/driver" \
    -D DRIVER_VERSION="${_driver_ver}" \
    -D FALCOSECURITY_LIBS_SOURCE_DIR="${srcdir}/libs-${_libs_ver}" \
    -D FALCOSECURITY_LIBS_VERSION="${_libs_ver}" \
    -D FALCOSECURITY_RULES_FALCO_PATH="${srcdir}/rules-${pkgname}-rules-${_rules_ver}/rules/${pkgname}_rules.yaml" \
    -D USE_BUNDLED_DEPS=Off \
    -D USE_BUNDLED_CPPHTTPLIB=Off \
    -D USE_BUNDLED_DRIVER=Off \
    -D USE_BUNDLED_JSONCPP=Off \
    -D USE_BUNDLED_LIBBPF=Off \
    -D USE_BUNDLED_LIBELF=Off \
    -D USE_BUNDLED_MODERN_BPF=Off \
    -D USE_BUNDLED_NLOHMANN_JSON=Off \
    -D USE_BUNDLED_OPENSSL=Off \
    -D USE_BUNDLED_RE2=Off \
    -D USE_BUNDLED_TBB=Off \
    -D USE_BUNDLED_UTHASH=Off \
    -D USE_BUNDLED_VALIJSON=Off \
    -D USE_BUNDLED_YAMLCPP=Off \
    -D USE_BUNDLED_ZLIB=Off \
    -D BUILD_DRIVER=Off \
    -D USE_JEMALLOC=Off \
    -D BUILD_FALCO_MODERN_BPF=On \
    -D FALCO_VERSION="${pkgver}"
    cmake --build "skeleton-build" --target "ProbeSkeleton" --config "Release"

  # This is CMake prepare for falco
  cmake -B "build" -S "${pkgname}-${pkgver}" \
    -Wno-author \
    -D CMAKE_BUILD_TYPE="Release" \
    -D DRIVER_SOURCE_DIR="${srcdir}/libs-${_driver_ver}-driver/driver" \
    -D DRIVER_VERSION="${_driver_ver}" \
    -D FALCOSECURITY_LIBS_SOURCE_DIR="${srcdir}/libs-${_libs_ver}" \
    -D FALCOSECURITY_LIBS_VERSION="${_libs_ver}" \
    -D FALCOSECURITY_RULES_FALCO_PATH="${srcdir}/rules-${pkgname}-rules-${_rules_ver}/rules/${pkgname}_rules.yaml" \
    -D USE_BUNDLED_DEPS=Off \
    -D USE_BUNDLED_CPPHTTPLIB=Off \
    -D USE_BUNDLED_DRIVER=Off \
    -D USE_BUNDLED_JSONCPP=Off \
    -D USE_BUNDLED_LIBBPF=Off \
    -D USE_BUNDLED_LIBELF=Off \
    -D USE_BUNDLED_MODERN_BPF=Off \
    -D USE_BUNDLED_NLOHMANN_JSON=Off \
    -D USE_BUNDLED_OPENSSL=Off \
    -D USE_BUNDLED_RE2=Off \
    -D USE_BUNDLED_TBB=Off \
    -D USE_BUNDLED_UTHASH=Off \
    -D USE_BUNDLED_VALIJSON=Off \
    -D USE_BUNDLED_YAMLCPP=Off \
    -D USE_BUNDLED_GPERFTOOLS=Off \
    -D USE_BUNDLED_ZLIB=Off \
    -D USE_BUNDLED_GTEST=Off \
    -D USE_BUNDLED_JEMALLOC=Off \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D CMAKE_INSTALL_LIBDIR="lib" \
    -D MODERN_BPF_SKEL_DIR="${srcdir}/skeleton-build/skel_dir" \
    -D BUILD_FALCO_UNIT_TESTS=Off \
    -D ENABLE_BENCHMARKS=Off \
    -D BUILD_DRIVER=Off \
    -D USE_JEMALLOC=Off \
    -D BUILD_FALCO_MODERN_BPF=On \
    -D USE_GPERFTOOLS=On \
    -D ADD_FALCOCTL_DEPENDENCY=Off \
    -D FALCO_VERSION="${pkgver}"

  # This is falco build
  cmake --build "build" --target "falco" --config "Release"

  # This is falcoctl build (golang)
  cd "${GOPATH}/src/${_uri}/${pkgname}ctl"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X ${_uri}/${pkgname}ctl/cmd/version.semVersion=${_ctl_ver} \
    -X ${_uri}/${pkgname}ctl/cmd/version.gitCommit=$(git rev-parse HEAD) \
    -X ${_uri}/${pkgname}ctl/cmd/version.buildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"
}

check() {
  cmake --build "build" --target "cppcheck"
  cd "${GOPATH}/src/${_uri}/${pkgname}ctl"
  TMPDIR="${GOPATH}/tmp" go test -modcacherw -cover ./...
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build" --config "release"
  install -Dm0755 "${pkgname}ctl-${_ctl_ver}/${pkgname}ctl" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm0644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  # Some compiled stuff from Internet
  rm --verbose --force "${pkgdir}/usr/share/${pkgname}/plugins/libcontainer.so"
  install -Dm0755 "plugin-container-build/libcontainer.so" -t \
"${pkgdir}/usr/share/${pkgname}/plugins"
}
