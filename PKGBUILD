# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Ataraxy
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Tech <technetium1337 at gmail dot com>

# 0 for PKGBUILD commands which may go out of date
# 1 for build.py which should stay current
_opt_BUILD_PY=0

# 0 for download vcpkg, set _opt_VCPKG_COMMIT_ID
# 1 for system vcpkg, ignore _opt_VCPKG_COMMIT_ID
_opt_SYS_VCPKG=1
_opt_VCPKG_COMMIT_ID='#commit=14e7bb4ae24616ec54ff6b2f6ef4e8659434ea44'
#_opt_VCPKG_COMMIT_ID=''

# 0 for Sciter
# 1 for Flutter
# Flutter has more advanced UI
_opt_FLUTTER=1

# 0 for package flutter, version checked
# 1 for system flutter, version warned
_opt_SYS_FLUTTER=0

set -u
_pkgname='rustdesk'
pkgname="${_pkgname}"
pkgname+="-git"
pkgver=1.2.3.r130.g92916d98
pkgrel=1
pkgdesc='Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!'
arch=('x86_64')
url='https://rustdesk.com/'
_giturl='https://github.com/rustdesk/rustdesk'
license=('GPL3')
_dpr=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'libva' 'libvdpau' 'libappindicator-gtk3' 'pam' 'gst-plugins-base' 'gst-plugin-pipewire') # from res/PKGBUILD/depends
depends=("${_dpr[@]}" 'pulseaudio' 'gst-plugins-base-libs')
depends+=('hicolor-icon-theme' 'xdg-utils')
depends+=('xdg-user-dirs')
_mdp=('unzip' 'git' 'cmake' 'gcc' 'curl' 'wget' 'yasm' 'nasm' 'zip' 'make' 'pkg-config' 'clang') # from Readme.MD
makedepends=("${_mdp[@]}" 'rust' 'python' 'python-yaml' 'python-toml')
makedepends+=('ninja') # vcpkg build can use the latest ninja
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
options=('!strip' '!makeflags' '!lto')
install="${pkgname}.install"
_srcdir="${_pkgname}"
source=(
  "git+${_giturl}.git"
)
_vcs=(
  'https://cmake.org/files/v3.18/cmake-3.18.4-Linux-x86_64.tar.gz'
  'ninja-linux-1.10.1.zip::https://github.com/ninja-build/ninja/releases/download/v1.10.1/ninja-linux.zip'
  'webmproject-libvpx-v1.11.0.tar.gz::https://github.com/webmproject/libvpx/archive/v1.11.0.tar.gz'
)
if [ "${_opt_SYS_VCPKG}" -ne 0 ]; then
  makedepends+=('vcpkg')
  _vcs+=(
    'libjpeg-turbo-libjpeg-turbo-2.1.4.tar.gz::https://github.com/libjpeg-turbo/libjpeg-turbo/archive/2.1.4.tar.gz'
    'webmproject-libvpx-v1.12.0.tar.gz::https://github.com/webmproject/libvpx/archive/v1.12.0.tar.gz'
  )
else
  source+=("git+https://github.com/microsoft/vcpkg${_opt_VCPKG_COMMIT_ID}")
fi
source+=("${_vcs[@]}")
if [ "${_opt_FLUTTER}" -eq 0 ]; then
  source+=("https://raw.github.com/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so")
else
  if [ "${_opt_SYS_FLUTTER}" -eq 0 ]; then
    _FLUVER='3.10.6'
    source+=(
      "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_FLUVER}-stable.tar.xz"
      #"flutter_rust_bridge-${_FRBVER}.tar.gz::https://pub.dev/packages/flutter_rust_bridge/versions/${_FRBVER}.tar.gz" # bad packaging
      #"git+https://github.com/SoLongAndThanksForAllThePizza/flutter_rust_bridge.git"
    )
  else
    makedepends+=('flutter')
  fi
  if :; then
    _FRBVER='1.75.0'
    source+=(
      "flutter_rust_bridge-${_FRBVER}.tar.gz::https://github.com/fzyzcjy/flutter_rust_bridge/archive/refs/tags/v${_FRBVER}.tar.gz"
    )
  fi
