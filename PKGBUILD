# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=inertial-sense-sdk
pkgver=3.1.1
pkgrel=1
# Commit the upstream ${pkgver} tag points at. The release tarball carries no git metadata, so the
# version headers normally produced by scripts/lib/update_version_files.sh are written in prepare().
_commit=ad5cb161e28ac838112a2ec130dfaab269613672
pkgdesc="Quick integration for communication with the Inertial Sense product line."
arch=('any')
url="https://github.com/inertialsense/inertial-sense-sdk"
license=('MIT')
makedepends=('cmake' 'ninja')
depends=('libusb' 'yaml-cpp')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "https://github.com/inertialsense/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
    01-use-system-libraries.patch
)
sha256sums=(
    '7b2b1d46be973ed50999a6f49c5321e61c5833b1648fda254f4a72676de05ab4'
    '16a91594a1903313eaead0b692c27fa972598aa48bbc8a8ff8cf68eb5cb0b37a'
)
options=(
    !strip  # with g++-13, stripping breaks the static library
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --strip=1 < ../01-use-system-libraries.patch

    local _hostname _hostkey _epoch
    _hostname=$(uname -n)
    _hostkey=$(printf '%s' "${_hostname}" | md5sum | awk '{print substr($1,1,5)}')
    _epoch="${SOURCE_DATE_EPOCH:-$(date +%s)}"

    local _year _month _day _hour _min _sec _date _time
    _year=$(date -u -d "@${_epoch}" +%Y)
    _month=$(date -u -d "@${_epoch}" +%-m)
    _day=$(date -u -d "@${_epoch}" +%-d)
    _hour=$(date -u -d "@${_epoch}" +%-H)
    _min=$(date -u -d "@${_epoch}" +%-M)
    _sec=$(date -u -d "@${_epoch}" +%-S)
    _date=$(date -u -d "@${_epoch}" +%Y-%m-%d)
    _time=$(date -u -d "@${_epoch}" +%H%M%S)

    local _major _minor _revis
    IFS=. read -r _major _minor _revis <<<"${pkgver}"

    mkdir -p src/version
    cat > src/version/repositoryInfo.h <<EOF
#define IS_SDK_REPO_NAME "inertial-sense-sdk"
#define IS_SDK_REPO_BRANCH "${pkgver}"
#define IS_SDK_REPO_DESCRIPTION "${pkgver}"
#define IS_SDK_REPO_GIT_COMMIT 0x${_commit:0:8}
#define IS_SDK_REPO_VERSION_NO_META "${pkgver}"
#define IS_SDK_REPO_VERSION "${pkgver}"
#define IS_SDK_REPO_VERSION_RELEASE_TYPE 0
#define IS_SDK_REPO_VERSION_MAJOR ${_major}
#define IS_SDK_REPO_VERSION_MINOR ${_minor}
#define IS_SDK_REPO_VERSION_REVIS ${_revis}
#define IS_SDK_REPO_VERSION_PRERELEASE 0
#define IS_SDK_NSIS_VERSION_NUMBER "${pkgver}.0"
EOF

    cat > src/version/buildInfo.h <<EOF
#define IS_SDK_BUILD_NUMBER ${pkgrel}
#define IS_SDK_BUILD_TYPE 0
#define IS_SDK_BUILD_HOSTNAME "${_hostname}"
#define IS_SDK_BUILD_HOST_KEY 0x${_hostkey}
#define IS_SDK_BUILD_DATE_YEAR ${_year}
#define IS_SDK_BUILD_DATE_MONTH ${_month}
#define IS_SDK_BUILD_DATE_DAY ${_day}
#define IS_SDK_BUILD_DATE "${_date}"
#define IS_SDK_BUILD_TIME_HOUR ${_hour}
#define IS_SDK_BUILD_TIME_MINUTE ${_min}
#define IS_SDK_BUILD_TIME_SECOND ${_sec}
#define IS_SDK_BUILD_TIME_MILLISECOND 0
#define IS_SDK_BUILD_TIME "${_time}"
EOF
}

# At -O2 gcc contracts multiply-add into FMA, which changes rounding enough that the SDK's matrix and
# polynomial routines drift past the 1e-6 tolerance their own tests assert (ISMatrix.*, ISPolynomial.*).
# Disabling contraction keeps the numerics identical to the reference implementation.
_cflags="${CFLAGS} -ffp-contract=off"
_cxxflags="${CXXFLAGS} -ffp-contract=off"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -B build -GNinja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_FLAGS="${_cflags}" \
        -DCMAKE_CXX_FLAGS="${_cxxflags}" \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
    cmake -S cltool -B cltool/build -GNinja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_FLAGS="${_cflags}" \
        -DCMAKE_CXX_FLAGS="${_cxxflags}" \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C cltool/build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S tests -B tests/build -GNinja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_FLAGS="${_cflags}" \
        -DCMAKE_CXX_FLAGS="${_cxxflags}"
    ninja -C tests/build
    ./tests/build/IS-SDK_unit-tests
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local inc="${pkgdir}/usr/include/inertial-sense-sdk"

    install -Dm644 src/*.h -t "${inc}/"
    install -Dm644 src/*.hpp -t "${inc}/"
    install -Dm644 src/protocol/*.h src/protocol/*.hpp -t "${inc}/protocol/"
    install -Dm644 src/util/*.h src/util/*.hpp -t "${inc}/util/"
    install -Dm644 src/core/*.h -t "${inc}/core/"
    install -Dm644 src/version/*.h -t "${inc}/version/"
    install -Dm644 src/tl-expected/tl/*.hpp -t "${inc}/tl/"
    install -Dm644 tests/runtime/*.h -t "${inc}/runtime/"
    install -Dm644 build/libInertialSenseSDK.a "${pkgdir}/usr/lib/libInertialSense.a"
    install -Dm755 cltool/build/cltool "${pkgdir}/usr/bin/inertial-sense-cltool"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
