# Maintainer: Viachaslau Khalikin <khalikin'at'yandex'dot'by>

# from https://github.com/mail-ru-im/im-desktop/blob/master/external/readme.txt
_external_url='https://icq.com/files/ohmpeoVRtQk3j3i1DoAF625d82046f1bg'

_parseurl () {
    local external_url=$(curl -s ${_external_url} | grep -m1 -Po '"https://[^"]+(external)\.(7z)"')
    test -n $external_url && _external_url=$external_url
}
_parseurl
unset _parseurl

_useragent="Mozilla/5.0 (X11; Linux ${CARCH}; rv:68.0) Gecko/20100101 Firefox/68.0"
_useragent="$(printf '%s' "$_useragent" | sed 's/[[:space:]]\+/ /g')"
_useragent_escaped="${_useragent// /\\ }"

DLAGENTS=("https::/usr/bin/wget -U ${_useragent_escaped} -r -np -nd -H %u")

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
pkgver=r5.8422caa
pkgrel=2
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
         '9a71b93b56fe50b6d3541552af7dd55c'
         '7c16e645547ab40bd577b81c9705d5c1')
conflicts=('icqdesktop' 'icqdesktop-bin')
provides=('icqdesktop-git')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  bsdtar -x -f external.7z -C "${pkgname}/external"
}

# ! Compiling require >6Gb free memory
build() {
  cmake ${pkgname} -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DLINUX_ARCH=$LINUX_ARCH
  make 
}

package() {
  install -Dm755 "${pkgname}/bin/Release${LINUX_ARCH}/icq" "${pkgdir}/usr/bin/icq"
  install -Dm644 "${pkgname}/gui/resources/main_window/logo_icq.svg" "${pkgdir}/usr/share/pixmaps/icq.png"
  install -Dm644 icq.desktop "${pkgdir}/usr/share/applications/icq.desktop"
}
