# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

_check_arch () {
case $CARCH in
    i386) LINUX_ARCH=32
    ;;
    x86_64) LINUX_ARCH=64
    ;;
    *) LINUX_ARCH=Unknown
    ;;
esac
}
_check_arch
unset _check_arch

_git_reponame='im-desktop'

pkgname='icqdesktop-git'
pkgver=r18.271e42d
pkgrel=2
arch=('i686' 'x86_64')
depends=('fontconfig' 'libxdamage' 'libxcomposite' 'freetype2' 'libxext')
makedepends=('cmake' 'glfw-x11')
#optdepends=('')
pkgdesc='Official ICQ desktop client for Linux'
url='https://icq.com/'
license=('Apache')
source=("${pkgname}::git+https://github.com/mail-ru-im/${_git_reponame}.git"
        'icq.desktop')
md5sums=('SKIP'
         '7c16e645547ab40bd577b81c9705d5c1')
conflicts=('icqdesktop' 'icqdesktop-bin')
provides=('icqdesktop-git')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  printf "WARNING! Compiling require not less 6Gb available memory"
}

build() {
  cmake ${pkgname} -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLINUX_ARCH=$LINUX_ARCH
  make
}

package() {
  install -Dm755 "${pkgname}/bin/Release${LINUX_ARCH}/icq" "${pkgdir}/usr/bin/icq"
  install -Dm644 "${pkgname}/products/icq/app/resources/main_window/logo.svg" "${pkgdir}/usr/share/pixmaps/icq.svg"
  install -Dm644 icq.desktop "${pkgdir}/usr/share/applications/icq.desktop"
}

# vim:set ft=sh ts=2 sw=2 et:
