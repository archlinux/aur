# Maintainer: Vyom Jain <vyom.malo6904@gmail.com>

pkgname=sony-headphones-linux
pkgver=0.2.2
pkgrel=1
pkgdesc="Native Sony Sound Connect headphones service and CLI for Linux"
arch=('x86_64')
url="https://github.com/VyomJain6904/sony-headphones-linux"
license=('MIT')
depends=('bluez' 'bluez-libs' 'dbus' 'glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'git' 'pkgconf')
optdepends=('omarchy: graphical bar widget and control panel')
provides=("sony-headphones-omarchy=$pkgver")
conflicts=('sony-headphones-omarchy')
replaces=('sony-headphones-omarchy')
install='sony-headphones-linux.install'

_upstream_commit='08e680333350610a92022dc551b8c2d4d0821054'
_libmdr_commit='db0ae2574d8f8e1407e8ea28a7ee87db9dde1c24'
_fmt_commit='407c905e45ad75fc29bf0f9bb7c5c2fd3475976f'
_source_dir="sony-headphones-linux-${_upstream_commit}"

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${_upstream_commit}.tar.gz"
  "SonyHeadphonesClient-${_libmdr_commit}.tar.gz::https://github.com/mos9527/SonyHeadphonesClient/archive/${_libmdr_commit}.tar.gz"
  "fmt-${_fmt_commit}.tar.gz::https://github.com/fmtlib/fmt/archive/${_fmt_commit}.tar.gz"
)
sha256sums=(
  '79cf440efc796e83eb7d4035ef0c9879add2fce294473825fe5d1ae2f2dbe46b'
  'd4dfd5b823c3819a5d2fc0bd5f6534db4fa882d379a94e8f122e0ed3445cddc2'
  '2bc1fe4a5b6d5d6a614239b4ca1d520e66e152a02d3d262684d26dfd6ab3438a'
)

prepare() {
  patch -d "SonyHeadphonesClient-${_libmdr_commit}" -p1 \
    < "${_source_dir}/patches/libmdr-v2-connection-priority-validation.patch"
  patch -d "fmt-${_fmt_commit}" -p1 \
    < "SonyHeadphonesClient-${_libmdr_commit}/contrib/fmt.patch"

  grep -Fq 'add_link_options(-Wl,--gc-sections -s)' \
    "SonyHeadphonesClient-${_libmdr_commit}/CMakeLists.txt"
  sed -i 's/add_link_options(-Wl,--gc-sections -s)/add_link_options(-Wl,--gc-sections)/' \
    "SonyHeadphonesClient-${_libmdr_commit}/CMakeLists.txt"
}

build() {
  cmake -S "SonyHeadphonesClient-${_libmdr_commit}" -B build-libmdr \
    -DCMAKE_BUILD_TYPE=None \
    -DMDR_BUILD_CLIENT=OFF \
    -DMDR_ENABLE_CODEGEN=OFF \
    -DMDR_ENABLE_LOG=OFF \
    -DMDR_BLE=OFF \
    -DBUILD_TESTING=OFF \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_FMT="$srcdir/fmt-${_fmt_commit}"
  cmake --build build-libmdr --target mdr mdr-bt

  cmake -S "${_source_dir}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON \
    -DSONY_WITH_LIBMDR=ON \
    -DSONY_LIBMDR_SOURCE_DIR="$srcdir/SonyHeadphonesClient-${_libmdr_commit}" \
    -DSONY_LIBMDR_BUILD_DIR="$srcdir/build-libmdr"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "${_source_dir}/systemd/sony-headphones.service" \
    "$pkgdir/usr/lib/systemd/user/sony-headphones.service"
  sed -i 's#ExecStart=%h/.local/bin/sony-headphonesd#ExecStart=/usr/bin/sony-headphonesd#' \
    "$pkgdir/usr/lib/systemd/user/sony-headphones.service"

  install -Dm644 "${_source_dir}/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_source_dir}/licenses/libmdr-LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/libmdr-LICENSE"
  install -Dm644 "${_source_dir}/licenses/fmt-LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/fmt-LICENSE"
  install -Dm644 "${_source_dir}/README.md" \
    "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_source_dir}/THIRD_PARTY.md" \
    "$pkgdir/usr/share/doc/${pkgname}/THIRD_PARTY.md"
  install -Dm644 "${_source_dir}/docs/COMPATIBILITY.md" \
    "$pkgdir/usr/share/doc/${pkgname}/COMPATIBILITY.md"
}
