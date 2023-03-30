# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Ataraxy
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

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

set -u
_pkgname='rustdesk'
pkgname="${_pkgname}-git"
pkgver=1.2.0.r2672.gd7d49353
pkgrel=1
pkgdesc='Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk!'
arch=('x86_64')
url='https://github.com/rustdesk/rustdesk'
license=('GPL3')
_dpr=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'curl' 'libva' 'libvdpau' 'libappindicator-gtk3') # from res/PKGBUILD/depends
depends=("${_dpr[@]}" 'pulseaudio' 'gst-plugins-base-libs')
depends+=('hicolor-icon-theme' 'xdg-utils')
depends+=('xdg-user-dirs')
_mdp=('unzip' 'git' 'cmake' 'gcc' 'curl' 'wget' 'yasm' 'nasm' 'zip' 'make' 'pkg-config' 'clang') # from Readme.MD
makedepends=("${_mdp[@]}" 'rust' 'python')
makedepends+=('ninja') # vcpkg build can use the latest ninja
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
options=('!strip' '!makeflags')
install="${pkgname}.install"
source=("git+${url}.git")
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
  _FLUVER='3.7.0'
  _FRBVER='1.62.0'
  source+=(
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.0-stable.tar.xz"
    "flutter_rust_bridge-${_FRBVER}.tar.gz::https://github.com/fzyzcjy/flutter_rust_bridge/archive/refs/tags/v${_FRBVER}.tar.gz"
    #"flutter_rust_bridge-${_FRBVER}.tar.gz::https://pub.dev/packages/flutter_rust_bridge/versions/${_FRBVER}.tar.gz" # bad packaging
    #"git+https://github.com/SoLongAndThanksForAllThePizza/flutter_rust_bridge.git"
  )
fi
md5sums=('SKIP'
         'f03d67965c0b747d230df09695447c14'
         '93117b3d99986e97628df58f2471c208'
         '82e5e527336b41281a582204db1f3457'
         '357dc26a802c34387512a42697846d16'
         '10cf85debdd07be719a35ca3bfb8ea64'
         '9a844a9d6ec89c7da1e3027a5529411c'
         '2addb11472b902f6e4e4ecb5ec52941f')
sha256sums=('SKIP'
            '149e0cee002e59e0bb84543cf3cb099f108c08390392605e944daeb6594cbc29'
            '7ee7f467a1a747c5b5e02342904af9c24e84df4ca993541f1c4d0f113cab27aa'
            '965e51c91ad9851e2337aebcc0f517440c637c506f3a03948062e3d5ea129a83'
            'a78b05c0d8427a90eb5b4eb08af25309770c8379592bb0b8a863373128e6143f'
            'f1acc15d0fd0cb431f4bf6eac32d5e932e40ea1186fe78e074254d6d003957bb'
            '51160abac1d0d82b45647be6b2a6ed2d3827d51c3920f2c8ebf3ea8cebe6f484'
            'd4593e328665b2a7086e0cec82cabb92853e10934712c86224b0eb1024a8f3b6')
_vcs=("${_vcs[@]%%::*}")
_vcs=("${_vcs[@]##*/}")
noextract=("${_vcs[@]}")

