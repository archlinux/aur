# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Tech <technetium1337 at gmail dot com>

# Clean Chroot ccm Xeon(R) E-2146G 6c12t: ----> Total build time for 1.4.1-hwcodec was 00:21:24
# Clean chroot build is smaller than the system build

# 0 for PKGBUILD commands which may go out of date
# 1 for build.py which should stay current
_opt_BUILD_PY=1

# 0 for download vcpkg, set _opt_VCPKG_COMMIT_ID
# 1 for system vcpkg, ignore _opt_VCPKG_COMMIT_ID
_opt_SYS_VCPKG=0
_opt_VCPKG_COMMIT_ID=''
# Select from list an item which matches pkgver. This allows to compile recent versions without excessive PKGBUILD hacking.
# $1: pkgver
# $2: vercmp test operator -ge or -eq
_fn_VCL() {
  local _q="$1" _v _vx='?' _vy='' _v1 _v2
  shift
  local _t="$1"
  shift
  while [ "$#" -gt 0 ]; do
    _v="$1"
    _v1="${_v%%:*}"
    _v2="${_v#*:}"
    if [ "$(vercmp "${_q}" "${_v1}")" "${_t}" 0 ]; then
      _vx="${_v}"
      _vy="${_v2}"
    fi
    shift
  done
  #printf '%s >= %s\n' "${_q}" "${_vx}" 1>&2
  printf '%s' "${_vy}"
}
#_opt_VCPKG_COMMIT_ID='#branch=2023.10.19'

# 0 for package flutter, version checked
# 1 for system flutter, version warned
_opt_SYS_FLUTTER=0

# hwcodec for H.264 H.265/HEVC stopped compiling when it went from/to
# 1.2.7 hwcodec v0.6.0 builtin       (https://github.com/21pages/hwcodec#89879f2f)
# 1.3.0 hwcodec v0.7.0 vcpkg::ffmpeg (https://github.com/rustdesk-org/hwcodec#6abd1898)
# restored in 1.4.1
#
# To get H264 H265, rustdesk must be compiled with vcpkg::ffmpeg build modified by rustdesk.
# libva and appropriate libva hardware driver must be installed and rebooted. See optdepends.
# Client supports all soft codecs and compiled in hardware codecs.
# Client hardware decode support (VAEntrypointVLD) preferred but not required.
# Host offers all encode software codecs and only hardware codecs supported by hardware (VAEntrypointEncSlice).
# Linux host may disable H265 even if supported by hardware. https://github.com/rustdesk/rustdesk/discussions/4095
# Linux client does support H265, verified by connecting to a Windows host >= Skylake or Android.
# Use libva-utils::vainfo to list supported hardware codecs VAProfileH264Main or VAProfileHEVCMain
# https://wiki.archlinux.org/title/Hardware_video_acceleration
_fn_hwcodec() {
  _opt_hwcodec_py=()
  _opt_hwcodec_fe=''
  _opt_hwcodec_vc=()
  if :; then
    _opt_hwcodec_py=('--hwcodec')
    _opt_hwcodec_fe=',hwcodec'
    if [ "$(vercmp "$1" "1.3.0")" -ge 0 ]; then
      _opt_hwcodec_vc=('ffmpeg')
      makedepends+=('ffnvcodec-headers' 'amf-headers')
      depends+=('zlib' 'libdrm')
    fi
  fi
}

true "${QUIET:=}" "${logpipe:=}"

