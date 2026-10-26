# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# CANN NPU runtime built from the AtomGit source tree.
pkgname=asc-runtime-git
pkgver=9.2.0.r3025.0d259c501b
pkgrel=1
pkgdesc='Huawei Ascend CANN NPU runtime (ACL, GE client, HCCL, mmpa) - source build'
arch=('x86_64' 'aarch64')
url='https://atomgit.com/cann/runtime'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash')
provides=('asc-runtime')
conflicts=('asc-runtime')
makedepends=('git' 'cmake' 'gcc' 'make' 'gperf' 'python' 'ccache' 'autoconf' 'libtool')
options=('!strip' '!debug' 'staticlibs')

_repo=runtime
_3rd=https://cann-3rd.obs.cn-north-4.myhuaweicloud.com
# Third-party archives the upstream build would download at configure time.
# Declaring them here keeps the build reproducible and offline-capable; they
# are staged into upstream's --cann_3rd_lib_path cache in prepare().
_3rd_srcs=(
  "makeself-release-2.5.0.tar.gz::$_3rd/makeself/makeself-release-2.5.0.tar.gz"
  "makeself-2.5.0.patch::$_3rd/makeself/makeself-2.5.0.patch"
  "json-3.12.0.tar.gz::$_3rd/json/json-3.12.0.tar.gz"
  "libboundscheck-v1.1.16.tar.gz::$_3rd/libboundscheck/libboundscheck-v1.1.16.tar.gz"
  "protobuf-25.1.tar.gz::$_3rd/protobuf/protobuf-25.1.tar.gz"
  "boost_1_87_0.tar.gz::$_3rd/boost/boost_1_87_0.tar.gz"
  "mockcpp-2.7.tar.gz::$_3rd/mockcpp/mockcpp-2.7.tar.gz"
  "mockcpp-2.7-h5.patch::https://gitcode.com/cann-src-third-party/mockcpp/releases/download/v2.7-h5/mockcpp-2.7-h5.patch"
  "googletest-1.14.0.tar.gz::$_3rd/googletest/googletest-1.14.0.tar.gz"
  "eigen-5.0.0.tar.gz::$_3rd/eigen/eigen-5.0.0.tar.gz"
  "libseccomp-2.5.4.tar.gz::$_3rd/libseccomp/libseccomp-2.5.4.tar.gz"
  "abseil-cpp-20230802.1.tar.gz::$_3rd/abseil-cpp/abseil-cpp-20230802.1.tar.gz"
  "backport-CVE-2025-0838.patch::https://gitcode.com/cann-src-third-party/abseil-cpp/releases/download/20230802.1-h0/backport-CVE-2025-0838.patch"
)
source=("$_repo::git+https://atomgit.com/cann/runtime.git#branch=9.2.0"
        "cann-cmake::git+https://gitcode.com/cann/cmake.git#tag=master-054"
        "${_3rd_srcs[@]}")
sha256sums=('SKIP' 'SKIP'
  '705d0376db9109a8ef1d4f3876c9997ee6bed454a23619e1dbc03d25033e46ea'
  'abb9efe26f95db61ce927a7d046ea2c73ec908cec984ea6316892b4c8b11d784'
  '4b92eb0c06d10683f7447ce9406cb97cd4b453be18d7279320f7b2f025c10187'
  'aee8368ef04a42a499edd5bfebce529e7f32dd138bfed383d316e48af4e45d2c'
  '9bd87b8280ef720d3240514f884e56a712f2218f0d693b48050c836028940a42'
  'f55c340aa49763b1925ccf02b2e83f35fdcf634c9d5164a2acb87540173c741d'
  '73ab0a8b6d1052361c2cebd85e022c0396f928d2e077bf132790ae3be766f603'
  '65a2aac5e8ffe1a0eb983e4455972ef70b9850d4283ea7d4cc83e3cb97e98c5e'
  '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
  '93f7f0462988b934e632a9fba58af55192ffceae38e8f46233f4f62cb1e79370'
  '96bbadb4384716272a6d2be82801dc564f7aab345febfe9b698b70fc606e3f75'
  '987ce98f02eefbaf930d6e38ab16aa05737234d7afbab2d5c4ea7adbe50c28ed'
  'a4e4ef6fc4f4c1ed871a3472c5e650068aaadaad2adfef2c8ccb00918bb36d8c')

