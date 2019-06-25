# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=lsnes-git
pkgver=2.beta24.r3.88160be5
pkgrel=1
pkgdesc="SNES and Game Boy emulator with re-recording (TAS) support"
arch=('x86_64')
url="http://tasvideos.org/Lsnes.html"
license=('GPL3')
depends=('boost-libs' 'curl' 'ffmpeg' 'lua' 'portaudio' 'wxgtk2')
makedepends=('boost' 'git')
source=("git+https://repo.or.cz/lsnes.git"
        "lsnes.desktop")
sha512sums=('SKIP'
            'e11ce8bdd4c1a200a5320625c3f496a9cc81094b95d97246b95fd063562df4f2f15a914f05e53e239c0bf9f57495129cfad5286119918f3681d27263fd342c76')

pkgver() {
  cd "${pkgname%-git}"

  printf "%s" "$(git describe --tags --long | sed 's/^lsnes-//;s/^rr//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname%-git}"

  git submodule init
  git submodule update
}

build() {
  cd "${pkgname%-git}"

  make JOYSTICK=EVDEV
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 lsnes "$pkgdir/usr/bin/lsnes"
  install -Dm644 manual.txt "$pkgdir/usr/share/doc/lsnes/manual.txt"
  install -m644 lua.pdf "$pkgdir/usr/share/doc/lsnes/lua.pdf"
  install -Dm644 ../lsnes.desktop "$pkgdir/usr/share/applications/lsnes.desktop"
}
