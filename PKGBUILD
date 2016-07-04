# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Based on dosemu-git:
# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the Arch Linux PKGBUILD by:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Bob Finch <w9ya@arrl.net>

pkgname='dosemu2-git'
pkgver=2.0pre4+888+g9ef584e
pkgrel=1
epoch=0
pkgdesc='Virtual machine that allows you to run DOS programs under Linux'
arch=('i686' 'x86_64')
url='https://stsp.github.io/dosemu2/'
license=('GPL' 'custom')
optdepends=(
  'vde2: networking support'
  'sdl2: graphical display'
  'slang: console display'
  'gpm: mouse support in console'
  'libao: audio output'
  'fluidsynth: MIDI support'
)
makedepends=('git')
provides=('dosemu=2.0')
conflicts=('dosemu')
backup=(
  'etc/dosemu/dosemu.conf'
# 'etc/dosemu/dosemu.users'
# 'etc/dosemu/global.conf'
)
_freedos='dosemu-freedos-1.1-bin.tgz'
source=(
  'git+https://github.com/stsp/dosemu2.git'
  "https://dl.dropboxusercontent.com/u/13513277/dosemu/${_freedos}"
  'build-system.patch'
  'xdosemu.desktop'
  'compiletime-settings'
)
noextract=("${_freedos}")
sha256sums=('SKIP'
            '0891a8346ee58f8468ab17f93315d6f23fe68348d297be39c1faad5bd6e59613'
            'c4364f3837744775faebeac86ad22e5b636db411942c6e21e74e9b3277e066cf'
            'ed210a850a1102fbf56bfd8a34b5dddca538caa2eee39210ee612406891c3e5a'
            '7f64ff44f13779fe3e283f23b9eb8765433b87f1222cc147bf524a8e844f736f')

pkgver() {
  cd 'dosemu2'
  git describe --long | sed -e 's/^dosemu2-//; y/-/+/'
}

prepare() {
  cd 'dosemu2'

  #patch -Np1 < ../build-system.patch
  #sed -ie '/yyget_leng/ s/int/size_t/' src/base/init/lexer.h
  ln -s "../${_freedos}" 'dosemu-freedos-1.1-bin.tgz' # 'dosemu-freedos-bin.tgz'
  ln -sf '../compiletime-settings' 'compiletime-settings'
  ./autogen.sh
  CFLAGS="${CFLAGS} -Wno-unused-result" \
  ./default-configure
}

build() {
  cd 'dosemu2'
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  make -s -j "${_nproc}"
}

package() {
  cd 'dosemu2'
  make DESTDIR="${pkgdir}" install
  install -Dpm644 "${srcdir}/xdosemu.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 'etc/dosemu.xpm' -t "${pkgdir}/usr/share/icons/"
  install -Dpm644 'COPYING' 'COPYING.DOSEMU' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