set -u
_pkgname='rustdesk'
pkgname="${_pkgname}"
_pkgver='1.4.1'
pkgver="${_pkgver//-/.}"
pkgrel=1
_HBB=( # dates are retrieved from git fetch; tig. Every version gets a specific hbb.
  '1.3.7:20250120-49c6b24a7a8c39d4448e07b743007ef1a3febd43'
  '1.3.8:20250223-7cf11f7b771e27ecbd14fd1dd0ced55a64f40eb5'
  '1.3.9:20250328-81b932b7bfa2ff8bc60189625fd6538db2fa9ea1'
  '1.4.0:20250509-6e556f7e1751a3a709cd5cca0df7268ba3cb1c48'
  '1.4.1:20250718-f91459c4ab80fc3cfdef0882b2af51f984bc914c'
)
_pkgverhbb="$(_fn_VCL "${_pkgver}" -eq "${_HBB[@]}")"; unset _HBB; test "$(vercmp "${_pkgver}" '1.3.7')" -lt 0 -o ! -z "${_pkgverhbb}" || exit 1
pkgdesc='Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!'
arch=('x86_64')
url='https://rustdesk.com/'
_giturl='https://github.com/rustdesk/rustdesk'
_giturlhbb='https://github.com/rustdesk/hbb_common'
license=('AGPL-3.0-only')
_dpr=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'libva' 'libappindicator-gtk3' 'pam' 'gst-plugins-base' 'gst-plugin-pipewire') # from res/PKGBUILD/depends
#_dpr=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'libva' 'libvdpau' 'libappindicator-gtk3' 'pam' 'gst-plugins-base' 'gst-plugin-pipewire') # from res/PKGBUILD/depends
depends=("${_dpr[@]}" 'pulse-native-provider' 'gst-plugins-base-libs')
depends+=('hicolor-icon-theme' 'xdg-utils')
depends+=('xdg-user-dirs')
depends+=('glibc' 'gcc-libs' 'glib2' 'libxtst' 'libepoxy' 'gdk-pixbuf2' 'cairo' 'at-spi2-core' 'dbus' 'gstreamer' 'pango' 'libx11' 'fontconfig' 'libxkbcommon' 'libpulse')
_mdp=('unzip' 'git' 'cmake' 'gcc' 'curl' 'wget' 'yasm' 'nasm' 'zip' 'make' 'pkg-config' 'clang') # from Readme.MD
makedepends=("${_mdp[@]}" 'rust' 'python' 'python-yaml' 'python-toml')
makedepends+=('ninja' 'patchelf') # 'meson' 'pkgconf' # vcpkg makedepends are found in clean chroot. Some tools cmake always uses its own.
_fn_hwcodec "${_pkgver}" # makedepends
if [ "${#_opt_hwcodec_py[@]}" -gt 0 ]; then
  optdepends=( # lifted from libva::PKGBUILD
    'intel-media-driver: h264 h265/HEVC support for Intel Quick Sync GPUs (>= Broadwell)'
    'libva-intel-driver: h264 support for Intel Quick Sync GPUs (<= Haswell)'
    'libva-mesa-driver: h264 h265/HEVC support for AMD and NVIDIA GPUs'
    'libva-utils: vainfo query codec support'
  )
fi
options=('!lto')
_patches=(
  '0000-disable-update-check@rustdesk.patch'
  #'0001-extended_text-drop-version-for-flutter.3.22.3@rustdesk.patch' # https://github.com/rustdesk/rustdesk/blob/master/.github/workflows/bridge.yml#L77
  '0002-screen_retriever@rustdesk.patch'
)
install="${pkgname}.install"
_srcdir="${pkgname}-${_pkgver}"
source=(
  "${_srcdir}.tar.gz::${_giturl}/archive/refs/tags/${_pkgver}.tar.gz"
  "${_patches[@]}"
  '0003-mkvparser.cc-cstdint.patch'
)
if [ ! -z "${_pkgverhbb}" ]; then
  _srcdirhb="hbb_common-${_pkgverhbb##*-}"
  source=("${source[0]}" "hbb_common-${_pkgverhbb}.tgz::${_giturlhbb}/archive/${_pkgverhbb##*-}.tar.gz" "${source[@]:1}")
fi
unset _pkgverhbb
_vcs=(
)
_srcdirvc='vcpkg'
if [ "${_opt_SYS_VCPKG}" -ne 0 ]; then
  makedepends+=('vcpkg')