pkgver() {
  set -u
  cd "${srcdir}/${_pkgname}"
  local _ver
  _ver="$(sed -E -n -e 's/^version = "([^"]+)"$/\1/p' 'Cargo.toml')" # '
  #_ver="$(sed -E -n -e 's/^  VERSION: "([^"]+)"$/\1/p' '.github/workflows/flutter-nightly.yml')" # '
  local _ver2
  _ver2="$(git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  _ver2="${_ver2#nightly.}"
  printf '%s.%s\n' "${_ver}" "${_ver2}"
  set +u
}

_prepare_vc() {
  set -u
  # rm -rf '/home/chris/.cache/vcpkg/archives'
  if [ "${_opt_SYS_VCPKG}" -ne 0 ] && [ ! -d 'vcpkg' ]; then
    set +u; msg2 'Copy /opt/vcpkg'; set -u
    cp -pr '/opt/vcpkg' .
  fi
  mkdir -p 'vcpkg/downloads'
  cp -p "${_vcs[@]}" 'vcpkg/downloads'

  # Check commit ID
  if [ "${_opt_SYS_VCPKG}" -eq 0 ] && [ ! -z "${_opt_VCPKG_COMMIT_ID}" ]; then
    local _vcc
    _vcc="$(sed -E -n -e 's/^.*VCPKG_COMMIT_ID: "([a-z0-9]+)"$/\1/p' 'rustdesk/.github/workflows/flutter-nightly.yml')" # '
    if [ "${_vcc}" != "${_opt_VCPKG_COMMIT_ID#*=}" ]; then
      echo "Flag package out of date: _opt_VCPKG_COMMIT_ID must be changed to ${_vcc}"
      set +u
      false
    fi
  fi
  set +u
}

# Same elements in same order
_dpr_check() {
  set -u
  pushd "${_pkgname}" > /dev/null
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

prepare() {
  _dpr_check
  _prepare_vc
  set -u
  if [ "${_opt_FLUTTER}" -ne 0 ]; then
    if [ ! -d 'flutter_rust_bridge' ]; then
      shopt -s failglob
      ln -s "flutter_rust_bridge-${_FRBVER}" 'flutter_rust_bridge'
      test -d 'flutter_rust_bridge'
      shopt -u failglob
    fi
  fi
  cd "${_pkgname}"

  if [ "${_opt_FLUTTER}" -ne 0 ]; then
    local _FLUTTER_VERSION
    _FLUTTER_VERSION="$(source <(grep -e 'FLUTTER_VERSION: ' '.github/workflows/flutter-nightly.yml' | sed -e 's/: /=/g'); printf '%s' "${FLUTTER_VERSION}")"
    if [ "${_FLUTTER_VERSION}" != "${_FLUVER}" ]; then
      printf 'Flutter version has changed to %s\n' "${_FLUTTER_VERSION}"
      set +u
      false
    fi
    local _flutter_rust_bridge
    _flutter_rust_bridge="$(source <(grep -e 'flutter_rust_bridge = "' 'Cargo.toml' | sed -e 's: = :=:g'); printf '%s' "${flutter_rust_bridge}")"
    if [ "$(vercmp "${_flutter_rust_bridge}" "${_FRBVER}")" -gt 0 ]; then
      printf 'flutter_rust_bridge version has changed to %s\n' "${_flutter_rust_bridge}"
      set +u
      false
    fi
  fi

  if [ "$(grep -c -F -e 'os.system' 'build.py')" -gt 1 ]; then
    local _lf=$'\n'
    local _nc='
def systemecho(cmd):
    print(cmd)
    os.system(cmd)

'
    _nc="${_nc//${_lf}/\\n}"
    sed -e '# echo all system commands' \
        -e 's:os.system:systemecho:g' \
        -e "s/^def get_version/${_nc}&/g" \
        -e '# Disable makepkg' \
        -e '/makepkg/ s:^:#:g' \
        -i 'build.py'
  fi
  set +u
}

build() {
  msg2 'Build vcpkg'
  set -u
  if [ ! -x vcpkg/vcpkg ]; then
    vcpkg/bootstrap-vcpkg.sh
  fi
  nice vcpkg/vcpkg install libvpx libyuv opus
  export VCPKG_ROOT="${PWD}/vcpkg"

  cd "${_pkgname}"
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
    pushd flutter ; flutter pub get ; popd
    ~/.cargo/bin/flutter_rust_bridge_codegen --rust-input ./src/flutter_ffi.rs --dart-output ./flutter/lib/generated_bridge.dart
    if [ "${_opt_BUILD_PY}" -ne 0 ]; then
      nice ./build.py --hwcodec --flutter
    else
      git checkout src/ui/common.tis
      nice cargo build --features hwcodec,flutter --lib --release
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
  cd "${_pkgname}"
  nice cargo test --release
}

package() {
  set -u
  cd "${_pkgname}"

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

  install -Dm0644 'res/32x32.png' "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm0644 'res/128x128.png' "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm0644 'res/128x128@2x.png' "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service" << EOF
[Unit]
Description=RustDesk
Requires=network.target
After=systemd-user-sessions.service

[Service]
Type=simple
ExecStart=/usr/bin/${_pkgname} --service
PIDFile=/var/run/${_pkgname}.pid
KillMode=mixed
TimeoutStopSec=30
User=root
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
EOF
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
  set +u
}
set +u
