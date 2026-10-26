# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# CANN asc-tools as shipped in the official 9.2.0 toolkit bundle.
# Prefer asc-tools-git if you want the AtomGit source build.
pkgname=asc-tools-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='Huawei Ascend CANN developer tools (cpudebug, msobjdump, operator_cmp, show_kernel_debug_data)'
arch=('x86_64' 'aarch64')
url='https://www.hiascend.com/developer/download/community/result?module=cann'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash' 'python' 'asc-devkit' 'asc-toolkit')
provides=('asc-tools')
conflicts=('asc-tools')
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
  rm -rf payload; bash "tk/run_package/cann-asc-tools_${pkgver}_linux-${CARCH}.run" --noexec --extract="$srcdir/payload"
  touch .prepared
}

package() {
  local root="$pkgdir/opt/ascend/cann-${pkgver}"
  local src="$srcdir/payload" libdir="${CARCH}-linux" e w

  install -d "$root/$libdir" "$root/python/site-packages"
  [[ -d $src/$libdir ]] && cp -a "$src/$libdir/." "$root/$libdir/"
  for e in "$src"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      "$libdir"|set_env.sh) continue ;;
      lib)
        for w in "$e"/*.whl; do
          [[ -e $w ]] && bsdtar -xf "$w" -C "$root/python/site-packages"
        done
        continue ;;
    esac
    cp -a "$e" "$root/"
  done
  while IFS= read -r -d '' w; do
    bsdtar -xf "$w" -C "$root/python/site-packages"
  done < <(find "$src" -name '*.whl' -print0)
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

  install -Dm644 "$srcdir/tk/script/eula_en.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
