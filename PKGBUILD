# Maintainer: Carl Kittelberger <icedream@icedream.pw>
# Derived from https://github.com/archlinux/svntogit-packages/blob/09541443aa24fe2ee143cfee51c3a03642633578/trunk/PKGBUILD

origpkgname=xdg-desktop-portal-kde
origpkgversion=5.23.5

pkgname="${origpkgname}-steamos-kiofusefix"
pkgver="${origpkgversion}"
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KF5 (Version as used on SteamOS but fixed to work with remote files).'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kirigami2 plasma-framework)
makedepends=(extra-cmake-modules plasma-wayland-protocols)
conflicts=("$origpkgname")
provides=("$origpkgname" xdg-desktop-portal-impl)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/${origpkgname}-$pkgver.tar.xz{,.sig}
        # https://invent.kde.org/plasma/xdg-desktop-portal-kde/-/commit/551c583bd883056d28895597ce8d4571cd6a6f81
        0001-Use-QFileDialog-for-selecting-directories.patch
        # https://invent.kde.org/plasma/xdg-desktop-portal-kde/-/commit/caaa100b89924d0fdcd3e8352e43f6137d06174b
        0002-Show-only-local-files.patch
        # https://invent.kde.org/plasma/xdg-desktop-portal-kde/-/commit/bbfa7471d26c84157e6a022b83e202a8de04fee7
        0003-fuse-fileopen-urls-on-demand.patch)
sha256sums=('eb61f3bb1d62e50f01a81b632476bfa689607a066af7dabdddb8dbdce4754327'
            'SKIP'
            'de6abeb05c6620c61c0b6cdd01daf3a37a8ebcb9452bff5522eb4843dbcc2f20'
            '09c33c2f14f0592bd6582390f1240aac4d0dabb41d76f9f4ed4943556d45352a'
            '97b14f9d7cb19839d4b612c6977f42e44b0ec3f2b07f5fccefaf0aa8fa92d79d')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd "$origpkgname-$pkgver"

  for patch in "$srcdir"/0*.patch
  do
    patch -p1 -i "$patch"
  done
}

build() {
  cmake -B build -S $origpkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
