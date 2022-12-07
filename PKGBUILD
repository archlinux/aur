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

_opt_altcommand=0
# 0 = use command. from freedos
# 1 = use alternate version of command.com, ignored when using fdpp

#_commit='#commit=d561c74ea59e615b103976bb7e1a5e5420616a23'; # SOURCE_DATE_EPOCH="$(date +%s -d '2021-03-06 04:16')"

_pkgname='dosemu2'
pkgname="${_pkgname}-git"
pkgver=2.0pre9.dev.r532.gc4bfb8ab3
pkgrel=1
_pkgver="${pkgver%%[a-z]*}"
pkgdesc='Virtual machine that allows you to run DOS programs under Linux'
arch=('i686' 'x86_64')
#url='https://stsp.github.io/dosemu2/'
url='https://github.com/dosemu2/dosemu2'
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
makedepends+=('unzip' 'upx')
if [ "${_opt_clang}" -ne 0 ]; then
  makedepends+=('clang')
fi
provides=("dosemu=${_pkgver}" "${_pkgname}=${_pkgver}")
conflicts=('dosemu' "${_pkgname}")
if [ "${_opt_fdpp}" -eq 0 ]; then
  : # conflicts+=('comcom32' 'fdpp')
else
  _opt_altcommand=0
fi
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
  "git+https://github.com/${_github}.git${_commit:-}"
  #'http://downloads.sourceforge.net/sourceforge/dosemu/dosemu-freedos-1.0-bin.tgz' # for the GNU utils
  'https://www.pement.org/sed/sed16bin.zip'
)
noextract=('sed16bin.zip')
if [ "${_opt_altcommand}" -ne 0 ]; then
  source+=("freecom1.3.zip::http://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/repositories/1.3/base/freecom.zip")
fi
if [ "${_freedos}" != 'none' ]; then
  #source+=("https://dl.dropboxusercontent.com/u/13513277/dosemu/${_freedos}")
  #source+=("https://chungy.keybase.pub/dosemu/${_freedos}")
  #noextract+=("${_freedos}")
  _fdiso="https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.1/official/fd11src.iso"
  source+=(
    "${_fdiso}"
    'fd11_FDchange.log'
    'fd11_README.bindist'
    'fd11_freedos-autoexec.bat'
    'fd11_freedos-config.sys'
  )
  noextract+=("${_fdiso##*/}")
  unset _fdiso
  makedepends+=('tar')
fi
md5sums=('SKIP'
         'f43650dcf2b3af628e8dd2f203ef606e'
         '2e0ab23bec79ff33071d80ea26f124dc'
         'c726b2c05157d3863a93327b1764af96'
         '2cdc1702c18325286375baabef7aa0c0'
         'e68cbd8c7b9da7410bfb635e2c63de9f'
         '86217b06184622be0a886129135eb0e1'
         'b5865e3f2fe40e1bd57cc88244b7371d'
         '12b1991af9683997a6ee389c3c5b8caf'
         '985152274e1a02ac653866cdeb3a5f6f'
         '2a248b5850c838a0a2cc80b8b280d1e7'
         'b1c1ec1279098c18e64a78f3b3c1cd17'
         'e184ea960d91a214b6d89fb5b2d0ff64'
         '74c36697da74a296f23134234ac9b239'
         '3b4fe018a970f36a80ecb16c1b961236'
         '1dc7bff9b5573a88e43ef4efa2d69bba'
         '5dc0a0ed109fc30e7715370ff94c5a49'
         '33eb8250ef5b5836984c5c32b074ee3f'
         'eddff8ac0fb970e1ddffc8ea72ed0139')
sha256sums=('SKIP'
            'f59ceb010c9b13cd89d7fba18fc8f6cc9e6a6193ebd3a7c4c5a290058069a905'
            '10190ff0d38f0d523f748504d5165fa5437492f42887ed8e3cfdad32781147b7'
            'f8916c96f17ad7d9e2825080753c7072e148940e792295180d46a6c07614b339'
            '12d175c6db2b6bcc09cf98db17f52afe4f5dac7a58bf3085e8b61e3e64738c13'
            '396e8d86a14f32c29a0c59ffaf4f6c37c80064f17d77af3ad4f7fe3e2dd4a903'
            'e4ba0ab8ce88a3e53eed7156ba4256bae4e342f1f9c71c893504536213247954'
            'f61eb87ec6b077e4b0d917b52362ecc810c8e019907ba6e45bb2780e3aba47d4'
            'b65be4e041fa6bb52b36c833401091f11fabd8753d84033f004584b6ac3daa25'
            'f1532fb5794e14cd23cab63b5b4c8d72827d86733e0afd38798297e4ea3afd01'
            'c68620e8f0f997ef52733de20cc75311d15de1563d7f2ec97f4b84bc32492c98'
            '8b549e769b301f5bafae5277c982ea322095f053385e26ad17c0e906b39a18c4'
            'f964b90eb3aae98e562c602d82979025a28be001a623879f4127c807e4d9c8ad'
            '49df5a5f68b91f64affc9f305a328f0925e07cbe88604e17687c653a523eabe5'
            'fb4f711de35a83d79e2ef0f67080e95431a3e7933fef8b890042647c1039d1e4'
            '6ef02deababd6709619fc0c52de67e2af182601576dc5e20f9273bef036e3215'
            '3a68eb3f30c871370256f10ab9349bf5295f037bf274850eeeefb3b3dc866496'
            '79cbac8fc5c1b338d4c0e689cdd268309cb5fa28fe088c1f7e93f71462724b75'
            'b473fd55457c87c067f2a307eca6dd4fbbfc7f9bfe79c7d653b3fc94add9e90a')

pkgver() {
  set -u
  cd 'dosemu2'
  git describe --tag --long | sed -e 's/\([^-][0-9]\+-g\)/r\1/' -e 's/-/./g'
  set +u
}

_fd10='fd10_https://www.ibiblio.org//pub/micro/pc-stuff/freedos/files/distributions/1.0/pkgs'
_fd11='fd11_https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.1/repos'
_fd12='fd12_https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.2/repos'
_gnu='gnu_https://www.ibiblio.org/pub/micro/pc-stuff/freedos/gnuish'
_extras=(
  # Extras originally found in dosemu-freedos-1.0-bin.tgz
  "${_fd10}/bwbasicx.zip" # Bywater Basic Ted A. Campbell
  #"${_fd11}/devel/bwbasic.zip" # DEVEL folder not handled
  #"${_fd12}/devel/bwbasic.zip" # DEVEL folder not handled
  "${_fd10}/libx.zip" # Steffen.KaiserT-Online.DE
  "${_fd10}/teex.zip" # COM
  #"${_fd11}/util/tee.zip" # EXE
  #"${_fd12}/unix/tee.zip" # EXE
  "${_fd10}/touchx.zip" # K. Heidenstrom
  #"${_fd11}/util/touch.zip"
  #"${_fd12}/unix/touch.zip"
  "${_fd10}/wcdx.zip" # Erwin Waterlander
  #"${_fd12}/util/wcd.zip"
  "${_gnu}/dos_only/diff23x.zip"
  "${_gnu}/dos_only/fut312bx.zip" # File utils
  "${_gnu}/dos_only/tut111ax.zip" # Text utils
  "${_gnu}/dos_only/grep20ax.zip"
  # Extras I want, though many of little use without long file name support
  "${_gnu}/find32.zip"
  "${_gnu}/gzip124x.zip" # Where's gunzip?
  ##"${_gnu}/sed106.zip" # in 00-index but not present. Found elsewhere.
  #"${_gnu}/dos_only/less291x.zip" # doesn't work any better than more
  ##"${_gnu}/unzip532.zip" # source only, no exe
  ##"${_gnu}/dos_only/zip22x.zip"
  ## zip and unzip are already present in base. These create unwanted unzip.zip and zip.zip
  #"${_fd11}/archivers/unzip.zip"
  #"${_fd11}/archivers/zip.zip"
  ##"${_fd11}/archivers/unrar.zip"
  "${_fd10}/vim16x.zip"
  ##"${_fd12}/edit/vim.zip" # Complicated folder structure, not compiled with lfn so most of the good stuff won't work
  # Others? awk, unix2dos
  # LFN versions of xcopy move zip unzip
)