fi
md5sums=('SKIP'
         'f03d67965c0b747d230df09695447c14'
         '93117b3d99986e97628df58f2471c208'
         '82e5e527336b41281a582204db1f3457'
         '357dc26a802c34387512a42697846d16'
         '10cf85debdd07be719a35ca3bfb8ea64'
         '97115fa5fc6d8d63bdf13dc57fc20861'
         '9cb4a6717db959e082db75200e75d3e1')
sha256sums=('SKIP'
            '149e0cee002e59e0bb84543cf3cb099f108c08390392605e944daeb6594cbc29'
            '7ee7f467a1a747c5b5e02342904af9c24e84df4ca993541f1c4d0f113cab27aa'
            '965e51c91ad9851e2337aebcc0f517440c637c506f3a03948062e3d5ea129a83'
            'a78b05c0d8427a90eb5b4eb08af25309770c8379592bb0b8a863373128e6143f'
            'f1acc15d0fd0cb431f4bf6eac32d5e932e40ea1186fe78e074254d6d003957bb'
            '7048e51a89c99a5b6cac6d8ae416121264effa76da34dba5c0e7cf85519c8e98'
            '6efb71ac8086699da74dad6736c32ddb20db5dcabe167c49a8c3a650675eb84b')
_vcs=("${_vcs[@]%%::*}")
_vcs=("${_vcs[@]##*/}")
noextract=("${_vcs[@]}")

pkgver() {
  set -u
  cd "${_srcdir}"
  local _ver
  local _pyver="
import toml
new_toml_string = toml.load('Cargo.toml')
#print(new_toml_string.keys())
print(new_toml_string.get('package').get('version'))
"
  _ver="$(python -c "${_pyver}")"
  #_ver="$(sed -E -n -e 's/^  VERSION: "([^"]+)"$/\1/p' '.github/workflows/flutter-nightly.yml')" # '
  local _ver2
  _ver2="$(git describe --long --tags | sed -E -e 's/([^-]*-g)/r&/' -e 's/^.+r/r/g' -e 's/-/./g')"
  printf '%s.%s\n' "${_ver}" "${_ver2}" # Release version was added to tag.
  set +u
}

_vcpkg=(libvpx libyuv opus aom)

_prepare_vc() {
  msg '_prepare_vc'
  set -u
  if [ "${_opt_SYS_VCPKG}" -ne 0 ] && [ ! -d 'vcpkg' ]; then
    set +u; msg2 'Copy /opt/vcpkg'; set -u
    cp -pr '/opt/vcpkg' .
  fi
  mkdir -p 'vcpkg/downloads'
  cp -p "${_vcs[@]}" 'vcpkg/downloads'

  # Check commit ID
  if [ "${_opt_SYS_VCPKG}" -eq 0 ] && [ ! -z "${_opt_VCPKG_COMMIT_ID}" ]; then
    local _vcc
    local _pyvcc="
import yaml
import io
with open('rustdesk/.github/workflows/flutter-build.yml', 'r') as stream:
    data_loaded = yaml.safe_load(stream)
#print(data_loaded.get('env').keys())
print(data_loaded.get('env').get('VCPKG_COMMIT_ID'))
"
    _vcc="$(python -c "${_pyvcc}")"
    if [ "${_vcc}" != "${_opt_VCPKG_COMMIT_ID#*=}" ]; then
      echo "Flag package out of date: _opt_VCPKG_COMMIT_ID must be changed to ${_vcc}"
      set +u
      false
    fi
  fi

  local _vcpkgnew
  _vcpkgnew="$(sed -E -n -e '/Linux.+: vcpkg / s:^.+install ::p' 'rustdesk/README.md')"
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
      fi
    done
  )
  popd > /dev/null
  set +u
}

