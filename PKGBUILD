# Maintainer: <tera_1225 @ hotmail ðot com>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=anki-sync-server
_name="anki"
pkgver="25.09.4"
pkgrel=1
pkgdesc='Sync server for anki (official version)'
url="https://github.com/ankitects/anki"
depends=(
  'glibc'
  'libgcc'
  'sqlite'
  'zstd'
)
makedepends=(
  'bash'
  'cargo'
  'clang'
  'curl'
  'findutils'
  'gcc'
  'git'
  'grep'
  'llvm'
  'make'
  'ninja'
  'nodejs'
  'openssl'
  'protobuf'
  'python-installer'
  'python-wheel'
  'rsync'
  'uv'
  'yarn'
)
arch=('x86_64')
license=('AGPL-3.0-or-later')
backup=("etc/default/${pkgname}")
source=(
    "git+https://github.com/ankitects/anki.git#tag=$pkgver"
    "git+https://github.com/ankitects/anki-desktop-ftl.git"
    "git+https://github.com/ankitects/anki-core-i18n.git"
    "anki-sync-server.env"
    "anki-sync-server.service"
    "anki-sync-server.tmpfiles"
    "sysusers-anki-sync-server.conf"
    "no-update.patch"
    "strip-formatter-deps.patch"
    "strip-type-checking-deps.patch"
    "strip-python-pip-system-certs.patch"
    "no-corepack.patch"
    "reproducible-sveltekit.patch"
)

b2sums=('60f857bb212d15f3b8b24d848f69b9a7cbdf27b1b3b216b9a5d8515e8387f48e447bd3244a70fec73b8b64ca0c79458907e4939d149abc05b3c71fd4b8e8d060'
        'SKIP'
        'SKIP'
        'cff074619cd64cbccc74ed1c523213a3c591d14cd8d61b208576cfeee768e8b9b027bbb3d427751e6a25b234e7cd0552cf3eae256159e8cd8acec4152ac6689b'
        'c8e5d45169cee186b81f27fcaa7d1a9f39a1e75a2feaff3d57a793a8c4d94838640decd344e88c97aa56cd67e33340ca057fa5d0f7b6a180f9896a97177b1644'
        '0923ed3d7adafea49c45145bc6439f46c0805d09de029765d518cb6ca7736f378307346542e1c668699534388ada03979eed5c5764225329a188c2e4052ab587'
        '782ede696092ecfbe4ec9af82401682d3da2d64d84b3ecbabdcbceb67eb0690baf00e4827e66e379064578c1fe2589f8a7370f4637db11e0fd428bf6e3a94fda'
        '0f3ce855e9eaea67ef461668c296ae08cad0d31a7a2bf9ea7006220b44c2cb2e132dfb656140828141fbf21dde2b686a4a3248b92bb3fa46217f1a987425ffa3'
        '18a8fefd5995ba83ebdb3e0c7d9a5c821a19b51616f6eebd7980e30bab4ab3c12573f5a8e59d7db03492a9df22245275da74a4594c2b652d772fbbb17984ff96'
        '4ea648cec8b784b7586605ddc97633b9471ab8e1f75b5f38c0459f839625cdc3e28419cf34f8d8e453283707a17a090a48287140573c96599d83baa56d114a4a'
        '903e22a623f058215d50cb2574ac0beeea784c7b7d07aaa207ebcfcd5a0795be70341845bc4fd20bf296e6c389e98d481a6e0a0b3ad550e88adf5aeb0d401fc6'
        'e1a05314e4d4118cd1f23de1da6c6561db6cc322a0fd1507f4fd72bdf16352cbab4e7150da5788a52a988e923d339555e4923079459c4fa55dff9c695c4117bb'
        '1dede904fbc5c0b499251d3d11a39ad2f467d644ad742d6d162dc4cd60a120f445e0b5f0fb9758ace1d95372ad48a86bbd6cad3200d97f19f4c62bb0620dc8c4')

prepare() {
  cd "${srcdir}/${_name}"
  patch -Np1 < ../no-update.patch
  patch -Np1 < ../strip-formatter-deps.patch
  patch -Np1 < ../strip-type-checking-deps.patch
  patch -Np1 < ../strip-python-pip-system-certs.patch
  patch -Np1 < ../no-corepack.patch
  patch -Np1 < ../reproducible-sveltekit.patch

  git submodule init
  git config submodule.ftl/core-repo.url ../anki-core-i18n
  git config submodule.ftl/qt-repo.url ../anki-desktop-ftl
  git -c protocol.file.allow=always submodule update ftl/core-repo ftl/qt-repo

  cargo fetch --locked --target "$(rustc --print host-tuple)"

  rm yarn.lock # Lock-file not compatible with system yarn

  # Build requires these
  yarn install --immutable --modules-folder out/node_modules --ignore-scripts
  ln -s out/node_modules ./
  python -m venv --system-site-packages --without-pip out/pyenv/
}

build() {
  cd "${srcdir}/${_name}"
  # Necessary for LTO + Rust crate "ring", see
  # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
  # https://github.com/briansmith/ring/issues/1444
  export CFLAGS+=' -ffat-lto-objects'

  # Use local binaries instead of downloading them
  export PYTHON_BINARY=/usr/bin/python
  export PROTOC_BINARY=/usr/bin/protoc
  export NODE_BINARY=/usr/bin/node
  export YARN_BINARY=/usr/bin/yarn
  export UV_BINARY=/usr/bin/uv

  export RELEASE=2       # Optimized build
  export OFFLINE_BUILD=1 # Do not download anything, disables git checks

  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo build --package runner --release --package "$pkgname"
}

package() {
  cd "${srcdir}/${_name}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
  mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
  install -Dm644 "${srcdir}/sysusers-${pkgname}.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  mkdir -p "${pkgdir}/usr/lib/tmpfiles.d/"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  mkdir -p "${pkgdir}/etc/default/"
  install -Dm600 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
}
