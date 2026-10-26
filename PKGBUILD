# Maintainer: greenhandzdl <greenhandzdl@greenhandzdl.moe>
# CANN 9.2.0 toolkit bundle, minus the components shipped by
# asc-runtime-*, asc-devkit-*, asc-tools-* and asc-bisheng-bin.
pkgname=asc-toolkit-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='Huawei Ascend CANN Toolkit: GE, metadef, tbe-tik, AOE, pyACL, profiler, simulator and MindStudio tools'
arch=('x86_64' 'aarch64')
url='https://www.hiascend.com/developer/download/community/result?module=cann'
license=('custom:CANN-OSLA-2.0')
depends=('glibc' 'gcc-libs' 'bash' 'coreutils' 'python' 'asc-runtime')
optdepends=('asc-bisheng: Bisheng compiler driver (bisheng, hcc)'
            'asc-devkit: Ascend C development kit (tikcpp headers, device libs)'
            'asc-tools: operator project templates and kernel debug tools')
provides=('asc-toolkit')
conflicts=('asc-toolkit')
options=('!strip' '!debug' 'staticlibs')
makedepends=('unzip')

_zip="cann-toolkit-${pkgver}.zip"
source_x86_64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-toolkit_${pkgver}_linux-x86_64.zip")
source_aarch64=("${_zip}::https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%20${pkgver}/Ascend-cann-toolkit_${pkgver}_linux-aarch64.zip")
sha256sums_x86_64=('6d753badfcddcf13d1049906e40f0c26150ffc01d4ad226ad8c74f352cbf7442')
sha256sums_aarch64=('4c432c89b0561de21e2d9b2dd0bc7bf78d3461e4eab645c1613d72422b4bdbbf')
noextract=("${_zip}")
_libdir="${CARCH}-linux"
# ascendnpu-ir is the one unit whose x86_64 artifact says "x86", not "x86_64".
_npuir_arch=$CARCH
[[ $CARCH == x86_64 ]] && _npuir_arch=x86

# Every component bundled in the toolkit. The four below are packaged
# separately because equivalent open-source trees can be built from
# AtomGit (asc-runtime-git, asc-devkit-git, asc-tools-git).
_units=(
  cann-ge-executor_9.2.0_linux-${CARCH}.run
  cann-ge-compiler_9.2.0_linux-${CARCH}.run
  cann-metadef_9.2.0_linux-${CARCH}.run
  cann-opbase_9.2.0_linux-${CARCH}.run
  cann-oam-tools_9.2.0_linux-${CARCH}.run
  cann-aoe_9.2.0_linux-${CARCH}.run
  cann-ncs_9.2.0_linux-${CARCH}.run
  cann-graph-autofusion_9.2.0_linux-${CARCH}.run
  cann-tbe-tik_9.2.0_linux-${CARCH}.run
  cann-dflow-executor_9.2.0_linux-${CARCH}.run
  cann-acl-extend_9.2.0_linux-${CARCH}.run
  cann-pto-isa_9.2.0_linux-${CARCH}.run
  cann-pto-as_9.2.0_linux-${CARCH}.run
  cann-pypto_9.2.0_linux-${CARCH}.run
  cann-hcomm_9.2.0_linux-${CARCH}.run
  cann-simulator_9.2.0_linux-${CARCH}.run
  pyACL_9.2.0_linux-${CARCH}.run
  ascendnpu-ir_2.0.0_linux-${_npuir_arch}.run
  test-ops_9.2.0_linux.run
)
# MindStudio tools (mindstudio-*, ascend-mindstudio-operator-tools) use a
# different installer and install outside the CANN root; they are not part
# of this package.

_extract_run() {
  # makeself refuses to extract into an existing directory
  rm -rf "$2"
  bash "$1" --noexec --extract="$2"
}

prep_toolkit() {
  cd "$srcdir"
  [[ -f .prepared ]] && return
  rm -rf outer inner tk payloads
  mkdir -p outer inner
  unzip -q "$_zip" -d outer
  unzip -q "outer/Ascend-cann-toolkit_${pkgver}_linux-${CARCH}.zip" -d inner
  _extract_run "inner/Ascend-cann-toolkit_${pkgver}_linux-${CARCH}.run" "$srcdir/tk"
  mkdir -p payloads
  local u
  for u in "${_units[@]}"; do
    _extract_run "tk/run_package/$u" "$srcdir/payloads/${u%%_*}"
  done
  touch .prepared
}

prepare() {
  prep_toolkit
}

# Merge one component payload into the CANN root.
_merge_payload() {
  local src=$1 root=$2 e w
  [[ -d $src/$_libdir ]] && cp -a "$src/$_libdir/." "$root/$_libdir/"
  for e in "$src"/*; do
    [[ -e $e ]] || continue
    case ${e##*/} in
      "$_libdir"|set_env.sh) continue ;;
      lib)
        # only python wheels; the installer pip-installs them into site-packages
        for w in "$e"/*.whl; do [[ -e $w ]] && _install_wheel "$w" "$root"; done
        continue ;;
    esac
    cp -a "$e" "$root/"
  done
  # wheels kept in place (tools/*.whl) are also installed by upstream
  while IFS= read -r -d '' w; do _install_wheel "$w" "$root"; done \
    < <(find "$src" -name '*.whl' -print0)
}

_install_wheel() {
  bsdtar -xf "$1" -C "$2/python/site-packages"
}

package() {
  local root="$pkgdir/opt/ascend/cann-${pkgver}"
  local u
  install -d "$root/$_libdir" "$root/python/site-packages"
  for u in "${_units[@]}"; do
    _merge_payload "$srcdir/payloads/${u%%_*}" "$root"
  done

  # Root-level convenience links the upstream installer creates. Some units
  # (test-ops) ship a top-level lib64; fold it into $_libdir/lib64 so the
  # link can be created instead of nesting inside the real directory.
  # Root "asc" is declared only by the devkit component and owned by
  # asc-devkit-*.
  local l
  for l in bin conf devlib include lib64 pkg_inc; do
    [[ -d $root/$_libdir/$l ]] || continue
    if [[ -d $root/$l && ! -L $root/$l ]]; then
      mkdir -p "$root/$_libdir/$l"
      cp -a "$root/$l/." "$root/$_libdir/$l/"
      rm -rf "$root/$l"
    fi
    ln -s "$_libdir/$l" "$root/$l"
  done

  # Replay the official installer's symlink farm (each bundled unit's
  # filelist.csv "softlink" column): simulator chip aliases, tools/simulator,
  # compiler/python, lib64/stub arch aliases, etc. devlib arch aliases are
  # owned by asc-runtime-*; root arch links are created above.
  local csv f1 f2 f3 inst f5 f6 f7 f8 links target link
  for csv in "$root"/share/info/*/script/filelist.csv; do
    [[ -f $csv ]] || continue
    while IFS=, read -r f1 f2 f3 inst f5 f6 f7 f8 links _rest; do
      [[ $links == NA || -z $links || $links == softlink ]] && continue
      for l in ${links//;/ }; do
        case $l in
          asc|bin|conf|devlib|include|lib64|pkg_inc) continue ;;
          *-linux/devlib/*) continue ;;
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

  # $root/set_env.sh and the /etc/profile.d + /etc/fish/conf.d integration are
  # owned by asc-runtime-* (official layout: the runtime component ships the
  # canonical CANN root env script; every component payload carries an
  # identical copy). depends= on asc-runtime guarantees presence.
  ln -sfn "cann-${pkgver}" "$pkgdir/opt/ascend/cann"
  # The upstream installers build with a restrictive umask (750/640/440),
  # which leaves a root install unreadable to non-root users (bisheng
  # headers, cmake modules). Normalize to the Arch/AUR norm.
  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -perm /111 -exec chmod 755 {} +
  find "$pkgdir" -type f ! -perm /111 -exec chmod 644 {} +
}