else
  _VCL=(
    '1.2.7:#commit=20240614-f7423ee180c4b7f40d43402c2feb3859161ef625' # last version that worked with hwcodec
    '1.3.0:#commit=20240712-1de2026f28ead93ff1773e6e680387643e914ea1'
    '1.3.6:#commit=20241115-b2cb0da531c2f1f740045bfe7c4dac59f0b2b69c'
    '1.3.8:#commit=20250113-6f29f12e82a8293156836ad81cc9bf5af41fe836'
  )
  _opt_VCPKG_COMMIT_ID="$(_fn_VCL "${_pkgver}" -ge "${_VCL[@]}")"
  #source+=("git+https://github.com/microsoft/vcpkg${_opt_VCPKG_COMMIT_ID}")
  _srcdirvc="vcpkg-${_opt_VCPKG_COMMIT_ID##*-}"
  source+=("vcpkg-${_opt_VCPKG_COMMIT_ID##*=}.tgz::https://github.com/microsoft/vcpkg/archive/${_opt_VCPKG_COMMIT_ID##*-}.tar.gz")
  _meaver='1.6.1'
  _pcfver='2.3.0'
  _aomver='d6f30ae474dd6c358f26de0a0fc26a0d7340a84c'
  _jpgver='3.1.0'
  _yuvver='0faf8dd0e004520a61a603a4d2996d5ecc80dc3f'
  _wbmver='1.15.0'
  _xipver='1.5.2'
  _vcs+=(
    "meson-${_meaver}.tar.gz::https://github.com/mesonbuild/meson/archive/refs/tags/${_meaver}.tar.gz" # meason and pkgconf versions are found in clean chroot
    "pkgconf-pkgconf-pkgconf-${_pcfver}.tar.gz::https://github.com/pkgconf/pkgconf/archive/refs/tags/pkgconf-${_pcfver}.tar.gz"
    # If your download gets renamed and replaced, vcpkg hash checked and found it to be the wrong one.
    # vcs sources are not hash checked. vcpkg doesn't use hash direct downloads like we do. vcpkg downloads with git and tars up, always with a different hash.
    "aom-${_aomver}.tar.gz::https://aomedia.googlesource.com/aom/+archive/${_aomver}.tar.gz"
    "libjpeg-turbo-libjpeg-turbo-${_jpgver}.tar.gz::https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/${_jpgver}.tar.gz"
    "libyuv-${_yuvver}.tar.gz::https://chromium.googlesource.com/libyuv/libyuv/+archive/${_yuvver}.tar.gz"
    "webmproject-libvpx-v${_wbmver}.tar.gz::https://github.com/webmproject/libvpx/archive/refs/tags/v${_wbmver}.tar.gz"
    "xiph-opus-v${_xipver}.tar.gz::https://github.com/xiph/opus/archive/refs/tags/v${_xipver}.tar.gz"
  )
  if [ "${#_opt_hwcodec_vc[@]}" -ne 0 ]; then
    _ffmver='7.1'
    _vcs+=("ffmpeg-ffmpeg-n${_ffmver}.tar.gz::https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n${_ffmver}.tar.gz")
  fi
fi
source+=("${_vcs[@]}")
  if [ "${_opt_SYS_FLUTTER}" -eq 0 ]; then
    _FLX=(
      '9.9.9:3.16.9' # 1.3.0
      '1.2.7:3.19.6' # 1.3.1
      '9.9.9:3.22.3' # 1.3.3
      '1.4.1:3.27.4' # none
    )
    _FLUVER="$(_fn_VCL "${_pkgver}" -ge "${_FLX[@]}")"; unset _FLX # https://docs.flutter.dev/release/archive
    source+=(
      "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_FLUVER}-stable.tar.xz"
    )
  else
    makedepends+=('flutter')
  fi
  if :; then
    _FRBVER='1.80.1'
    _srcdirfrb="flutter_rust_bridge-${_FRBVER}"
    source+=(
      "${_srcdirfrb}.tar.gz::https://github.com/fzyzcjy/flutter_rust_bridge/archive/refs/tags/v${_FRBVER}.tar.gz"
    )
  fi
####
md5sums=('86daae1bd101e61566af7c6728517861'
         'd7dd05d0ca5709c328ba8e0b15f180e1'
         '6acc4b5b14befec55ef84006b60c7ff5'
         'a77a4586f30f77de2eed63e160b3a051'
         '379cfba8479c2a92e05e3b855d1e6901'
         '4d782be2571f14e7b74b10a385f74e15'
         'e86ff4df372dd1819ea45c540d5be13f'
         '5dd9f68970c677d6e6951df55e343635'
         'a45fa99b7f1a972e364cc68f1ebf949c'
         '1695d39ba38a9593f4107722f3459fe0'
         'f2f3868524b82915da3700267d116cdf'
         '6d2b7b8e1c06f4b10ae63ca22491f8a4'
         '557a08d88aa605ee6cf4156686ce4cc2'
         '03485098fb64a000a4f7cd97e468dfff'
         '4faa930d94db6f19d36dbbfbc5e86b5e'
         'cc8e5418ff0c163228aabbe385ba2596')
