# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# CANN npu-runtime as shipped in the official 9.2.0 toolkit bundle.
# Prefer asc-runtime-git if you want the AtomGit source build.
pkgname=asc-runtime-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='Huawei Ascend CANN NPU runtime (ACL, GE client, HCCL, mmpa)'
arch=('x86_64' 'aarch64')
url='https://www.hiascend.com/developer/download/community/result?module=cann'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash')
provides=('asc-runtime')
conflicts=('asc-runtime')
options=('!strip' '!debug' 'staticlibs')
makedepends=('unzip')

_zip="cann-toolkit-${pkgver}.zip"
source_x86_64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-toolkit_${pkgver}_linux-x86_64.zip")
source_aarch64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-toolkit_${pkgver}_linux-aarch64.zip")
sha256sums_x86_64=('6d753badfcddcf13d1049906e40f0c26150ffc01d4ad226ad8c74f352cbf7442')
sha256sums_aarch64=('4c432c89b0561de21e2d9b2dd0bc7bf78d3461e4eab645c1613d72422b4bdbbf')
noextract=("${_zip}")
_libdir="${CARCH}-linux"

prepare() {
  cd "$srcdir"
  [[ -f .prepared ]] && return
  rm -rf outer inner tk payload
  mkdir -p outer inner
  unzip -q "$_zip" -d outer
  unzip -q "outer/Ascend-cann-toolkit_${pkgver}_linux-${CARCH}.zip" -d inner
  rm -rf tk; bash "inner/Ascend-cann-toolkit_${pkgver}_linux-${CARCH}.run" --noexec --extract="$srcdir/tk"
  rm -rf payload; bash "tk/run_package/cann-npu-runtime_${pkgver}_linux-${CARCH}.run" --noexec --extract="$srcdir/payload"
  touch .prepared
}

package() {
  local root="$pkgdir/opt/ascend/cann-${pkgver}"
  local src="$srcdir/payload" libdir="${CARCH}-linux" e

  install -d "$root/$libdir"
  [[ -d $src/$libdir ]] && cp -a "$src/$libdir/." "$root/$libdir/"
  for e in "$src"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      "$libdir"|set_env.sh) continue ;;
    esac
    cp -a "$e" "$root/"
  done
  # the canonical CANN root env script; officially shipped by the runtime
  # component (identical copy in every component payload)
  install -Dm755 "$src/set_env.sh" "$root/set_env.sh"
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

  install -Dm644 "$srcdir/tk/script/eula_en.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
