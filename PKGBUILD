# Mantainer: Daniele Basso  <d dot bass05 at proton dot me>
# Maintainer: Kordian Bruck <k@bruck.me>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>
# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Julian Raufelder <aur@raufelder.com>
# Contributor: Dhina17 <dhinalogu@gmail.com>

pkgname=android-studio-system
pkgver=2025.1.2.11
pkgrel=1
pkgdesc="The official Android IDE (Stable branch)"
arch=('x86_64')
url="https://developer.android.com/studio"
license=('APACHE')
makedepends=()
depends=('alsa-lib' 'libxtst' 'java-environment=21' 'kotlin')
optdepends=('ncurses5-compat-libs: native debugger support')
options=('!strip') # Removing it is a bit more violent but it removes 90MB of files...
source=("https://dl.google.com/dl/android/studio/ide-zips/$pkgver/android-studio-$pkgver-linux.tar.gz"
        "android-studio.desktop"
        "license.html")
b2sums=('1b400f9459349c786f90e2f66e228729613fad98aac1b4a220a1d170a56af358ff1439a0f08da47f2862edb4cc38a1d024cd0390bf07ce42c84147c7f2b22348'
        '16940866032d710ce995cc6bb0b994875215df0f6191b09a3ece5d6c5750c4fb3d430c683f545154eeceecad10d70333d59302fe6c5efd97c3fc9e66f3009dca'
        '43b288fb81656cd72826a52620e41fbd0daa65d37246cb5b7dbff9c326022eabf18344513517b16134b557d6ae86535f44f863ebd06d6fe0410f92117c1a8c67')
provides=("android-studio")
conflicts=("android-studio")

package() {
  cd $srcdir/android-studio

  # Install the application
  install -dm 755 $pkgdir/usr/{bin,share/{licenses,pixmaps,android-studio}}
  cp -a bin lib plugins build.txt product-info.json $pkgdir/usr/share/android-studio

  # Kotlinc
  rm -rf $pkgdir/usr/share/android-studio/plugins/Kotlin/kotlinc/{bin,lib,license,build.txt}
  ln -s /usr/bin/ $pkgdir/usr/share/android-studio/plugins/Kotlin/kotlinc/bin
  ln -s /usr/share/kotlin/lib/ $pkgdir/usr/share/android-studio/plugins/Kotlin/kotlinc/lib
  ln -s /usr/share/kotlin/build.txt $pkgdir/usr/share/android-studio/plugins/Kotlin/kotlinc/build.txt

  # clangd
  rm $pkgdir/usr/share/android-studio/plugins/c-clangd/bin/clang/linux/x64/bin/clangd
  ln -s /usr/bin/clangd $pkgdir/usr/share/android-studio/plugins/c-clangd/bin/clang/linux/x64/bin/clangd

  ln -s /usr/share/android-studio/bin/studio $pkgdir/usr/bin/android-studio
  ln -s /usr/lib/jvm/java-21-openjdk/ $pkgdir/usr/share/android-studio/jbr

  # Copy licenses
  ln -s /usr/share/licenses/kotlin/ $pkgdir/usr/share/android-studio/plugins/Kotlin/kotlinc/license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 $srcdir/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
  cp -a license/* $pkgdir/usr/share/licenses/${pkgname}

  # Add the icon and desktop file
  install -Dm644 bin/studio.png $pkgdir/usr/share/pixmaps/android-studio.png
  install -Dm644 $srcdir/android-studio.desktop $pkgdir/usr/share/applications/android-studio.desktop
}
