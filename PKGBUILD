# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.1.6
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
  'boost'
  'cmake'
  'desktop-file-utils'
  'git'
  'qt6-tools'
)
source=("git+https://github.com/saturneric/GpgFrontend#tag=v$pkgver"
        'git+https://github.com/bricke/Qt-AES.git'
        'git+https://github.com/qt/qttranslations.git'
        'git+https://github.com/saturneric/GpgFrontend-Modules.git')
sha256sums=('3811c557f9a1f3c386e5e5505745a40064e82f69cf989cd8d2fa722797bdd1e6'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd GpgFrontend
  git submodule init
  git config submodule.third_party/qt-aes.url "$srcdir/Qt-AES"
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
