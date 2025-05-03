# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.1.8+46+gbe4cb8e
pkgrel=1
pkgdesc="An exceptional GUI frontend for the modern GnuPG (gpg)"
arch=('x86_64')
url="https://gpgfrontend.bktus.com"
license=('GPL-3.0-or-later')
depends=(
  'gpgme'
  'gtest'
  'hicolor-icon-theme'
  'libarchive'
  'openssl'
  'qt6-base'
)
makedepends=(
  'cmake'
  'desktop-file-utils'
  'git'
  'qt6-tools'
  'vulkan-headers'
)
_commit=be4cb8e0f9ab4cd1e41979de8809b04211c116f3
source=("git+https://github.com/saturneric/GpgFrontend#commit=${_commit}"
        'git+https://github.com/bricke/Qt-AES.git'
        'git+https://github.com/qt/qttranslations.git'
        'git+https://git.bktus.com/GpgFrontend/Modules.git'
        'git+https://git.bktus.com/GpgFrontend/vmime.git')
sha256sums=('b0f9fe08e7bd86277676d9d3010bfcc6f54500ce0acd8f3ff8a22aeefb0da86a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd GpgFrontend
  git describe --tags --exclude nightly --abbrev=7 | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd GpgFrontend
  git submodule init
  git config submodule.third_party/qt-aes.url "$srcdir/Qt-AES"
  git config submodule.third_party/qttranslations.url "$srcdir/qttranslations"
  git config submodule.modules.url "$srcdir/Modules"
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
