# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.1.4
pkgrel=2
pkgdesc="An exceptional GUI frontend for the modern GnuPG (gpg)"
arch=('x86_64')
url="https://gpgfrontend.bktus.com"
license=('GPL-3.0-or-later')
depends=(
  'gpgme'
  'gtest'
  'hicolor-icon-theme'
  'libarchive'
  'mimalloc'
  'openssl'
  'qt6-base'
)
makedepends=(
  'boost'
  'cmake'
  'desktop-file-utils'
  'git'
  'qt6-tools'
)
source=("git+https://github.com/saturneric/GpgFrontend#tag=v$pkgver"
        'git+https://github.com/bricke/Qt-AES.git'
        'git+https://github.com/microsoft/mimalloc.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/libarchive/libarchive.git'
        'git+https://github.com/qt/qttranslations.git'
        'git+https://github.com/saturneric/GpgFrontend-Modules.git')
sha256sums=('1f76aeaa6b7796241100ba6d8dc2e273a78d7e2cdd02da3dee777d763f284ef3'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd GpgFrontend
  git submodule init
  git config submodule.third_party/qt-aes.url "$srcdir/Qt-AES"
  git config submodule.third_party/mimalloc.url "$srcdir/mimalloc"
  git config submodule.third_party/googletest.url "$srcdir/googletest"
  git config submodule.third_party/libarchive.url "$srcdir/libarchive"
  git config submodule.third_party/qttranslations.url "$srcdir/qttranslations"
  git config submodule.modules.url "$srcdir/GpgFrontend-Modules"
  git -c protocol.file.allow=always submodule update

  # /usr/local/ > /usr/
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value=GpgFrontend \
    resource/appstream/com.bktus.gpgfrontend.desktop
}

build() {
  cmake -B build -S GpgFrontend \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGPGFRONTEND_GENERATE_LINUX_INSTALL_SOFTWARE='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