sha256sums=('5043af2f64e7b92d81d54d3c9ae6abb02c7e57e4eedb139674ba9e7ade6b142c'
            '1506802672283c3f9b39a7c81f7f880cae320553a59335f033919e93ec42e729'
            '8f7f1019404ce47dc012ba7c546ad634b973452fc2c57ac64b62cdc7c1f54ea3'
            '82757ee1ab6b956a3c601f7db82e2d9ad80dbbcf2ba68c63059f0b529426ccd0'
            '359046f24f8a81b96a198000a1cfd7934c1f4870b2a1306e13f65694cefef68f'
            '3df9359a39b91929868265090b97d7e2365dc8cdd5aaa1473a717720b4598f55'
            '4889795777b536ea1a351982f3ef7c7b06a786ccb47036daba63cc5757c59edb'
            '0ee103cd390c3ee0e77a7a1c71dcb79a50a426fa2a648f6d07f2678c23adc5e3'
            '06b9ea2f20a216fffac0c3991ea517ad4159df976bb7cd05084c8bfba3608fba'
            '35fec2e1ddfb05ecf6d93e50bc57c1e54bc81c16d611ddf6eff73fff266d8285'
            '73a4ecb598cd6824cb7a0a0d934d81b866e2762acd8eb465e1510063b4649659'
            'e935eded7d81631a538bfae703fd1e293aad1c7fd3407ba00440c95105d2011e'
            '9480e329e989f70d69886ded470c7f8cfe6c0667cc4196d4837ac9e668fb7404'
            '7ddad2d992bd250a6c56053c26029f7e728bebf0f37f80cf3f8a0e6ec706431a'
            '64df4273de625433c7ba41967932b782f5f9abf3199db8330782d64508379344'
            '5c1494e79024de228a9f383c8e52e45b042cd0cf24f4b0f47ee4d5448938b336')
_vcs=("${_vcs[@]%%::*}")
_vcs=("${_vcs[@]##*/}")
noextract=("${_vcs[@]}")

if ! :; then
  _srcdir="${_pkgname}"
  source[0]="git+${_giturl}#tag=${_pkgver}"
fi

# updpkgsums now uses hashes for git commits, which are different than the git commit hashes. We want the original behavior SKIP.
# googlesource commit direct downloads do not have consistent hashes
for _fk in "${!source[@]}"; do
  if [ "${source[${_fk}]#git}" != "${source[${_fk}]}" ] || [ "${source[${_fk}]/googlesource/}" != "${source[${_fk}]}" ]; then
    md5sums["${_fk}"]='SKIP'
    sha256sums["${_fk}"]='SKIP'
  fi
done
unset _fk

_vcpkg=(libvpx libyuv opus aom)

_prepare_vc() {
  msg '_prepare_vc'
  set -u
  if [ "${_opt_SYS_VCPKG}" -ne 0 ] && [ ! -d 'vcpkg' ]; then
    local _vcp='/opt/vcpkg'
    if [ ! -d "${_vcp}" ]; then
      _vcp='/usr/lib/vcpkg'
    fi
    set +u; msg2 "Copy ${_vcp}"; set -u
    cp -pr "${_vcp}" .
  fi
  mkdir -p "${_srcdirvc}/downloads"
  if [ "${#_vcs[@]}" -gt 0 ]; then
    cp -p "${_vcs[@]}" "${_srcdirvc}/downloads"
  fi

  # Check commit ID
  if [ "${_opt_SYS_VCPKG}" -eq 0 ] && [ ! -z "${_opt_VCPKG_COMMIT_ID}" ]; then
    local _vcc
    local _pyvcc="
import yaml
import io
with open('${_srcdir}/.github/workflows/flutter-build.yml', 'r') as stream:
    data_loaded = yaml.safe_load(stream)
#print(data_loaded.get('env').keys())
print(data_loaded.get('env').get('VCPKG_COMMIT_ID'))
"
    _vcc="$(python -c "${_pyvcc}")"
    if [ "${_vcc}" != "${_opt_VCPKG_COMMIT_ID##*-}" ]; then
      echo "Flag package out of date: _opt_VCPKG_COMMIT_ID must be changed to (date)-${_vcc}"
      set +u
      false
    fi
  fi

  local _vcpkgnew
  _vcpkgnew="$(sed -E -n -e '/Linux.+: vcpkg / s:^.+install ::p' "${_srcdir}/README.md")"
  if [ "${_vcpkg[*]}" != "${_vcpkgnew}" ]; then
    printf 'Flag package out of date: _vcpkg=(%s)\n' "${_vcpkgnew}"
    set +u
    false
  fi
  set +u
}

