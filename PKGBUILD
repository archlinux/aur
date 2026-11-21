# Maintainer: Raul Dias <raul@dias.com.br>
#
# A local Arch package of the NVIDIA Optical Flow SDK, built from the user's
# OWN download, so that several projects on one machine share one
# installation. For personal use: each user accepts NVIDIA's licence and
# downloads the SDK from NVIDIA's developer site themselves, as described
# in https://github.com/rsd/omarchy-nvidia-sdks/blob/main/docs/optical-flow.md
# This repository holds only the recipe. The built package contains NVIDIA
# software: keep it on your own machine and never redistribute it (no
# repository, no AUR binary, no release, no sharing).
#
# This copy is generated for the AUR by scripts/aur.sh of
# https://github.com/rsd/omarchy-nvidia-sdks (documentation:
# https://github.com/rsd/omarchy-nvidia-sdks/blob/117dce47590cf44943e73811b6bf6b5462c173b3/README.md).
# The recipe's helpers (selection.sh, assemble.sh, configure.sh, the
# os-release shim's source, ...) come from that repository at the commit
# pinned in source=(); makepkg checks it out into src/omarchy-nvidia-sdks.
# "This directory" below is the directory of this PKGBUILD: selection.conf
# is read there. configure.sh is
# src/omarchy-nvidia-sdks/nvidia-optical-flow/configure.sh, which
# `makepkg -o --noprepare` fetches; run it from this directory with
# --conf selection.conf, as below, so that it writes the selection.conf
# this PKGBUILD reads. The environment variables work without it.
#
# Build-time inputs, each from the environment variable of that name, else
# from selection.conf in this directory (written by configure.sh), else the
# default. prepare() prints every value and where it came from.
#   NVIDIA_OF_SRC     the SDK zip (optical_flow_sdk_5.0.7.zip), a directory
#                     holding exactly one optical_flow_sdk_*.zip, or an
#                     extracted SDK tree; an absolute path (default: this
#                     directory).
#   NVIDIA_OF_SHA256  the SHA-256 the zip must have. NVIDIA publishes no
#                     checksum: `configure.sh --src <zip> --write` records
#                     the one of your download in selection.conf (SHA256=),
#                     which applies while NVIDIA_OF_SRC is that same path. A
#                     zip without a recorded checksum, or with another one,
#                     stops the build; an extracted tree has none.
# selection.conf is parsed as KEY=value lines by selection.sh, never
# sourced; it is read in prepare() only, so `makepkg --printsrcinfo` does
# not depend on it. The zip is extracted with bsdtar into $srcdir, never
# into the source.
#
# Build (in the directory of this PKGBUILD), e.g.:
#   src/omarchy-nvidia-sdks/nvidia-optical-flow/configure.sh --conf selection.conf --src ~/Downloads/optical_flow_sdk_5.0.7.zip --write
#   makepkg -f
# Install the result with:  sudo pacman -U nvidia-optical-flow-sdk-local-*.pkg.tar*
#
# It installs the SDK's headers, the prebuilt FRUC library (NvFRUC or
# NvOFFRUC, under the name it is shipped with) with the CUDA runtime it
# bundles (when the download has them), and the samples and NvOFTracker as
# source trees (documentation; not built) under
# /opt/nvidia/optical-flow, and an environment file,
# /usr/share/nvidia-optical-flow/nvidia-optical-flow.env, that a consumer
# loads explicitly. Nothing in /usr/include, /usr/lib or /etc, and nothing
# global: the bundled CUDA runtime would otherwise shadow the system's. The
# Optical Flow API itself is libnvidia-opticalflow.so, part of the driver
# (nvidia-utils), which an application loads at run time.
#
# shellcheck source-path=SCRIPTDIR

