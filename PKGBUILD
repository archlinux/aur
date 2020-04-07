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
# Debug builds must be launched from the command line to allow
# sudo to change a system setting. If you need to keep the desktop file
# set the option below.

_opt_clang=0
# 0 = gcc
# 1 = clang

_opt_keepdesktop=0
# 0 = normal
# 1 = install desktop file even in debug modes. This is dangerous as launching sudo in a .desktop crashes the DE

_opt_fdpp=1
# 0 = use freedos
# 1 = use fdpp and comcom32 (boot only, freedos is still used for utilities)

_pkgname='dosemu2'
pkgname="${_pkgname}-git"
pkgver=2.0pre8.r1732.g8b5e2010f
pkgrel=1
_pkgver="${pkgver%%[a-z]*}"
pkgdesc='Virtual machine that allows you to run DOS programs under Linux'
arch=('i686' 'x86_64')
url='https://stsp.github.io/dosemu2/'
license=('GPL' 'custom')
depends=('glibc' 'alsa-lib')
if [ "${_opt_Debug}" -ne 0 ]; then
  depends+=('gdb' 'binutils' 'sudo')
fi
if [ "${_opt_fdpp}" -ne 0 ]; then
  depends+=('fdpp')
fi
optdepends=(
  'libao: audio output'
  'gpm: mouse support in console'
  'slang: console display'
  'sdl2: graphical display'
  'fluidsynth: MIDI support'
  'soundfont-fluid: or other SoundFont for MIDI support' # ERROR: Your fluidsynth is too old and soundfonts not found
  'vde2-dosemu2: networking support'
  'fbset: graphical display on console'
)
makedepends=('git' 'flex' 'bison' 'binutils' 'sed' 'perl' 'bash')
if [ "${_opt_clang}" -ne 0 ]; then
  makedepends+=('clang')
fi
provides=("dosemu=${_pkgver}" "${_pkgname}=${_pkgver}")
conflicts=('dosemu' "${_pkgname}")
backup=(
  'etc/dosemu/dosemu.conf'
# 'etc/dosemu/dosemu.users'
# 'etc/dosemu/global.conf'
)
options=('!strip')
_github='stsp/dosemu2'
_verwatch=("https://github.com/${_github}/releases.atom" "\s\+<title>${_pkgname}-\([^<]\+\)</title>" 'f')
_freedos='none'
_freedos='dosemu-freedos-1.1-bin.tgz'
#_freedos='dosemu-freedos-bin.tgz'
#_freedos='msdos70-bin.tgz' # install.c will need to be fixed before this is automatic
source=(
  "git+https://github.com/${_github}.git"
  'http://downloads.sourceforge.net/sourceforge/dosemu/dosemu-freedos-1.0-bin.tgz' # for the GNU utils
)
if [ "${_freedos}" != 'none' ]; then
  #source+=("https://dl.dropboxusercontent.com/u/13513277/dosemu/${_freedos}")
  source+=("https://chungy.keybase.pub/dosemu/${_freedos}")
fi
noextract=("${_freedos}")
md5sums=('SKIP'
         '2e09774fe91cff4372cb4a393eb467f5'
         '93b55f4b156446be798be3634ef46e2d')
sha256sums=('SKIP'
            '080c306a1b611e1861fd64466062f268eb44d2bf38082b8a57efadb5a9c0ebc7'
            '0891a8346ee58f8468ab17f93315d6f23fe68348d297be39c1faad5bd6e59613')

pkgver() {
  set -u
  cd 'dosemu2'
  git describe --tag --long | sed -e 's/\([^-][0-9]\+-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd 'dosemu2'

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done

  # Some makepkg options including -i erroneously run prepare() for vcs packages
  if [ -f 'debian/rules' ]; then
    if [ "${_freedos}" != 'none' ]; then
      ln -sf "../${_freedos}"
    fi
    #ln -s '../.git' 'src/.git'
    sed -e '# Enable VDE' \
        -e 's:^\(\s*plugin_vde\)\s.*$:\1 on:g' \
        -e '# Update freedos' \
        -e 's:^\(\s*fdtarball\)\s.*$:'"\1 ${_freedos}:g" \
        -e '# This breaks PREFIX and we still need freedos' \
        -e '#s:^\(\s*fdtarball\)\s.*$:'"\1:g" \
        -e '# Prefix' \
        -e 's:^}$:  prefix /usr\n&:g' \
      -i 'compiletime-settings'{,.devel}
    rm -f 'debian/rules' # We don't use this file so I'm using it as a flag.
  fi
  set +u
}

_configure() { # makepkg -e compatible
  set -u
  cd 'dosemu2'
  if [ ! -s 'configure' ]; then
    ./autogen.sh
    local _opts=()
    if [ "${_opt_fdpp}" -eq 0 ]; then
      _opts+=(--disable-fdpp)
    fi
    if [ "${_opt_Debug}" -ne 0 ]; then
      _opts+=('-d' '--enable-debug')
      #_opts+=('-d' '--disable-xbacktrace')
    fi
    if [ "${_opt_clang}" -ne 0 ]; then
      _opts+=('CC=clang' 'CXX=clang++')
      CFLAGS="${CFLAGS//-fstack-protector-strong/} -fno-stack-protector" # Issue #332
      CFLAGS="${CFLAGS//-Wformat-overflow=[0-9]/}"
    fi
    echo "CFLAGS=${CFLAGS}"
    CFLAGS="${CFLAGS} -Wno-unused-result" \
    ./default-configure "${_opts[@]:-}"
  fi
  set +u
  cd "${srcdir}"
}

build() {
  _configure
  set -u
  cd 'dosemu2'
  if [ "${_opt_Debug}" -gt 1 ]; then
    make -j1
  else
    local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
    nice make -s -j "${_nproc}"
  fi
  set +u
}

package() {
  set -u
  cd 'dosemu2'
  make DESTDIR="${pkgdir}" install
  if [ "${_opt_Debug}" -eq 0 ] || [ "${_opt_keepdesktop}" -ne 0 ]; then # sudo in the launcher crashes cinnamon
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
