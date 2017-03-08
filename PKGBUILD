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
# 1 = debug build.
# 2 = debug build with slow compile to make compile errors easy to see
# Debug builds must be launched from the command line to allow
# sudo to change a system setting.

_pkgname='dosemu2'
pkgname="${_pkgname}-git"
pkgver=2.0pre6.1.dev.357.g10ac6c7f
pkgrel=1
pkgdesc='Virtual machine that allows you to run DOS programs under Linux'
arch=('i686' 'x86_64')
url='https://stsp.github.io/dosemu2/'
license=('GPL' 'custom')
depends=('glibc' 'alsa-lib')
if [ "${_opt_Debug}" -ne 0 ]; then
  depends+=('gdb' 'binutils' 'sudo')
fi
optdepends=(
  'libao: audio output'
  'gpm: mouse support in console'
  'slang: console display'
  'sdl2: graphical display'
  'fluidsynth: MIDI support'
  'vde2-dosemu2: networking support'
)
makedepends=('git' 'flex' 'bison' 'binutils' 'sed' 'perl' 'bash')
provides=('dosemu=2.0' "${_pkgname}=2.0")
conflicts=('dosemu' "${_pkgname}")
backup=(
  'etc/dosemu/dosemu.conf'
# 'etc/dosemu/dosemu.users'
# 'etc/dosemu/global.conf'
)
_github='stsp/dosemu2'
_verwatch=("https://github.com/${_github}/releases.atom" "\s\+<title>${_pkgname}-\([^<]\+\)</title>" 'f')
_freedos='dosemu-freedos-1.1-bin.tgz' # 'dosemu-freedos-bin.tgz'
source=(
  "git+https://github.com/${_github}.git"
  #"https://dl.dropboxusercontent.com/u/13513277/dosemu/${_freedos}"
  "https://chungy.keybase.pub/dosemu/${_freedos}"
  'build-system.patch'
  'http://downloads.sourceforge.net/sourceforge/dosemu/dosemu-freedos-1.0-bin.tgz' # for the GNU utils
)
noextract=("${_freedos}")
sha256sums=('SKIP'
            '0891a8346ee58f8468ab17f93315d6f23fe68348d297be39c1faad5bd6e59613'
            'c4364f3837744775faebeac86ad22e5b636db411942c6e21e74e9b3277e066cf'
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

  # Some makepkg options including -i erroneously run prepare() for vcs packages
  if [ -f 'debian/rules' ]; then
    #patch -Np1 < ../build-system.patch
    #sed -ie '/yyget_leng/ s/int/size_t/' src/base/init/lexer.h
    ln -sf "../${_freedos}"
    sed -i -e '# Enable VDE' \
           -e 's:^\(\s*plugin_vde\)\s.*$:\1 on:g' \
           -e '# Adjust conf folder in /etc' \
           -e 's:^\(\s*sysconfdir\)\s.*$:\1 /etc/dosemu:g' \
           -e '# Update freedos' \
           -e 's:^\(\s*fdtarball\)\s.*$:'"\1 ${_freedos}:g" \
           -e '# Prefix' \
           -e 's:^}$:  prefix /usr\n&:g' \
      'compiletime-settings'{,.devel}
    ./autogen.sh
    local _opts=()
    if [ "${_opt_Debug}" -ne 0 ]; then
      #sed -i -e '# Temp fix for debug xbacktrace' \
      #       -e 's:^#include <string\.h>:#include "config.h"\n&:g' \
      #  'src/arch/linux/async/backtrace-symbols.c'
      _opts+=('-d')
      #_opts+=('-d' '--disable-xbacktrace')
    fi
    CFLAGS="${CFLAGS} -Wno-unused-result" \
    ./default-configure ${_opts[@]:-}
    rm -f 'debian/rules'
  fi
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
  if [ "${_opt_Debug}" -eq 0 ]; then # sudo in the launcher crashes cinnamon
    install -Dm644 <(cat << EOF
[Desktop Entry]
Name=DOSEMU
Exec=dosemu
Icon=dosemu
Terminal=false
Type=Application
Categories=Emulator;System;
GenericName=DOS Emulator
EOF
    ) "${pkgdir}/usr/share/applications/xdosemu.desktop"
  fi
  install -Dpm644 'etc/dosemu.xpm' -t "${pkgdir}/usr/share/icons/"
  install -Dpm644 'COPYING' 'COPYING.DOSEMU' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  # Add the gnu tools to prevent compatibility problems
  install -Dpm644 '../dosemu/freedos/gnu'/* -t "${pkgdir}/usr/share/dosemu/freedos/gnu/"
  if [ "${_opt_Debug}" -ne 0 ]; then
    local _code='
if [ "$(cat "/proc/sys/kernel/yama/ptrace_scope")" -ne "0" ]; then
  echo "DEBUG BUILD: Enter user password to disable ptrace_scope"
  echo "0" | sudo tee "/proc/sys/kernel/yama/ptrace_scope" > /dev/null
fi

'
    local _lf=$'\n'
    sed -i -e '# Enable ptrace_scope' \
           -e "s@^get_binary()@${_code//${_lf}/\\n}&@g" \
      "${pkgdir}/usr/bin/dosemu"
  fi
  set +u
}

set +u
