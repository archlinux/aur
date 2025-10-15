# Maintainer:

## options
: ${_use_sodeps:=false}

: ${_use_cuda:=false} # nvenc
: ${_cuda_gcc_version:=$(LC_ALL=C pacman -Si cuda | grep -Pom1 '^Depends On\s*:.*\bgcc\K[0-9]+\b')}

: ${_commit=}

_pkgname="apollo"
pkgname="$_pkgname-git"
pkgver=0.4.8.r2.gbf47fca
pkgrel=1
pkgdesc="A self-hosted GameStream server"
url="https://github.com/ClassicOldSong/Apollo"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'gtk3'
  'icu'
  'libayatana-appindicator'
  'libcap'
  'libdrm'
  'libevdev'
  'libnotify'
  'libpulse'
  'libva'
  'miniupnpc'
  'numactl'
  'openssl'
  'opus'
  'wayland'
)
makedepends=(
  "gcc${_cuda_gcc_version:-}"
  'boost'
  'cmake'
  'git'
  'ninja'
  'npm'
)
optdepends=(
  'intel-media-driver: Intel GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
)

if pacman -Qi cuda &> /dev/null; then
  _use_cuda=true
fi

if [[ "${_use_cuda::1}" == "t" ]]; then
  makedepends+=('cuda')
  checkdepends+=('nvidia-utils')
  optdepends+=(
    'cuda: Nvidia GPU encoding support'
    'nvidia-utils: Nvidia GPU encoding support'
  )
fi

provides=("$_pkgname")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  local i _unwanted=(
    packaging/linux/flatpak/deps/flatpak-builder-tools
    packaging/linux/flatpak/deps/shared-modules
    third-party/doxyconfig
    third-party/nv-codec-headers
  )

  for i in "${_unwanted[@]}"; do
    if [ -e "$i" ]; then
      git rm -r "$i"
    fi
  done

  git submodule update --init --depth 1
  git -C third-party/moonlight-common-c submodule update --init --depth 1

  ## fix some names
  sed -E -e 's&\bsunshine\b&"'${_pkgname}'"&g' -i cmake/prep/init.cmake cmake/packaging/unix.cmake
  sed -E -e '/set\(PROJECT_FQDN/s&^.*$&set(PROJECT_FQDN "'${_pkgname}'")&' -i cmake/compile_definitions/linux.cmake
  sed -E -e 's&\bsunshine\b&'${_pkgname}'&g' -i cmake/targets/common.cmake

  ## disable unwanted macros
  sed 's&macro(find_package)&macro(_disable_find_package)&' -i cmake/macros/common.cmake

  ## allow any version of boost
  sed -E 's&(Boost CONFIG) \S+ EXACT\b&\1&' -i cmake/dependencies/Boost_Sunshine.cmake
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  export BRANCH="master"
  export BUILD_VERSION="${pkgver%%.r*}"
  export COMMIT="$(git -C "$_pkgsrc" rev-parse HEAD)"

  export CC="gcc${_cuda_gcc_version:+-$_cuda_gcc_version}"
  export CXX="g++${_cuda_gcc_version:+-$_cuda_gcc_version}"

  export CUDA_PATH=/opt/cuda
  export NVCC_CCBIN="/usr/bin/g++${_cuda_gcc_version:+-$_cuda_gcc_version}"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_DOCS=OFF
    -DBUILD_TESTS=OFF
    -Wno-dev

    -DSUNSHINE_ASSETS_DIR="share/$_pkgname"
    -DSUNSHINE_EXECUTABLE_PATH="/usr/bin/$_pkgname"

    -DSUNSHINE_PUBLISHER_NAME="AUR"
    -DSUNSHINE_PUBLISHER_WEBSITE="https://aur.archlinux.org/packages/$pkgname"
    -DSUNSHINE_PUBLISHER_ISSUE_URL="https://aur.archlinux.org/packages/$pkgname"

    -DSUNSHINE_ENABLE_CUDA=ON
    -DSUNSHINE_ENABLE_DRM=ON
    -DSUNSHINE_ENABLE_TRAY=ON
    -DSUNSHINE_ENABLE_VAAPI=ON
    -DSUNSHINE_ENABLE_WAYLAND=ON
    -DSUNSHINE_ENABLE_X11=ON
  )

  if [[ "${_use_cuda::1}" == "t" ]]; then
    _cmake_options+=(-DCUDA_FAIL_ON_MISSING=ON)
  else
    _cmake_options+=(-DCUDA_FAIL_ON_MISSING=OFF)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  depends+=(
    'avahi'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'mesa' # libgbm
  )

  if [[ "$_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libicuuc.so'     # icu
      'libminiupnpc.so' # miniupnpc
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build

  # unwanted
  rm -rf "$pkgdir/usr/lib/systemd"
  rm -rf "$pkgdir/usr/share/applications"
  rm -rf "$pkgdir/usr/share/metainfo"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$_pkgname.service" << END
[Unit]
Description=$pkgdesc
StartLimitIntervalSec=500
StartLimitBurst=5

[Service]
# Avoid starting ${_pkgname^} before the desktop is fully initialized.
ExecStartPre=/bin/sleep 5
ExecStart=/usr/bin/apollo

Restart=on-failure
RestartSec=5s

[Install]
WantedBy=xdg-desktop-autostart.target
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=$pkgdesc
Exec=/usr/bin/env systemctl start --user $_pkgname
Icon=$_pkgname
Categories=RemoteAccess;Network;
Keywords=gamestream;stream;moonlight;remote play;
Actions=RunInTerminal;

[Desktop Action RunInTerminal]
Name=Run in Terminal
Exec=$_pkgname
Terminal=true
Icon=application-x-executable
END
}
