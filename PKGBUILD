# Maintainer: William Luc Ritchie <luc dot ritchie at gmail dot com>
# Contributor: Borja Ruiz <borja [at] libcrack [dot] so>

_pkgname=apkstudio
pkgname=$_pkgname-git
pkgver=r100.9e114ca
pkgrel=1
epoch=1
pkgdesc='An IDE for decompiling/editing & then recompiling of android application binaries.'
arch=('i686' 'x86_64')
url='http://www.vaibhavpandey.com/apkstudio/'
license=('GPL2')
depends=('qt5-base' 'android-tools' 'android-apktool')
makedepends=('git' 'qt5-tools' 'unzip')
source=('git+https://github.com/vaibhavpandeyvpz/apkstudio.git'
        'APKTOOL_VERSION'
        'apkstudio-setup.sh'
        'change-vendor-zip-warning.patch')
sha256sums=('SKIP'
            'ff6ea79b60edfc59c6556ba1f349aae9da3cbb99d5d35239521ebb8f3a201a8c'
            'f750ecf7d4ddf14922aa52e98ec37f6277692bd88f934f4a3a41b0e888017a1d'
            'addf387dfb760341e694c9fe50900b7e39acd71f4ff7e3b793ae9347c2b9c0ab')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p0 -i ../change-vendor-zip-warning.patch
}

build() {
  cd "$srcdir/$_pkgname"
  lrelease-qt5 res/lang/en.ts
  qmake-qt5 -r apkstudio.pro CONFIG+=release
  make
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm744 'APKTOOL_VERSION' "$pkgdir/usr/share/$pkgname/APKTOOL_VERSION"
  install -Dm755 'apkstudio-setup.sh' "$pkgdir/usr/bin/apkstudio-setup.sh"
}