# $1
# 0 for PKGBUILD
# 1 for shell script
_fn_genextra() {
  local _extra _dl _dli _pfx
  for _dli in "${!_extras[@]}"; do
    _dl="${_extras[_dli]}"
    _pfx="${_dl%%_*}_"
    _extra="${_pfx}${_dl##*/}"
    _dl="${_dl#${_pfx}}"
    _extras["${_dli}"]="${_extra}"
    if [ "$1" -ne 0 ]; then
      if [ ! -s "${_extra}" ]; then
        wget -O "${_extra}" "${_dl}"
      fi
    else
      source+=("${_extra}::${_dl}")
      noextract+=("${_extra}")
    fi
  done
}
_fn_genextra '0'

_fn_procextra() {
  shopt -s nullglob
  local _extra _exbase
  declare -A _exdone
  for _extra in "${_extras[@]}"; do
    _exbase="${_extra#*_}"
    _exbase="${_exbase%.zip}"
    _exbase="${_exbase%x}" # make teex and tee the same for dup checking
    if [ -z "${_exdone[${_exbase}]:-}" ]; then
      printf 'Extra: %s\n' "${_extra}"
      case "${_extra}" in
      fd*)
        unzip -d "tmp-freedos$2/dosemu/freedos" -q -o -LL "${_extra}"
        pushd "tmp-freedos$2/dosemu/freedos" > /dev/null
        if [ -d 'vim/vim70' ]; then
          echo '  > Move vim to bin'
          mv 'vim/vim70/vim.exe' 'vim/vim70/xxd.exe' 'bin/'
          rm -r 'packages' 'vim'
          ln -s 'vim.exe' 'bin/vi.exe'
        fi
        popd > /dev/null
        ;;
      gnu*)
        mkdir -p "tmp-freedos$2/dosemu/freedos/gnu/gnusort"
        unzip -d "tmp-freedos$2/dosemu/freedos/gnu/gnusort" -q -o -LL "${_extra}"
        pushd "tmp-freedos$2/dosemu/freedos/gnu/gnusort" > /dev/null
        # du has a bug where it changes the CWD
        # join and sort conflict
        find . '(' -name 'chmod.*' -o -name 'df.*' -o -name 'dd.*' -o -name 'du.*' -o -name 'install.*' -o -name 'sum.*' ')' -delete
        local _gf
        for _gf in *; do
          if [ -d "${_gf}" ]; then
            case "${_gf}" in
            'bin'|'dos'|'exe') mv "${_gf}"/*.exe ..; rm -r "${_gf}" ;;
            'docs'|'man') mkdir -p "../../doc/${_exbase}"; mv "${_gf}"/* "../../doc/${_exbase}"; rmdir "${_gf}" ;;
            'os2'|'manifest'|'src') rm -r "${_gf}" ;;
            *) printf 'GNU: Unhandled folder %s\n' "${_gf}"; rm -r "${_gf}" ;;
            esac
          else
            case "${_gf}" in
            'copying'|*.[0-9]|*.doc|*.man) mkdir -p "../../doc/${_exbase}"; mv "${_gf}" "../../doc/${_exbase}" ;;
            *.exe) mv "${_gf}" .. ;;
            *.info|readme*|'file_id.diz') rm "${_gf}" ;;
            *) printf 'GNU: Unhandled file %s\n' "${_gf}"; rm "${_gf}" ;;
            esac
          fi
        done
        popd > /dev/null
        rmdir "tmp-freedos$2/dosemu/freedos/gnu/gnusort"
        ;;
      esac
      _exdone["${_exbase}"]=1
    fi
  done
  shopt -u nullglob
}

# dosemu-freedos-1.1-bin.tgz
# $1: set the language for command.com. default en. see nls folder for available languages.
# $2: unique folder version in case you want to build more than one version at a time
# $3: output file name
_gen_fd11() {
  local _pw="${PWD}"
  local _iso='fd11src'

  rm -rf "tmp-freedos$2"
  mkdir -p "tmp-freedos$2/dosemu/freedos/tmp"

  chmod -R 'u+w' "tmp-${_iso}" || :
  rm -rf "tmp-${_iso}"
  mkdir "tmp-${_iso}"
  bsdtar --no-same-permissions -C "tmp-${_iso}" -xf "${_iso}.iso" # 7z additionally extracts [BOOT] which we don't need
  chmod -R 'u+w' "tmp-${_iso}"

  _fn_procextra "$@"

  local _z _zb
  shopt -s nullglob
  for _z in "${_pw}/tmp-${_iso}/FREEDOS/PACKAGES/BASE"/*.ZIP; do
    _zb="${_z##*/}"
    _zb="${_zb%%\.*}"
    _zb="${_zb,,}"
    case "${_zb}" in
    #appendx|aproposx|bootfixx|callverx|devloadx|doslfnx|emm386x|fdxmsx|fshieldx|fasthlpx|helpx|infozipx|keybx|nlsfuncx|samcfg|shsudrvx|sysx|xcdromx|xdmax) ;;
    cdrcachx|chkdskx|ctmousex|cwsdpmix|defragx|dosfsckx|usbdosx|fdapmx|fdiskx|fdpkgx|fdupdatx|fxms286x|formatx|graphicx|himemxx|installx|jemmexx|labelx|lbacachx|mirrorx|printqx|printx|recoverx|ripcordx|samcfgx|shsucdxx|uidex|undelx|unfmtx|xmgrx);;
    #*) bsdtar -xf "${_z}";; # bsdtar extracting to multiple case folders is too hard to unify
    *) unzip -d "tmp-freedos$2/dosemu/freedos" -q -o -LL "${_z}";; # unzip converts to lower case and makes all the right folders
    esac
  done
  cd "tmp-freedos$2/dosemu/freedos"
  #rm -f bin/_*.exe bin/winkern.sys
  #find . -depth -name '*[A-Z]*' -execdir bash -c '_f="{}"; mv "${_f}" "${_f,,}"' ';'

  #chmod -R 755 'source'
  rm -rf 'packages' 'source' doc/*.txt
  cd 'bin'
  mv 'kernel.sys' 'command.com' ..
  ln -s '../command.com'
  # The dup finder below links these to join.exe. We prefer swsubst.exe
  if [ "$(md5sum < 'swsubst.exe')" = "$(md5sum < 'join.exe')" ]; then
    ln -sf 'swsubst.exe' 'join.exe'
  fi
  if [ "$(md5sum < 'swsubst.exe')" = "$(md5sum < 'subst.exe')" ]; then
    ln -sf 'swsubst.exe' 'subst.exe'
  fi
  cd ..
  #mv 'appinfo/devload.lsm' 'appinfo/DEVLOAD.LSM' # probably a mistake from doing things by hand
  if :; then
    # Localize command.com
    if [ -s "nls/cmd-$1.com" ]; then
      ln -sf "nls/cmd-$1.com" 'command.com'
      ln -sf "../nls/cmd-$1.com" 'bin/command.com'
    else
      echo "Can't find nls/cmd-$1.com"
      return 1
    fi
  fi
  if :; then
    # Save space by turning duplicate files into symlinks
    local _fa
    _fa="$(md5sum $(find -type 'f'))"
    local _dupmds
    _dupmds="$(printf '%s\n' "${_fa}" | cut -d' ' -f1 | sort | uniq -c | grep -v -e '^\s\+1\s' | cut -c9-)"
    local _line
    local _md5
    local _md5p=''
    local _fil
    local _filp
    local _siz
    local _sizp
    while IFS='' read -r _line || [[ -n "${_line}" ]]; do
      _md5="${_line%% *}"
      _fil="${_line##* }"
      _siz="$(stat -c'%s' "${_fil}")"
      if [ "${_md5}" = "${_md5p}" ]; then
        if [ "${_siz}" = "${_sizp}" ]; then
          echo ln -srf "${_filp}" "${_fil}"
          ln -srf "${_filp}" "${_fil}"
        fi
      else
        _md5p="${_md5}"
        _filp="${_fil}"
        _sizp="${_siz}"
      fi
    done < <(grep -F -e "${_dupmds}" <<<"${_fa}" | sort)
  fi
  shopt -u nullglob
  cd ..
  #zip -o '../../fd11src-config' 'FDchange.log' 'README.bindist' freedos/{autoexec.bat,config.sys}
  if :; then
    for _z in "${srcdir}"/fd11_*; do
      _zb="${_z##*/}"
      _zb="${_zb##fd11_}"
      _zb="${_zb//-//}"
      cp -p "${_z}" "${_zb}"
      touch -h -d '2007-04-28 11:42:32.000000000 -0400' "${_zb}"
    done
  else
    bsdtar -xf "${_pw}/${_iso}-config.zip"
  fi
  cd ..

  # set mtime timestamps on generated dirs and links for repeatable md5sum. tar doesn't store atime
  find . -depth '(' -type 'd' -o -type 'l' ')' -exec touch -h -r 'dosemu/FDchange.log' '{}' '+'

  rm -f "../$3"
  tar -I 'gzip --best -n' --sort='name' -cf "../$3" 'dosemu/'
  cd ..
  md5sum "$3"
  rm -rf "tmp-freedos$2" "tmp-${_iso}"
}

