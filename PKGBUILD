# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=liketaskmanager-git
pkgver=2.4.r4.gf491ab2
pkgrel=1
pkgdesc="Tool that mimics the permformance monitoring of Windows Task Manager"
arch=('x86_64')
url="https://github.com/rejuce/LikeTaskManager"
license=('GPL-3.0-or-later')
depends=(
  'nethogs'
  'qt6-base'
  'qwt-qt6'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/rejuce/LikeTaskManager.git"
        "${pkgname%-git}.desktop"
        'includepath.patch')
sha256sums=('SKIP'
            'c1655277c90a158ceed2fe461297ccd148f7746c4f19320de4c375a4e49ada0b'
            '60d39abcb40047801cabcbde144964fb0d28a0b1635b6cd41409af159656367f')

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
  qmake6
  make
}

package() {
  cd LikeTaskManager
  install -Dm755 LikeTaskManager -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