pkgver() {
  cd "$_repo"
  local v
  v=$(sed -n 's/.*set_cann_package(npu-runtime VERSION "\([^"]*\)").*/\1/p' version.cmake)
  printf '%s.r%s.%s' "${v:-9.2.0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # splay the downloaded archives into upstream's cache layout
  local dir="$srcdir/3rdlib"
  mkdir -p "$dir/pkg" "$dir/abseil-cpp"
  ln -sfn "$srcdir/cann-cmake" "$dir/cann-cmake"
  ln -sf "$srcdir/makeself-2.5.0.patch" "$dir/pkg/"
  ln -sf "$srcdir/mockcpp-2.7-h5.patch" "$dir/"
  ln -sf "$srcdir/abseil-cpp-20230802.1.tar.gz" "$dir/abseil-cpp/"
  ln -sf "$srcdir/backport-CVE-2025-0838.patch" "$dir/abseil-cpp/"
  local f
  for f in makeself-release-2.5.0.tar.gz json-3.12.0.tar.gz \
           libboundscheck-v1.1.16.tar.gz protobuf-25.1.tar.gz \
           boost_1_87_0.tar.gz mockcpp-2.7.tar.gz googletest-1.14.0.tar.gz \
           eigen-5.0.0.tar.gz libseccomp-2.5.4.tar.gz; do
    ln -sf "$srcdir/$f" "$dir/"
  done
}

build() {
  cd "$_repo"
  # stale caches hide flag changes (host-only vs host+device) and can skip
  # configure steps that the previous build already satisfied
  rm -rf build build_out
  # Arch's host flags (gcc, -march=x86-64, -fcf-protection) must not leak
  # into the aarch64 device cross-build that the same make invocation
  # launches; upstream supplies its own flags for both sides.
  unset CFLAGS CXXFLAGS LDFLAGS
  # gcc 16 false-positive on the COW string headers under upstream -Werror
  export CXXFLAGS="-Wno-error=maybe-uninitialized -Wno-maybe-uninitialized"
  # Upstream builds the device-side libs (lib64/device) only when
  # TOOLCHAIN_DIR names the CANN device compiler; without it the build is
  # host-only. asc-devkit-git's device build links against those libs, so
  # use the installed toolchain when there is one.
  local cann=/opt/ascend/cann-9.2.0 hcc=/opt/ascend/cann-9.2.0/toolkit/toolchain/hcc
  local extra=()
  if [[ -x $hcc/bin/aarch64-target-linux-gnu-g++ ]]; then
    export TOOLCHAIN_DIR=$hcc
    extra=(--ascend_install_path="$cann")
  fi
  bash build.sh --pkg "${extra[@]}" \
    --cann_3rd_lib_path="$srcdir/3rdlib" -j"$(nproc)"
}