pkgname=nvidia-optical-flow-sdk-local
pkgver=5.0.7
pkgrel=2
pkgdesc="NVIDIA Optical Flow SDK, packaged from the user's own download (personal use, not redistributable)"
arch=('x86_64')
url='https://developer.nvidia.com/opticalflow/download'
license=('LicenseRef-NVIDIA-DesignWorks' 'MIT OR Apache-2.0')  # the NVIDIA SDK; this repository's documentation
depends=(
  'nvidia-utils'  # libnvidia-opticalflow.so and libcuda.so.1 (the driver, 525.85.05 or newer; Turing or newer GPU)
)
makedepends=(
  'libarchive'    # bsdtar, which reads and extracts the zip
)
provides=("nvidia-optical-flow-sdk=$pkgver")
# Keep the SDK byte-identical.
options=('!strip' '!debug' 'staticlibs')
# Nothing of NVIDIA's is downloaded: the SDK comes from $NVIDIA_OF_SRC.
# The recipe's helpers (its scripts, the shim's source, the documents it
# installs): https://github.com/rsd/omarchy-nvidia-sdks at the commit
# below, fetched by makepkg (source=). Relative to $srcdir, where makepkg
# runs every function: $srcdir is not set yet when makepkg reads this file.
_repo=omarchy-nvidia-sdks
_commit=117dce47590cf44943e73811b6bf6b5462c173b3
source=()

# The helpers, pinned: makepkg verifies the checksum of `git archive` of the
# commit.
source+=("omarchy-nvidia-sdks::git+https://github.com/rsd/omarchy-nvidia-sdks.git#commit=$_commit")
sha256sums+=('21e9de83464c9c5d5729b9ee7317576e9b0e79af22cf671c42265ba9a89a5007')
makedepends+=('git')

_root=/opt/nvidia/optical-flow

prepare() {
  # The selection: environment variable > selection.conf > default. The
  # helper only defines functions; it parses selection.conf, never sources it.
  # shellcheck source=selection.sh
  . "$_repo/nvidia-optical-flow/selection.sh"
  nvidia_of_resolve "$startdir/selection.conf" "$startdir" || return 1
  echo "Optical Flow SDK selection:"
  nvidia_of_print_resolved
  rm -rf -- "$srcdir/of" "$srcdir/of-zip" "$srcdir/of.state"
  # of.state records the packaged components for package(); it stays
  # outside the packaged tree.
  bash "$_repo/nvidia-optical-flow/assemble.sh" --conf "$startdir/selection.conf" --src "$nvidia_of_src" --dest "$srcdir/of" \
    --work "$srcdir/of-zip" --version "$pkgver" --sha256 "$nvidia_of_sha256" \
    --state "$srcdir/of.state"
}

package() {
  # The SDK tree, as assembled (reflinks where the filesystem allows).
  # fakeroot makes it root-owned; directories 755, files at least 644.
  install -d "$pkgdir/opt/nvidia"
  cp -a --reflink=auto -- "$srcdir/of" "$pkgdir$_root"
  chmod -R u+rwX,go+rX,go-w -- "$pkgdir$_root"

  local key value features='' fruc_lib=''
  while IFS='=' read -r key value; do
    case $key in
      FEATURES) features=$value ;;
      FRUC_LIB) fruc_lib=$value ;;
    esac
  done <"$srcdir/of.state"
  if [[ ! $features =~ ^api(,fruc)?(,tracker-src)?(,samples)?$ || ! $fruc_lib =~ ^((lib)?Nv(OF)?FRUC\.so)?$ ]]; then
    echo "of.state: unexpected features '$features' or FRUC library '$fruc_lib'" >&2
    return 1
  fi
  local libpath=''
  if [[ ,$features, == *,fruc,* ]]; then
    [[ -n $fruc_lib && -e $pkgdir$_root/fruc/lib/$fruc_lib ]] ||
      { echo "fruc was not assembled" >&2; return 1; }
    libpath=$_root/fruc/lib
  fi

  # The environment file: KEY=value lines, no quotes, no expansion, so it
  # works as a systemd EnvironmentFile= and with `set -a; . file; set +a`.
  # Without FRUC there is no library directory, and the file has neither
  # NVIDIA_OF_LIBRARY_PATH nor LD_LIBRARY_PATH: an empty LD_LIBRARY_PATH=
  # would replace the consumer's, and a later "$LD_LIBRARY_PATH:/x" would
  # put the current directory on the search path.
  local libkeys=''
  [[ -z $libpath ]] || libkeys="NVIDIA_OF_LIBRARY_PATH=$libpath