prepare() {
  set -u
  if [ "${_freedos}" != 'none' ]; then
    _gen_fd11 'en' '11' 'dosemu-freedos-1.1-bin.tgz'
  fi
  mkdir -p 'sed16'
  unzip -d 'sed16' -q -o -LL 'sed16bin.zip'
  cd 'dosemu2'

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done

  shopt -s nullglob
  for _pt in "${startdir}/"/*.localpatch; do
    set +u; msg2 "Local Patch ${_pt}"; set -u
    patch -Nup1 -i "${_pt}"
  done
  shopt -u nullglob

  # Some makepkg options including -i erroneously run prepare() for vcs packages
  if [ -f 'debian/rules' ]; then
    if [ "${_freedos}" != 'none' ]; then
      ln -sf "../${_freedos}"
    fi
    #ln -s '../.git' 'src/.git'
    local _onoff=(off on on)
    cat > 'compiletime-settings' << EOF
config {
  sysconfdir /etc
  fdtarball ${_freedos}
  prefix /usr
  plugin_vde on
  fdpp ${_onoff[${_opt_fdpp}]}
  debug ${_onoff[${_opt_Debug}]}
}
EOF
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
    # export CFLAGS='-O2' # doesn't compile without -O2
    if [ "${_opt_clang}" -ne 0 ]; then
      _opts+=('CC=clang' 'CXX=clang++')
      CFLAGS="${CFLAGS//-fstack-protector-strong/} -fno-stack-protector" # Issue #332
      CFLAGS="${CFLAGS//-Wformat-overflow=[0-9]/}"
    fi
    echo "CFLAGS=${CFLAGS}"
    CFLAGS="${CFLAGS} -Wno-unused-result" \
    "${PWD}"/default-configure "${_opts[@]}" --prefix='/usr'
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
  test -d "${pkgdir}/usr/local" && echo "${}"
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
  #install -Dpm644 '../dosemu/freedos/gnu'/* -t "${pkgdir}/usr/share/dosemu/freedos/gnu/"
  # gnu belongs in dosemu2-extras/freedos, not dosemu/freedos
  # I don't want to move it just now
  install -d "${pkgdir}/usr/share/dosemu/freedos"
  ln -s '/usr/share/dosemu2-extras/freedos/gnu' "${pkgdir}/usr/share/dosemu/freedos/gnu"
  if [ "${_opt_Debug}" -ne 0 ]; then
    local _code='
if [ "$(cat "/proc/sys/kernel/yama/ptrace_scope")" -ne "0" ]; then
  echo "DEBUG BUILD: Enter user password to disable ptrace_scope"
  echo "0" | sudo tee "/proc/sys/kernel/yama/ptrace_scope" > /dev/null
fi

'
    local _lf=$'\n'
    sed -e '# Enable ptrace_scope' \
        -e "s@^get_binary()@${_code//${_lf}/\\n}&@g" \
      -i "${pkgdir}/usr/bin/dosemu"
  fi
  if [ "${_opt_fdpp}" -ne 0 ]; then
    find "${pkgdir}" '(' -name 'command.com' -o -name 'kernel.sys' ')' -delete # remove files and symlinks
  elif [ "${_opt_altcommand}" -ne 0 ]; then
    local _cmdlist
    readarray -t _cmdlist <<< "$(find "${pkgdir}" -type 'f' -name 'command.com')"
    if [ "${#_cmdlist[@]}" -ne 1 ]; then
      printf 'Found %u command.com, want only 1\n' "${#_cmdlist[@]}"
      set +u
      false
    fi
    install -pm644 "${srcdir}/BIN/COMMAND.COM" "${_cmdlist[0]}"
  fi


  pushd '../sed16' > /dev/null
  install -Dp -t "${pkgdir}/usr/share/dosemu2-extras/freedos/doc/sed" 'readme.16x' 'sed.lst'
  install -p -t "${pkgdir}/usr/share/dosemu2-extras/freedos/bin" 'sed.com'
  popd > /dev/null

  upx -d $(grep -lare 'UPX' --include '*.exe' "${pkgdir}")
  set +u
}

set +u
