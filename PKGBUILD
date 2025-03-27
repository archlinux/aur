# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=liketaskmanager-git
pkgver=2.4.r0.g1d31b4e
pkgrel=1
pkgdesc="Tool that mimics the permformance monitoring of Windows Task Manager"
arch=('x86_64')
url="https://github.com/rejuce/LikeTaskManager"
license=('GPL-3.0-or-later')
depends=(
  'nethogs'
  'qt5-base'
  'qwt'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/rejuce/LikeTaskManager.git"
        "${pkgname%-git}.desktop"
        'includepath.patch')
sha256sums=('SKIP'
            'c1655277c90a158ceed2fe461297ccd148f7746c4f19320de4c375a4e49ada0b'
            'ddf181e60d9f79079d824b0d1ed92b95d70f708223aa05e3f5e641fe0c06ab91')

pkgver() {
  cd LikeTaskManager
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd LikeTaskManager

  # Remove precompiled binary
  rm -fv LikeTaskManager

  # Correct INCLUDEPATH
  patch -Np1 -i ../includepath.patch
}

build() {
  cd LikeTaskManager
  qmake-qt5
  make
}

package() {
  cd LikeTaskManager
  install -Dm755 LikeTaskManager -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
