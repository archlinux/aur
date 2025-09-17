# Maintainer: <tera_1225 @ hotmail ðot com>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=anki-sync-server
_name="anki"
pkgver="25.09.2"
pkgrel=1
pkgdesc='Sync server for anki (official version)'
url="https://github.com/ankitects/anki"
depends=(
  'gcc-libs'
  'glibc>=2.36'
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
  'python>=3.9'
  'python-mypy-protobuf' # AUR
  'rsync'
  'yarn'
)
options=('!lto')
arch=('x86_64')
license=('AGPL-3.0-or-later')
backup=("etc/default/${pkgname}")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.zip"
    "git+https://github.com/ankitects/PyOxidizer.git"
    "git+https://github.com/ankitects/anki-desktop-ftl.git"
    "git+https://github.com/ankitects/anki-core-i18n.git"
    "anki-sync-server.env"
    "anki-sync-server.service"
    "anki-sync-server.tmpfiles"
    "sysusers-anki-sync-server.conf"
)

sha512sums=('0413ce0292b370e3e861a9706f15911eef5ed77bdc8397f46e53afbdaddc0f1a7d499361336e484f4abbdbcd4ef467a0c267571e4ac1d188ff19a632816dd5ce'
            'SKIP'
            'SKIP'
            'SKIP'
            'ccd4e5d316f73a554e33c457ea77f0a99eb70a89d0f140f2383be6b5e9545d4c4e88c319bfea5aa2f6e9c49c9d296f2ab89cfb954a7763514b86dce918d88dab'
            'bf7aefbd5afbdcb304c39a6dfaa782f70d72b5f366e5eb69f840d46ca24dc9e00a52ac874b3c0b361c3ae1cf594b5f313d8f8424f5b4180c86fe820067e49538'
            '4844cb3f687ac3a96bed1779afcddc7c77ab67884fb2104e97e8cc58e20d2c59aa9260607b9d875976d0254c502977e746524526dfc490c91ff05f77711b18db'
            'c1ce782304350d655b782c127ae480f3cce9c6210de9137b4038b09dd530347fc20d78d09552648614d003047a43197e7bc6a346662b6db9e9da7be3121ffe51')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  echo "Fetching rust sources"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  echo "Linking to other submoduled git repos for i18n and pyoxidizer"
  mkdir -p "qt/bundle"
  ln -s "${srcdir}/PyOxidizer" "qt/bundle/PyOxidizer"
  cd ftl
  rmdir "qt-repo"
  rmdir "core-repo"
  ln -s "${srcdir}/anki-desktop-ftl" "qt-repo"
  ln -s "${srcdir}/anki-core-i18n" "core-repo"
  echo "Setting up python pseudo venv"
  cd "${srcdir}/${_name}-${pkgver}"
  mkdir -p "out/pyenv/bin"
  ln -s "/usr/bin/python" "out/pyenv/bin/python"
  ln -s "/usr/bin/protoc-gen-mypy" "out/pyenv/bin/protoc-gen-mypy"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  export CARGO_TARGET_DIR="target/release"
  export PROTOC="/usr/bin/protoc"
  export PROTOC_BINARY="$PROTOC"
  export PYTHON_BINARY="/usr/bin/python"
  export NODE_BINARY="/usr/bin/node"
  export YARN_BINARY="/usr/bin/yarn"
  export RUST_BACKTRACE=full
  export OFFLINE_BUILD=1
  export CFLAGS+=' -ffat-lto-objects'
  export LTOFLAGS='-flto=auto -ffat-lto-objects'
  cargo build --package runner --release --package "$pkgname"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 "target/release/release/${pkgname}" "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
  mkdir -p "${pkgdir}/usr/lib/sysusers.d/"
  install -Dm644 "${srcdir}/sysusers-${pkgname}.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  mkdir -p "${pkgdir}/usr/lib/tmpfiles.d/"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  mkdir -p "${pkgdir}/etc/default/"
  install -Dm600 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
}
