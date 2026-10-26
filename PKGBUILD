# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# asc-tools built from the AtomGit source tree.
# Building requires an installed CANN root (asc-toolkit-bin + asc-devkit).
pkgname=asc-tools-git
pkgver=9.2.0.r282.2575ba72
pkgrel=1
pkgdesc='Huawei Ascend CANN developer tools (cpudebug, npuchk, msobjdump) - source build'
arch=('x86_64' 'aarch64')
url='https://atomgit.com/cann/asc-tools'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash' 'python' 'asc-devkit' 'asc-toolkit')
provides=('asc-tools')
conflicts=('asc-tools')
makedepends=('git' 'cmake' 'gcc' 'make' 'python' 'ccache' 'asc-devkit' 'asc-toolkit')
options=('!strip' '!debug' 'staticlibs')

# Build against an installed CANN root; override for staged/CI trees.
_cann=${ASCEND_CANN_PATH:-/opt/ascend/cann-9.2.0}
_repo=asc-tools
_3rd=https://cann-3rd.obs.cn-north-4.myhuaweicloud.com
source=("$_repo::git+https://atomgit.com/cann/asc-tools.git#branch=9.2.0"
        "cann-cmake::git+https://gitcode.com/cann/cmake.git#tag=master-054"
        "makeself-release-2.5.0.tar.gz::$_3rd/makeself/makeself-release-2.5.0.tar.gz"
        "makeself-2.5.0.patch::$_3rd/makeself/makeself-2.5.0.patch")
sha256sums=('SKIP' 'SKIP'
  '705d0376db9109a8ef1d4f3876c9997ee6bed454a23619e1dbc03d25033e46ea'
  'abb9efe26f95db61ce927a7d046ea2c73ec908cec984ea6316892b4c8b11d784')

pkgver() {
  cd "$_repo"
  local v
  v=$(sed -n 's/.*set(ASC_TOOLS_VERSION "\([^"]*\)").*/\1/p' version.cmake)
  printf '%s.r%s.%s' "${v:-9.2.0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  local dir="$srcdir/3rdlib"
  mkdir -p "$dir/pkg"
  ln -sfn "$srcdir/cann-cmake" "$dir/cann-cmake"
  ln -sf "$srcdir/makeself-release-2.5.0.tar.gz" "$dir/"
  ln -sf "$srcdir/makeself-2.5.0.patch" "$dir/pkg/"
}

build() {
  cd "$_repo"
  # makepkg's x86 host flags must not leak into the bundled device toolchain
  # build; upstream supplies its own flags. Scrub any cached configure so
  # stale CMAKE_*_FLAGS can't be reused.
  rm -rf build build_out
  unset CFLAGS CXXFLAGS LDFLAGS
  export PATH="$_cann/bin:$PATH"
  export LD_LIBRARY_PATH="$_cann/lib64:$_cann/devlib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  bash build.sh --pkg --pkg-type=run --cann_path="$_cann" \
    --cann_3rd_lib_path="$srcdir/3rdlib" -j"$(nproc)"
}

package() {
  cd "$_repo"
  local root="$pkgdir/opt/ascend/cann-9.2.0" libdir="${CARCH}-linux"
  local run payload e w

  run=$(find . -name '*.run' -type f | head -1)
  [[ -n $run ]] || { echo 'no .run produced' >&2; return 1; }
  payload="$srcdir/payload-git"
  rm -rf "$payload"
  bash "$run" --noexec --extract="$payload"

  install -d "$root/$libdir" "$root/python/site-packages"
  [[ -d $payload/$libdir ]] && cp -a "$payload/$libdir/." "$root/$libdir/"
  for e in "$payload"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      "$libdir"|set_env.sh) continue ;;
      lib) continue ;;
    esac
    cp -a "$e" "$root/"
  done
  while IFS= read -r -d '' w; do
    bsdtar -xf "$w" -C "$root/python/site-packages"
  done < <(find "$payload" -name '*.whl' -print0)
  # owned by asc-toolkit-bin
  rm -f "$root/$libdir/conf/path.cfg" \
        "$root/$libdir/bin/setenv.bash"
  [[ -d $root/tools/cpudebug ]] && ln -sfn cpudebug "$root/tools/tikicpulib"

  # Replay the official installer's symlink farm (filelist.csv "softlink"
  # column): cpudebug arch/cmake aliases, profiler links, etc. Root arch
  # links are owned by asc-toolkit-bin, as is toolkit/tools (oam-tools).
  local csv f1 f2 f3 inst f5 f6 f7 f8 links l target link
  for csv in "$root"/share/info/*/script/filelist.csv; do
    [[ -f $csv ]] || continue
    while IFS=, read -r f1 f2 f3 inst f5 f6 f7 f8 links _rest; do
      [[ $links == NA || -z $links || $links == softlink ]] && continue
      for l in ${links//;/ }; do
        case $l in
          asc|bin|conf|devlib|include|lib64|pkg_inc|toolkit/tools) continue ;;
        esac
        target="$root/$inst" link="$root/$l"
        [[ -e $target ]] || continue
        [[ -e $link || -L $link ]] && continue
        mkdir -p "${link%/*}"
        ln -sfn "$(realpath --relative-to="${link%/*}" "$target")" "$link"
      done
    done < "$csv"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