# Same elements in same order
_dpr_check() {
  msg '_dpr_check'
  set -u
  pushd "${_srcdir}" > /dev/null
  (
    source 'res/PKGBUILD'
    if [ "${#_dpr[@]}" -ne "${#depends[@]}" ]; then
      echo 'Flag package out of date: Update _dpr from res/PKGBUILD/depends=()'
      false
    fi
    for((f=0; f<"${#_dpr[@]}"; f++)); do
      if [ "${_dpr[f]}" != "${depends[f]}" ]; then
        echo 'Flag package out of date: Update _dpr from res/PKGBUILD/depends=()'
        set +u
        false
      fi
    done
  )
  popd > /dev/null
  set +u
}

_flutter_check() {
  set +u; msg '_flutter_check'; set -u

    local _FLUTTER_VERSION
    local _pyfv="
import yaml
import io
#with open('.github/workflows/flutter-build.yml', 'r') as stream:
with open('.github/workflows/bridge.yml', 'r') as stream:
    data_loaded = yaml.safe_load(stream)
#print(data_loaded.get('env').keys())
print(data_loaded.get('env').get('FLUTTER_VERSION'))
"
    _FLUTTER_VERSION="$(python -c "${_pyfv}")"
    if [ "${_opt_SYS_FLUTTER}" -ne 0 ]; then
      local _FLUVER
      _FLUVER="$(pacman -Q flutter)"
      _FLUVER="${_FLUVER##* }"
      _FLUVER="${_FLUVER%%-*}"
    fi
    if [ "${_FLUTTER_VERSION}" != "${_FLUVER}" ]; then
      if [ "${_opt_SYS_FLUTTER}" -ne 0 ]; then
        set +u; msg2 "Warning: expected Flutter version is ${_FLUTTER_VERSION}"; set -u
        _FLUTTER_VERSION="${_FLUVER}"
      else
        printf 'Flutter version has changed to %s from %s\n' "${_FLUTTER_VERSION}" "${_FLUVER}"
        #set +u
        #false
      fi
    fi
    set +u; msg2 "FLUTTER_VERSION=${_FLUTTER_VERSION}"; set -u
    local _flutter_rust_bridge
    local _pyfrb="
import toml
new_toml_string = toml.load('Cargo.toml')
#print(new_toml_string.keys())
print(new_toml_string.get('dependencies').get('flutter_rust_bridge').get('version'))
"
    local _pyfrb="
import yaml
import io
with open('.github/workflows/bridge.yml', 'r') as stream:
    data_loaded = yaml.safe_load(stream)
#print(data_loaded.get('env').keys())
print(data_loaded.get('env').get('FLUTTER_RUST_BRIDGE_VERSION'))
"
    _flutter_rust_bridge="$(python -c "${_pyfrb}")"
    _flutter_rust_bridge="${_flutter_rust_bridge#=}"
    if [ "$(vercmp "${_flutter_rust_bridge}" "${_FRBVER%.0}")" -gt 0 ]; then
      printf 'flutter_rust_bridge version has changed to %s from %s\n' "${_flutter_rust_bridge}" "${_FRBVER}"
      set +u
      false
    fi
    set +u; msg2 "flutter_rust_bridge=${_flutter_rust_bridge}"; set -u

}

