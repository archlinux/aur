# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.1.10
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
  'qt6-tools'
)
source=("git+https://github.com/saturneric/GpgFrontend#tag=v$pkgver"
        'git+https://github.com/qt/qttranslations.git'
        'git+https://git.bktus.com/GpgFrontend/Modules.git'
        'git+https://git.bktus.com/GpgFrontend/gpgme.git'
        'git+https://git.bktus.com/GpgFrontend/libassuan.git'
        'git+https://git.bktus.com/GpgFrontend/libgpg-error.git'
        'git+https://github.com/openssl/openssl.git'
        'git+https://git.bktus.com/GpgFrontend/vmime.git')
sha256sums=('5f7a8020d8aff09d4d0f9f809d52032bb2cdfdcd7606e90ba4fd40a42de20ca2'
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
    resource/appstream/com.bktus.gpgfrontend.desktop
}

build() {
  cmake -B build -S GpgFrontend \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Remove duplicate license
  rm -r "$pkgdir/usr/share/licenses/"
}
