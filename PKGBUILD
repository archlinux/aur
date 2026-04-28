# Maintainer: taotieren <admin@taotieren.com>

pkgbase=motorbridge
pkgname=(motorbridge libmotorbridge python-motorbridge)
pkgver=0.2.4
pkgrel=1
pkgdesc='Unified CAN motor control stack with a vendor-agnostic Rust core, stable C ABI, and Python/C++ bindings'
arch=($CARCH)
url='https://github.com/tianrking/motorbridge'
license=('MIT')
replaces=()
depends=(
  glibc
  libgcc
  python
)
makedepends=(
  cargo
  cmake
  git
  pkgconf

  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=()
optdepends=()
options=(!strip !debug staticlibs !lto)
source=("${pkgbase}::git+${url}.git#tag=v${pkgver}")
sha256sums=('88bddb97e7321a1ad4e64554f279c76fc9aef9344d25a3d7989016a8dba946e6')


prepare() {
  git -C "${srcdir}/${pkgbase}" clean -dfx
  cd "${srcdir}/${pkgbase}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

  ABI_LIB="${srcdir}/${pkgbase}/target/release/libmotor_abi.so"
  GW_BIN="${srcdir}/${pkgbase}/target/release/ws_gateway"
  MOTORBRIDGE_LIB="${ABI_LIB}"
  MOTORBRIDGE_WS_GATEWAY_BIN="${GW_BIN}"
  # export LD_LIBRARY_PATH=${srcdir}/${pkgbase}/target/release:${LD_LIBRARY_PATH}

build() {
  cd "${srcdir}"/${pkgbase}/

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build \
      --offline \
      --locked \
      --release

  cmake -S bindings/cpp \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMOTORBRIDGE_ABI_LIBRARY=$ABI_LIB \
    -DMOTORBRIDGE_ABI_HEADER="motor_abi/include/motor_abi.h" \
    -DMOTORBRIDGE_CPP_BUILD_EXAMPLES=OFF \
    -Wno-dev \
    -B bindings/cpp/build

  cmake --build bindings/cpp/build


  cd ${srcdir}/${pkgbase}/bindings/python
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}"/${pkgbase}/
#   ctest --test-dir build --output-on-failure
# }

package_motorbridge() {
  # pkgdesc
  provides=(
    ${pkgname}
  )
  conflicts=(
    ${pkgname}
  )
  depends=(
    glibc
    libgcc
    python
  )
  arch=($CARCH)

  cd "${srcdir}"/${pkgbase}
  # cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
  find target/release \
      -maxdepth 1 \
      -executable \
      -type f \
      -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
  rm -rf ${pkgdir}/usr/bin/*.so
  install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -R examples "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_libmotorbridge() {
  pkgdesc+=" - c/cpp module"
  provides=(
    ${pkgname}
  )
  conflicts=(
    ${pkgname}
  )
  depends=(
    glibc
    libgcc
  )
  arch=($CARCH)

  cd "${srcdir}"/${pkgbase}
  DESTDIR="${pkgdir}" cmake --install "bindings/cpp/build"
  install -vDm644 target/release/*.a -t "${pkgdir}/usr/lib/"
  install -vDm644 target/release/*.so -t "${pkgdir}/usr/lib/"
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python-motorbridge() {
  pkgdesc+=" - python module"
  provides=(
    ${pkgname}
  )
  conflicts=(
    ${pkgname}
  )
  depends=(
    glibc
    libgcc
    python
  )
  arch=($CARCH)

  cd "${srcdir}"/${pkgbase}/
  python -m installer --destdir="${pkgdir}" bindings/python/dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
