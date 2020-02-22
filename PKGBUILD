# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

# from https://github.com/mail-ru-im/im-desktop/blob/master/external/readme.txt
_external_url='https://hb.bizmrg.com/icq-www/external/external.7z'

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
pkgver=r8.07c0995
pkgrel=1
arch=('i686' 'x86_64')
#depends=('')
makedepends=('git' 'cmake' 'glfw-x11')
#optdepends=('')
pkgdesc='Official ICQ desktop client for Linux'
url='https://icq.com/'
license=('Apache' 'custom')
source=("${pkgname}::git+https://github.com/mail-ru-im/${_git_reponame}.git"
        "external.7z::${_external_url}"
        'icq.desktop')
noextract=('external.7z')
md5sums=('SKIP'
         '7c7e365df1432cc43ec5c3835da7783e'
         '7c16e645547ab40bd577b81c9705d5c1')
conflicts=('icqdesktop' 'icqdesktop-bin')
provides=('icqdesktop-git')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  bsdtar -x -f external.7z -C "${pkgname}"
}

# ! Compiling require >6Gb free memory
build() {
  cmake ${pkgname} -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLINUX_ARCH=$LINUX_ARCH
  # FIXME: can't open file 'buildsystem/prepare_zstd_dict.py': [Errno 2] No such file or directory
  make --ignore-errors
}

package() {
  install -Dm755 "${pkgname}/bin/Release${LINUX_ARCH}/icq" "${pkgdir}/usr/bin/icq"
  install -Dm644 "${pkgname}/gui/resources/main_window/logo_icq.svg" "${pkgdir}/usr/share/pixmaps/icq.png"
  install -Dm644 icq.desktop "${pkgdir}/usr/share/applications/icq.desktop"
}

# vim:set ft=sh ts=2 sw=2 et:
