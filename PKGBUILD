# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# Bisheng (毕昇) compiler for Ascend C. Closed source: extracted from the
# official CANN 9.2.0 toolkit bundle, hence -bin.
pkgname=asc-bisheng-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='Huawei Bisheng C/C++ compiler for Ascend (ccec_compiler, LLVM based)'
arch=('x86_64' 'aarch64')
url='https://www.hiascend.com/developer/download/community/result?module=cann'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash' 'asc-runtime')
provides=('asc-bisheng')
conflicts=('asc-bisheng')
options=('!strip' '!debug' 'staticlibs')
makedepends=('unzip')

_zip="cann-toolkit-${pkgver}.zip"
_run="Ascend-cann-toolkit_${pkgver}_linux-${CARCH}.run"
_unit="cann-bisheng-compiler_${pkgver}_linux-${CARCH}.run"
source_x86_64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-toolkit_${pkgver}_linux-x86_64.zip")
source_aarch64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-toolkit_${pkgver}_linux-aarch64.zip")
sha256sums_x86_64=('6d753badfcddcf13d1049906e40f0c26150ffc01d4ad226ad8c74f352cbf7442')
sha256sums_aarch64=('4c432c89b0561de21e2d9b2dd0bc7bf78d3461e4eab645c1613d72422b4bdbbf')
noextract=("${_zip}")
_libdir="${CARCH}-linux"

_extract_run() {
  rm -rf "$2"
  bash "$1" --noexec --extract="$2"
}

prepare() {
  cd "$srcdir"
  [[ -f .prepared ]] && return
  rm -rf outer inner tk payload
  mkdir -p outer inner
  unzip -q "$_zip" -d outer
  unzip -q "outer/Ascend-cann-toolkit_${pkgver}_linux-${CARCH}.zip" -d inner
  _extract_run "inner/${_run}" "$srcdir/tk"
  _extract_run "tk/run_package/${_unit}" "$srcdir/payload"
  touch .prepared
}

package() {
  local root="$pkgdir/opt/ascend/cann-${pkgver}"
  local src="$srcdir/payload" libdir="${CARCH}-linux" e

  install -d "$root/$libdir/bin"
  [[ -d $src/$libdir ]] && cp -a "$src/$libdir/." "$root/$libdir/"
  for e in "$src"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      # owned by asc-toolkit-bin / asc-runtime-*
      "$libdir"|set_env.sh) continue ;;
    esac
    cp -a "$e" "$root/"
  done
  # identical copies shipped by every component; keep the runtime copy
  rm -f "$root/$libdir/conf/path.cfg" \
        "$root/$libdir/bin/setenv.bash"

  ln -sfn ../tools/bisheng_compiler "$root/$libdir/ccec_compiler"
  ln -sfn bisheng_compiler "$root/tools/ccec_compiler"
  local b
  for b in bisheng bisheng-tune; do
    [[ -x $root/tools/bisheng_compiler/bin/$b ]] && \
      ln -sfn "../../tools/bisheng_compiler/bin/$b" "$root/$libdir/bin/$b"
  done

  # Replay the official installer's symlink farm (filelist.csv "softlink"
  # column), e.g. toolkit/toolchain/hcc. Root arch links are owned by
  # asc-toolkit-bin; setenv.bash is skipped because the root set_env.sh it
  # targets is owned by asc-runtime-*.
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

  install -Dm644 "$srcdir/tk/script/eula_en.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # No profile.d here: the official CANN set_env.sh (shipped by asc-runtime-*,
  # sourced via /etc/profile.d/ascend-cann.sh) already puts
  # tools/ccec_compiler/bin on PATH, and ccec_compiler links to
  # bisheng_compiler above.
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
