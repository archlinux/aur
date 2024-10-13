# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=6.2.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma applet and services for creating encrypted vaults'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kitemmodels
         kservice
         kwidgetsaddons
         libksysguard
         networkmanager-qt
         libplasma
         plasma-workspace
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
optdepends=('cryfs: to use cryFS for encryption'
            'encfs: to use encFS for encryption'
            'gocryptfs: to use gocryptfs for encryption')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('2c10bffd46d5fddc78d3d934ab6390d502b10325f5f6fc2292ccc4768ef4d8ad'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

# For simplify rebase on `extra/plasma-vault` package
_pkgname=$pkgname
pkgname=$pkgname-open-with-pass
pkgrel=$pkgrel.2
provides=(plasma-vault)
conflicts=(plasma-vault plasma-vault-git)
pkgdesc="$pkgdesc (With \`openVaultWithPass\` DBus interface)"
source=($source plasma-vault--openVaultWithPass\`s\(ss\)\`.patch)
sha256sums=($sha256sums
            'a7614a1eedfb903151f0274d456c2f81b20ecf730a3cabbcf3d41342df63b9f5')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i "$srcdir/plasma-vault--openVaultWithPass\`s(ss)\`.patch"
  cd -
}

build() {
  cmake -B build  -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
