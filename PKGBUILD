# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
_app_id="com.bktus.$pkgname"
pkgver=2.1.11
pkgrel=1
pkgdesc="An exceptional GUI frontend for the modern GnuPG (gpg)"
arch=('x86_64')
url="https://gpgfrontend.bktus.com"
license=('GPL-3.0-or-later')
depends=(
  'gpgme'
  'gtest'
  'hicolor-icon-theme'
  'icu'
  'libarchive'
  'openssl'
  'qt6-base'
)
makedepends=(
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
        'git+https://git.bktus.com/gpgfrontend/Modules.git'
        'git+https://git.bktus.com/gpgfrontend/gpgme.git'
        'git+https://git.bktus.com/gpgfrontend/libassuan.git'
        'git+https://git.bktus.com/gpgfrontend/libgpg-error.git'
        'git+https://github.com/openssl/openssl.git'
        'git+https://git.bktus.com/gpgfrontend/vmime.git')
sha256sums=('ebb13337cd29220682c66f9a89e453f019dd1a834802f6d990b086bba19917ef'
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
  git config submodule.modules.url "$srcdir/Modules"
  git config submodule.third_party/gpgme.url "$srcdir/gpgme"
  git config submodule.third_party/libassuan.url "$srcdir/libassuan"
  git config submodule.third_party/libgpg-error.url "$srcdir/libgpg-error"
  git config submodule.third_party/openssl.url "$srcdir/openssl"
  git -c protocol.file.allow=always submodule update

  pushd modules
  git submodule init
  git config submodule.src/m_email/vmime.url "$srcdir/vmime"
  git -c protocol.file.allow=always submodule update
  popd

  # /usr/local/ > /usr/
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

  # Correct StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="$pkgname" \
    "resource/appstream/${_app_id}.desktop"
}

build() {
  local cmake_options=(
    -B build
    -S GpgFrontend
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D GPGFRONTEND_BUILD_APP_FOR_PACKAGE='ON'
    -D GPGFRONTEND_BUILD_STRIP_RPATH='ON'
    -D GPGFRONTEND_USE_SYSTEM_OPENSSL='ON'
    -D OPENSSL_INCLUDE_DIR='/usr/include/openssl'
    -D OPENSSL_SSL_LIBRARY='/usr/lib/libssl.so'
    -D OPENSSL_CRYPTO_LIBRARY='/usr/lib/libcrypto.so'
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
  rm -r "$pkgdir/usr/share/licenses/"
}