_mod_py() {
  if [ "$(grep -c -F -e 'os.system' 'build.py')" -gt 1 ]; then
    local _lf=$'\n'
    local _nc='
def systemecho(cmd):
    print(cmd)
    return os.system(cmd)

'
    _nc="${_nc//${_lf}/\\n}"
    sed -e '# echo all system commands' \
        -e 's:os.system:systemecho:g' \
        -e "s/^def get_version/${_nc}&/g" \
        -e '# Disable makepkg' \
        -e 's:makepkg:true &:g' \
        -e '/pkg.tar.zst/ s:mv:true &:g' \
        -i 'build.py'
  fi
  if [ "${source[0]#git}" = "${source[0]}" ]; then
    sed -e 's:git checkout:true &:g' -i 'build.py'
  fi
}

prepare() {
  _dpr_check
  #rm -rf ~/'.cache/vcpkg/archives' ~/'.vcpkg'
  _prepare_vc
  pushd "${_srcdir}/res/vcpkg" > /dev/null
  cp -pr . "${srcdir}/${_srcdirvc}/ports/" # the default vcpkg::ffmpeg build does not produce the correct libraries or codecs libavcodec.a libavutil.a libavformat.a. Use Rustdesk mods
  popd > /dev/null
  set -u
    if [ "${_opt_SYS_FLUTTER}" -ne 0 ]; then
      set +u; msg2 'Copy /opt/flutter'; set -u
      rm -rf 'flutter'
      if [ -d '/opt/flutter' ]; then
        cp -pr '/opt/flutter' .
      else
        cp -pr '/usr/lib/flutter' .
      fi
    fi
    if [ ! -d 'flutter_rust_bridge' ]; then
      ln -s "flutter_rust_bridge-${_FRBVER}" 'flutter_rust_bridge'
      test -d 'flutter_rust_bridge'
    fi

  cd "${_srcdir}"
  _flutter_check
  _mod_py

  if rmdir 'libs/hbb_common'; then
    pushd 'libs' > /dev/null
    test -d "${srcdir}/${_srcdirhb}"
    ln -sr "${srcdir}/${_srcdirhb}" 'hbb_common'
    popd > /dev/null
  fi

  local _pt _ptf=() _pts=() _ptd
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    _ptd=()
    if [[ "${_pt}" =~ ^[^@]+@([^.]+).patch$ ]]; then
      case "${BASH_REMATCH[1]}" in
      'rustdesk') _ptd=(-d "${srcdir}/${_srcdir}");;
      'flutter_rust_bridge') _ptd=(-d "${srcdir}/${_srcdirfrb}");;
      'vcpkg') _ptd=(-d "${srcdir}/${_srcdirvc}") ;;
      *) _ptd=(-d "${srcdir}/${BASH_REMATCH[1]}");;
      esac
    fi
    if patch "${_ptd[@]}" -Nup1 -i "${srcdir}/${_pt}"; then
      _pts+=("${_pt}")
    else
      _ptf+=("${_pt}")
    fi
  done
  if [ "${#_ptf[@]}" -gt 0 ]; then
     if [ "${#_pts[@]}" -gt 0 ]; then
       printf 'Patch success %s\n' "${_pts[@]}"
       printf 'Warning: Some old patches may need to be removed even if they are successful\n'
     fi
     printf 'Patch failed %s\n' "${_ptf[@]}"
     set +x
     false
  fi
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cp -pr "${_srcdirfrb}" 'fa'; ln -s "${_srcdirfrb}" 'fb'; false
  #cd '..'; cp -pr "${_srcdirvc}" 'va'; ln -s "${_srcdirvc}" 'vb'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM@domain.patch"
  set +u
}