package() {
  cd "$_repo"
  local root="$pkgdir/opt/ascend/cann-9.2.0" libdir="${CARCH}-linux"
  local run payload e

  run=$(find . -name '*.run' -type f | head -1)
  [[ -n $run ]] || { echo 'no .run produced' >&2; return 1; }
  payload="$srcdir/payload-git"
  rm -rf "$payload"
  bash "$run" --noexec --extract="$payload"

  install -d "$root/$libdir"
  [[ -d $payload/$libdir ]] && cp -a "$payload/$libdir/." "$root/$libdir/"
  for e in "$payload"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      "$libdir"|set_env.sh) continue ;;
    esac
    cp -a "$e" "$root/"
  done
  # the canonical CANN root env script; officially shipped by the runtime
  # component (identical copy in every component payload)
  install -Dm755 "$payload/set_env.sh" "$root/set_env.sh"
  # also shipped by asc-toolkit-bin (ge-executor); the base package owns them
  rm -f "$root/$libdir/conf/path.cfg" \
        "$root/$libdir/lib64/libhost_ascend_protobuf.a"

  # Replay the official installer's symlink farm (filelist.csv "softlink"
  # column): devlib arch aliases, runtime/include/acl, include/driver, etc.
  # Root arch links are owned by asc-toolkit-bin.
  local csv f1 f2 f3 inst f5 f6 f7 f8 links l target link
  for csv in "$root"/share/info/*/script/filelist.csv; do
    [[ -f $csv ]] || continue
    while IFS=, read -r f1 f2 f3 inst f5 f6 f7 f8 links _rest; do
      [[ $links == NA || -z $links || $links == softlink ]] && continue
      for l in ${links//;/ }; do
        case $l in
          asc|bin|conf|devlib|include|lib64|pkg_inc) continue ;;
        esac
        target="$root/$inst" link="$root/$l"
        [[ -e $target ]] || continue
        [[ -e $link || -L $link ]] && continue
        mkdir -p "${link%/*}"
        ln -sfn "$(realpath --relative-to="${link%/*}" "$target")" "$link"
      done
    done < "$csv"
  done

  # Shell integration is owned by the runtime (the base component every other
  # CANN package depends on): bash gets the vendor set_env.sh, fish gets a
  # native port because it never reads /etc/profile.d.
  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/ascend-cann.sh" <<'PROFILE'
# Huawei Ascend CANN 9.2.0
if [ -f /opt/ascend/cann-9.2.0/set_env.sh ]; then
  . /opt/ascend/cann-9.2.0/set_env.sh
  # Driverless hosts (simulator): the vendor script appends ".../devlib", but
  # libascend_hal.so actually lives in devlib/<arch>. Append that too, last,
  # so it never shadows the real lib64 or driver copies.
  case ":$LD_LIBRARY_PATH:" in
    *:/opt/ascend/cann-9.2.0/devlib:*)
      case ":$LD_LIBRARY_PATH:" in
        *:/opt/ascend/cann-9.2.0/devlib/*:*) ;;
        *) export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/ascend/cann-9.2.0/devlib/$(uname -m)" ;;
      esac
      ;;
  esac
fi
PROFILE

  install -Dm644 /dev/stdin "$pkgdir/etc/fish/conf.d/ascend-cann.fish" <<'FISH'
# Huawei Ascend CANN 9.2.0 - fish port of /opt/ascend/cann-9.2.0/set_env.sh
set -l cann /opt/ascend/cann-9.2.0
set -l arch (uname -m)

# Re-sourcing must not duplicate entries; drop stale CANN paths first, like
# the vendor script's remove_env.
if set -q PATH
    set -gx PATH (string match -v -- '/opt/ascend/cann*' $PATH)
end
if set -q LD_LIBRARY_PATH
    set -gx LD_LIBRARY_PATH (string match -v -- '/opt/ascend/cann*' $LD_LIBRARY_PATH)
end
if set -q PYTHONPATH
    set -gx PYTHONPATH (string match -v -- '/opt/ascend/cann*' $PYTHONPATH)
end
if set -q CMAKE_PREFIX_PATH
    set -gx CMAKE_PREFIX_PATH (string match -v -- '/opt/ascend/cann*' $CMAKE_PREFIX_PATH)
end

set -gx ASCEND_HOME_PATH $cann
set -gx ASCEND_TOOLKIT_HOME $cann
set -gx ASCEND_OPP_PATH $cann/opp
set -gx ASCEND_AICPU_PATH $cann
set -gx TOOLCHAIN_HOME $cann/toolkit

contains -- /sbin $PATH; or set -gx PATH $PATH /sbin

set -gx PATH $cann/bin \
    $cann/tools/ccec_compiler/bin \
    $cann/tools/profiler/bin \
    $cann/tools/ascend_system_advisor/asys \
    $cann/tools/show_kernel_debug_data \
    $cann/tools/msobjdump \
    $PATH

set -gx LD_LIBRARY_PATH $cann/lib64 \
    $cann/lib64/plugin/opskernel \
    $cann/lib64/plugin/nnengine \
    $cann/opp/built-in/op_impl/ai_core/tbe/op_tiling/lib/linux/$arch \
    /usr/local/Ascend/driver/lib64 \
    /usr/local/Ascend/driver/lib64/common \
    /usr/local/Ascend/driver/lib64/driver \
    $LD_LIBRARY_PATH

# Driverless hosts (simulator): the CPU hal lives in devlib/<arch>; append it
# last so it never shadows the real lib64 or driver copies.
set -l has_driver 0
if test -f /etc/ascend_install.info
    set has_driver 1
else if test -e /usr/local/Ascend/driver/lib64/libascend_hal.so
    set has_driver 1
else if command -q ldconfig; and ldconfig -p 2>/dev/null | string match -q -- '*libascend_hal.so*'
    set has_driver 1
end
if test $has_driver -eq 0
    set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH $cann/devlib $cann/devlib/$arch
end

set -gx PYTHONPATH $cann/python/site-packages \
    $cann/opp/built-in/op_impl/ai_core/tbe \
    $PYTHONPATH

set -gx CMAKE_PREFIX_PATH $cann/lib64/cmake \
    $cann/toolkit/tools/tikicpulib/lib/cmake \
    $CMAKE_PREFIX_PATH
FISH

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