LD_LIBRARY_PATH=$libpath
"
  local envfile="$pkgdir/usr/share/nvidia-optical-flow/nvidia-optical-flow.env"
  install -d "${envfile%/*}"
  cat >"$envfile" <<EOF
# NVIDIA Optical Flow SDK ($pkgname $pkgver-$pkgrel).
# Documentation: /usr/share/doc/$pkgname/README.md
# Load it for one program only (systemd EnvironmentFile=, or
#   set -a; . /usr/share/nvidia-optical-flow/nvidia-optical-flow.env; set +a
# in a script); never from a login profile. The Optical Flow API is
# libnvidia-opticalflow.so from the driver: the application loads it with
# dlopen, and needs only NVIDIA_OF_INCLUDE_DIR to build. The library path
# is the FRUC library with the CUDA runtime it bundles (fruc/lib); the
# NVIDIA_OF_LIBRARY_PATH and LD_LIBRARY_PATH lines are absent when FRUC is
# not packaged. FRUC's header is in \$NVIDIA_OF_ROOT/fruc/include.
# NVIDIA_OF_FEATURES lists the packaged components (api, fruc, tracker-src,
# samples). A program that loads several such files gets the last file's
# LD_LIBRARY_PATH: it builds LD_LIBRARY_PATH itself from the
# NVIDIA_*_LIBRARY_PATH and MAXINE_*_LIBRARY_PATH keys.
NVIDIA_OF_ROOT=$_root
NVIDIA_OF_INCLUDE_DIR=$_root/include
${libkeys}NVIDIA_OF_FEATURES=$features
EOF
  chmod 644 "$envfile"
  # Every key as specified, and no quote, $, space, LD_PRELOAD or other
  # non-KEY=value line outside the comments.
  local nlib
  nlib=$(grep -cE '^(NVIDIA_OF_LIBRARY_PATH|LD_LIBRARY_PATH)=' "$envfile" || true)
  if ! { grep -qx "NVIDIA_OF_ROOT=$_root" "$envfile" &&
    grep -qx "NVIDIA_OF_INCLUDE_DIR=$_root/include" "$envfile" &&
    if [[ -n $libpath ]]; then
      grep -qx "NVIDIA_OF_LIBRARY_PATH=$libpath" "$envfile" &&
        grep -qx "LD_LIBRARY_PATH=$libpath" "$envfile" && [[ $nlib == 2 ]]
    else
      [[ $nlib == 0 ]]
    fi &&
    grep -qx "NVIDIA_OF_FEATURES=$features" "$envfile" &&
    [[ -f $pkgdir$_root/include/nvOpticalFlowCommon.h && -f $pkgdir$_root/include/nvOpticalFlowCuda.h ]] &&
    ! grep -v '^#' "$envfile" | grep -q -e '["'\''$ ]' -e '^LD_PRELOAD=' -e '^[^=]*$'; }; then
    echo 'nvidia-optical-flow.env: the generated file is not as expected' >&2
    return 1
  fi

  # Licences: links to the SDK's licence files (its top-level licence
  # files, or all its top-level files when none is named like one, and
  # licenses/), and this repository's licence (the documentation).
  local licdir="$pkgdir/usr/share/licenses/$pkgname" lic
  install -Dm644 -t "$licdir" "$_repo/LICENSE-MIT" "$_repo/LICENSE-APACHE"
  local -a top=() named=()
  for lic in "$srcdir"/of/*; do
    [[ -f $lic ]] || continue
    top+=("$lic")
    case ${lic##*/} in
      *[Ll][Ii][Cc][Ee][Nn][CcSs][Ee]* | *[Ee][Uu][Ll][Aa]* | *[Aa][Gg][Rr][Ee][Ee][Mm][Ee][Nn][Tt]*) named+=("$lic") ;;
    esac
  done
  ((${#named[@]} > 0)) || named=("${top[@]}")
  for lic in "${named[@]}" "$srcdir"/of/licenses/*; do
    # The links point into $_root, which does not exist at build time.
    [[ -f $lic && ! -L $licdir/${lic##*/} ]] || continue
    ln -s "$_root/${lic#"$srcdir/of/"}" "$licdir/${lic##*/}"
  done

  install -Dm644 "$_repo/nvidia-optical-flow/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