build() {
  msg2 'Build vcpkg'
  set -u
  unset VCPKG_DOWNLOADS
  if [ ! -x "${_srcdirvc}/vcpkg" ]; then
    "${_srcdirvc}/bootstrap-vcpkg.sh" -disableMetrics
  fi
  export VCPKG_ROOT="${PWD}/${_srcdirvc}"
  local _vcextra=(
    --disable-metrics
    --cmake-args='-DVCPKG_BUILD_TYPE=release' # https://github.com/microsoft/vcpkg/issues/37186#issuecomment-2133951797
    --cmake-args='-DVCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES=enabled'
    #--no-downloads
    #--only-downloads
  )
  #export CMAKE_POLICY_VERSION_MINIMUM='3.5'
  nice -n1 "${_srcdirvc}/vcpkg" install "${_vcextra[@]}" --x-install-root="${VCPKG_ROOT}/installed" "${_vcpkg[@]}" "${_opt_hwcodec_vc[@]}"

  cd "${_srcdir}"
    set +u; msg2 'Build rustdesk Flutter'; set -u
    set -x
    export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation: " | cut -d' ' -f4-)/include"
    local _oldpath="${PATH}"
    export CARGO_INCREMENTAL=0
    export PATH="${srcdir}/flutter/bin:${_oldpath}"
    pushd "${PATH%%:*}"
    if [ ! -s 'flutter-NVC' ]; then
      mv 'flutter' 'flutter-NVC'
      cat > 'flutter' << EOF
#!/usr/bin/bash

# https://github.com/flutter/flutter/issues/59533
# Gets rid of all the unnecessary downloads

echo '#flutter --no-version-check' "\$@"
flutter-NVC --no-version-check "\$@"
EOF
      chmod 755 'flutter'
    fi
    if [ ! -s 'dart-NVC' ]; then
      mv 'dart' 'dart-NVC'
      cat > 'dart' << EOF
#!/usr/bin/bash

# dart doesn't do a version check. Let's reveal the commands.

echo '#dart' "\$@"
dart-NVC "\$@"
EOF
      chmod 755 'dart'
    fi
    popd
    flutter doctor
    dart pub global activate ffigen --version 5.0.1
    pushd "${srcdir}/flutter_rust_bridge/frb_codegen"; nice -n1 cargo install --path . ; popd
    pushd flutter ; flutter clean; flutter pub get ; popd
    local _CGdefault=~/.cargo
    local _CARGO_HOME_RUSTDESK="${CARGO_HOME:-${_CGdefault}}"
    "${_CARGO_HOME_RUSTDESK}"/bin/flutter_rust_bridge_codegen --rust-input ./src/flutter_ffi.rs --dart-output ./flutter/lib/generated_bridge.dart
    if :; then
      find "${_CARGO_HOME_RUSTDESK}/git" -type 'f' -name 'mkvparser.cc' -execdir sh -c "patch --no-backup-if-mismatch -Nup0 -i \"${srcdir}/0003-mkvparser.cc-cstdint.patch\"; rm -f mkvparser.cc.rej; true" ';'
    fi
    if [ "${_opt_BUILD_PY}" -ne 0 ]; then
      nice -n1 ./build.py --flutter "${_opt_hwcodec_py[@]}"
    else
      #git checkout src/ui/common.tis
      nice -n1 cargo build --features flutter${_opt_hwcodec_fe} --lib --release
      pushd flutter
      nice -n1 flutter build linux --release
      popd
    fi
    set +x
  set +u
}

# This rebuilds the entire package
check_disabled() {
  cd "${_srcdir}"
  nice -n1 cargo test --release
}

package() {
  set -u
  cd "${_srcdir}"

    install -d "${pkgdir}/usr/lib/"
    cp -pr 'flutter/build/linux/x64/release/bundle' "${pkgdir}/usr/lib/"
    mv "${pkgdir}/usr/lib/"{bundle,${_pkgname}}
      install -d "${pkgdir}/usr/bin/"
      ln -s -t "${pkgdir}/usr/bin/" "/usr/lib/${_pkgname}/${_pkgname}"

  install -Dm0644 "res/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

  install -Dm0644 'res/32x32.png' "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm0644 'res/128x128.png' "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm0644 'res/128x128@2x.png' "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Version=${pkgver%.r*}
Name=RustDesk
GenericName=Remote Desktop
GenericName[zh_CN]=远程桌面
Comment=Remote Desktop
Comment[zh_CN]=远程桌面
Exec=${_pkgname} %u
Icon=${_pkgname}
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;RemoteAccess;GTK;
Keywords=internet;
Actions=new-window;

X-Desktop-File-Install-Version=0.23

[Desktop Action new-window]
Name=Open a New Window
EOF
  install -Dm644 'LICENCE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  set +u
}
set +u
