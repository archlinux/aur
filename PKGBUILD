# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-notes
pkgver=24.08.3
pkgrel=3
pkgdesc='Libraries and daemons to implement management of notes in Akonadi'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         ki18n
         kmime
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-doc
             qt6-tools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        akonadi-notes-24.08.3-kmime-26.04-api.patch)
sha256sums=('78777b8468974e66031a49c163fe908405b67e0f0bace0307f91f0f4246fefde'
            'SKIP'
            'be01f3e8d7b3c00c6cd2abfec38e5fa02e354bbc71f5f15805104a76ac00258e')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  cd $pkgname-$pkgver
  # upstream (pim/akonadi-notes) is archived/unmaintained and was never
  # ported to KMime's CreatePolicy/unique_ptr API changes (KMime::Create
  # since 26.04, decodedContent()->decodedBody() since 25.12) -- port it
  # ourselves. See memory/akonadi-notes.md for the full investigation.
  patch -Np1 -i "$srcdir"/akonadi-notes-24.08.3-kmime-26.04-api.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