_flutter_check() {
  set +u; msg '_flutter_check'; set -u
  if [ "${_opt_FLUTTER}" -ne 0 ]; then
    local _FLUTTER_VERSION
    local _pyfv="
import yaml
import io
with open('.github/workflows/flutter-build.yml', 'r') as stream:
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
        printf 'Flutter version has changed to %s\n' "${_FLUTTER_VERSION}"
        set +u
        false
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
    _flutter_rust_bridge="$(python -c "${_pyfrb}")"
    if [ "$(vercmp "${_flutter_rust_bridge}" "${_FRBVER%.0}")" -gt 0 ]; then
      printf 'flutter_rust_bridge version has changed to %s\n' "${_flutter_rust_bridge}"
      set +u
      false
    fi
    set +u; msg2 "flutter_rust_bridge=${_flutter_rust_bridge}"; set -u
  fi
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
  set -u
  if [ "${_opt_FLUTTER}" -ne 0 ]; then
    if [ "${_opt_SYS_FLUTTER}" -ne 0 ]; then
      set +u; msg2 'Copy /opt/flutter'; set -u
      rm -rf 'flutter'
      cp -pr '/opt/flutter' .
    fi
    if [ ! -d 'flutter_rust_bridge' ]; then
      ln -s "flutter_rust_bridge-${_FRBVER}" 'flutter_rust_bridge'
      test -d 'flutter_rust_bridge'
    fi
  fi
  cd "${_srcdir}"
  _flutter_check
  _mod_py
  set +u
}

build() {
  msg2 'Build vcpkg'
  set -u
  if [ ! -x vcpkg/vcpkg ]; then
    vcpkg/bootstrap-vcpkg.sh
  fi
  export VCPKG_ROOT="${PWD}/vcpkg"
  nice vcpkg/vcpkg install "${_vcpkg[@]}"

  cd "${_srcdir}"
  if [ "${_opt_FLUTTER}" -eq 0 ]; then
    set +u; msg2 'Build rustdesk Sciter'; set -u
    if [ "${_opt_BUILD_PY}" -ne 0 ]; then
      nice ./build.py --hwcodec
    else
      set -x
      git checkout src/ui/common.tis
      python3 res/inline-sciter.py
      # RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
      nice cargo build --release --features 'inline,hwcodec'
      set +x
    fi
  else
    set +u; msg2 'Build rustdesk Flutter'; set -u
    set -x
    export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation: " | cut -d' ' -f4-)/include"
    export PATH="${srcdir}/flutter/bin:$PATH"
    dart pub global activate ffigen --version 5.0.1
    pushd "${srcdir}/flutter_rust_bridge/frb_codegen"; nice cargo install --path . ; popd
    pushd flutter ; flutter clean; flutter pub get ; popd
    ~/.cargo/bin/flutter_rust_bridge_codegen --rust-input ./src/flutter_ffi.rs --dart-output ./flutter/lib/generated_bridge.dart
    if [ "${_opt_BUILD_PY}" -ne 0 ]; then
      nice ./build.py --hwcodec --flutter
    else
      git checkout src/ui/common.tis
      nice cargo build --features hwcodec,flutter,flutter_texture_render --lib --release
      #ain't there no more
      #sed -i "s/ffi.NativeFunction<ffi.Bool Function(DartPort/ffi.NativeFunction<ffi.Uint8 Function(DartPort/g" flutter/lib/generated_bridge.dart
      pushd flutter
      nice flutter build linux --release # || :
      popd
    fi
    #pushd flutter && flutter build linux --release && popd
    set +x
  fi
  set +u
}

# This rebuilds the entire package
check_disabled() {
  cd "${_srcdir}"
  nice cargo test --release
}

package() {
  set -u
  cd "${_srcdir}"

  if [ "${_opt_FLUTTER}" -eq 0 ]; then
    # install rustdesk
    install -Dpm0755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
    install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}" '../libsciter-gtk.so'
  else
    install -d "${pkgdir}/usr/lib/"
    cp -pr 'flutter/build/linux/x64/release/bundle' "${pkgdir}/usr/lib/"
    mv "${pkgdir}/usr/lib/"{bundle,${_pkgname}}
    # False alarm from ldd
    if ! :; then
      install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/usr/bin/bash
LD_LIBRARY_PATH=/usr/lib/${_pkgname}/lib/
exec "/usr/lib/${_pkgname}/${_pkgname}" "\$@"
EOF
    else
      install -d "${pkgdir}/usr/bin/"
      ln -s -t "${pkgdir}/usr/bin/" "/usr/lib/${_pkgname}/${_pkgname}"
    fi
  fi

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
Icon=${_pkgname}.svg
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
