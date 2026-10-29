# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
_app_id="com.bktus.$pkgname"
pkgver=2.2.4
pkgrel=1
pkgdesc="A modern OpenPGP tool with a unique dual-engine core"
arch=('x86_64')
url="https://gpgfrontend.bktus.com"
license=('GPL-3.0-or-later')
depends=(
  'gpgme'
  'gtest'
  'hicolor-icon-theme'
  'icu'
  'libarchive'
  'libgcc'
  'libgpg-error'
  'libsecret'
  'libsodium'
  'libstdc++'
  'openssl'
  'qt6-base'
)
makedepends=(
  'cargo'
  'cmake'
  'desktop-file-utils'
  'git'
  'ninja'
  'python'
  'qt6-tools'
)
checkdepends=('appstream')
source=("git+https://github.com/saturneric/GpgFrontend#tag=v$pkgver"
        'git+https://github.com/qt/qttranslations.git'
        'git+https://github.com/saturneric/GpgFrontend-Modules.git'
        'git+https://github.com/gpg/gpgme.git'
        'git+https://github.com/gpg/libassuan.git'
        'git+https://github.com/gpg/libgpg-error.git'
        'git+https://github.com/corrosion-rs/corrosion.git'
        'git+https://github.com/lua/lua.git'
        'git+https://git.bktus.com/gpgfrontend/vmime.git')
sha256sums=('eb30b8a7e497d717daeca9550f2accc257496f2824b139415a8cec22fe97f16c'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd GpgFrontend
  git submodule init
  git config submodule.third_party/qttranslations.url "$srcdir/qttranslations"
  git config submodule.modules.url "$srcdir/GpgFrontend-Modules"
  git config submodule.third_party/gpgme.url "$srcdir/gpgme"
  git config submodule.third_party/libassuan.url "$srcdir/libassuan"
  git config submodule.third_party/libgpg-error.url "$srcdir/libgpg-error"
  git config submodule.third_party/corrosion.url "$srcdir/corrosion"
  git config submodule.third_party/lua.url "$srcdir/lua"
  git -c protocol.file.allow=always submodule update

  pushd modules
  git submodule init
  git config submodule.src/m_email/vmime.url "$srcdir/vmime"
  git -c protocol.file.allow=always submodule update
  popd

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path rust/Cargo.toml --target host-tuple

  # Correct StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="$pkgname" \
    "resource/appstream/${_app_id}.desktop"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  local cmake_options=(
    -B build
    -S GpgFrontend
    -G Ninja
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D GPGFRONTEND_BUILD_MODE='release'
    -D GPGFRONTEND_BUILD_STABLE='ON'
    -D GPGFRONTEND_BUILD_APP_FOR_PACKAGE='ON'
    -D GPGFRONTEND_BUILD_STRIP_RPATH='ON'
    -D GPGFRONTEND_LINK_GPGME_INTO_CORE='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd GpgFrontend
  appstreamcli validate --no-net "resource/appstream/${_app_id}.metainfo.xml"
  desktop-file-validate "resource/appstream/${_app_id}.desktop"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Remove duplicate license
  rm -vf "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
