# Maintainer: Raul Dias <raul@dias.com.br>
#
# A local Arch package of the NVIDIA Maxine AR SDK, built from the
# user's OWN download, so that several projects on one machine share one
# installation. For personal use: each user accepts NVIDIA's licence and
# downloads the SDK from NGC themselves, as described in
# https://github.com/rsd/omarchy-nvidia-sdks/blob/main/docs/download.md
# This repository holds only the recipe. The built package contains NVIDIA
# software: keep it on your own machine and never redistribute it (no
# repository, no AUR binary, no release, no sharing; NVIDIA SLA 8.5).
#
# This copy is generated for the AUR by scripts/aur.sh of
# https://github.com/rsd/omarchy-nvidia-sdks (documentation:
# https://github.com/rsd/omarchy-nvidia-sdks/blob/3be0fb976d281b0edc2704be141ff09e42abcd93/README.md).
# The recipe's helpers (selection.sh, assemble.sh, configure.sh, the
# os-release shim's source, ...) come from that repository at the commit
# pinned in source=(); makepkg checks it out into src/omarchy-nvidia-sdks.
# "This directory" below is the directory of this PKGBUILD: selection.conf
# is read there. configure.sh is
# src/omarchy-nvidia-sdks/maxine-ar/configure.sh, which
# `makepkg -o --noprepare` fetches; run it from this directory with
# --conf selection.conf, as below, so that it writes the selection.conf
# this PKGBUILD reads. The environment variables work without it.
#
# Build-time inputs, each from the environment variable of that name, else
# from selection.conf in this directory (written by configure.sh), else the
# default. prepare() prints every value and where it came from.
#   MAXINE_AR_SRC       where the download or SDK tree is, an absolute
#                       path (default: this directory). Either an assembled
#                       tree (it, or its ARSDK/, holds lib/libnvARPose.so),
#                       or the directories as `ngc ... download-version`
#                       makes them.
#   MAXINE_AR_ARCHS     GPU architectures whose models are packaged: sm_120,
#                       sm120 or 120 (the compute capability without the
#                       dot), space- or comma-separated, or `all` alone for
#                       every architecture in the source (default:
#                       _maxine_archs below). Each one adds the models of
#                       every feature that has models (the recipe's README.md,
#                       https://github.com/rsd/omarchy-nvidia-sdks/blob/main/maxine-ar/README.md).
#   MAXINE_AR_FEATURES  `all` (default: every feature present is packaged),
#                       or a space- or comma-separated list: exactly those
#                       are packaged, and each must be present.
# selection.conf is parsed as KEY=value lines by selection.sh, never
# sourced; it is read in prepare() only, so `makepkg --printsrcinfo` does
# not depend on it.
#
# Build (in the directory of this PKGBUILD), e.g.:
#   src/omarchy-nvidia-sdks/maxine-ar/configure.sh --conf selection.conf --src ~/Downloads/maxine/ar-sdk --archs sm_120 --features all --write
#   makepkg -f
#   MAXINE_AR_SRC=~/.local/opt/maxine/ARSDK makepkg -f
#   MAXINE_AR_SRC=~/Downloads/maxine/ar-sdk MAXINE_AR_ARCHS="sm_120 sm_89" makepkg -f
# The package is about 4.5 GiB; PKGEXT=.pkg.tar skips a slow compression:
#   PKGEXT=.pkg.tar MAXINE_AR_SRC=~/Downloads/maxine/ar-sdk makepkg -f
# Install the result with:  sudo pacman -U maxine-ar-sdk-local-*.pkg.tar*
#
# It installs the SDK tree under /opt/nvidia/maxine/arsdk, the os-release
# shim (a compatibility shim for distributions the SDK does not list; NVIDIA
# does not support this configuration) under /usr/lib/maxine-ar, and an
# environment file, /usr/share/maxine-ar/maxine-ar.env, that a consumer
# loads explicitly (/usr/share/doc/maxine-ar-sdk-local/usage.md). Nothing
# under /etc and nothing global: the bundled CUDA 12 and TensorRT 10
# libraries would otherwise shadow the system's for every program.
#
# shellcheck source-path=SCRIPTDIR

pkgname=maxine-ar-sdk-local
pkgver=1.2.0.0
pkgrel=1
pkgdesc="NVIDIA Maxine AR SDK, packaged from the user's own download (personal use, not redistributable)"
arch=('x86_64')
url='https://catalog.ngc.nvidia.com/orgs/nvidia/maxine/resources/ar_sdk_core'
license=('LicenseRef-NVIDIA-Maxine' 'MIT OR Apache-2.0')  # the NVIDIA SDK; this repository's shim
depends=(
  'nvidia-utils'  # libcuda.so.1 (the driver); the SDK bundles CUDA 12.8, cuDNN 9.7 and TensorRT 10.9
)
# The shim needs gcc and make, both in base-devel.
checkdepends=(
  'python'        # the os-release shim test exercises python3's open(); skipped without it
)
provides=("maxine-ar-sdk=$pkgver")
# Keep the SDK byte-identical, including its bundled static libraries.
options=('!strip' '!debug' 'staticlibs')
# Nothing of NVIDIA's is downloaded: the SDK comes from $MAXINE_AR_SRC.
# The recipe's helpers (its scripts, the shim's source, the documents it
# installs): https://github.com/rsd/omarchy-nvidia-sdks at the commit
# below, fetched by makepkg (source=). Relative to $srcdir, where makepkg
# runs every function: $srcdir is not set yet when makepkg reads this file.
_repo=omarchy-nvidia-sdks
_commit=3be0fb976d281b0edc2704be141ff09e42abcd93
source=()

# The helpers, pinned: makepkg verifies the checksum of `git archive` of the
# commit.
source+=("omarchy-nvidia-sdks::git+https://github.com/rsd/omarchy-nvidia-sdks.git#commit=$_commit")
sha256sums+=('11e6b911209c3eceed8e29117bad4d89111460553b4d4f417addc62038f9ec9c')
makedepends+=('git')

_root=/opt/nvidia/maxine/arsdk

# The GPU architectures packaged when neither MAXINE_AR_ARCHS nor
# selection.conf names them. There is
# no GPU detection at build time (nvidia-smi would wake a sleeping dGPU):
# find your value once with
#   nvidia-smi --query-gpu=compute_cap --format=csv,noheader
# (12.0 is sm_120).
_maxine_archs=(sm_120)

prepare() {
  # The selection: environment variable > selection.conf > default. The
  # helper only defines functions; it parses selection.conf, never sources it.
  # shellcheck source=selection.sh
  . "$_repo/maxine-ar/selection.sh"
  maxine_ar_resolve "$startdir/selection.conf" "$startdir" "${_maxine_archs[*]}" all || return 1
  echo "Maxine AR selection:"
  maxine_ar_print_resolved
  local -a _archs _features
  read -ra _archs <<<"${maxine_ar_archs//,/ }"
  read -ra _features <<<"${maxine_ar_features//,/ }"
  rm -rf -- "$srcdir/arsdk" "$srcdir/arsdk.state"
  # arsdk.state records the packaged features and architectures for
  # package(); it stays outside the packaged tree.
  bash "$_repo/maxine-ar/assemble.sh" --conf "$startdir/selection.conf" --src "$maxine_ar_src" --dest "$srcdir/arsdk" \
    --version "$pkgver" --archs "${_archs[*]}" --features "${_features[*]}" \
    --state "$srcdir/arsdk.state"
}

build() {
  # The os-release shim; the Makefile takes CFLAGS and LDFLAGS from makepkg.
  make -C "$_repo/tools/os-release-shim" OUT="$srcdir/shim"
}

check() {
  # A shim or Maxine environment of the builder must not leak into the test.
  env -u LD_PRELOAD -u MAXINE_OS_RELEASE -u MAXINE_OS_RELEASE_DEBUG \
    -u OMA_BROADCAST_OS_RELEASE -u OMA_BROADCAST_OS_RELEASE_DEBUG \
    make -C "$_repo/tools/os-release-shim" OUT="$srcdir/shim" test
}

package() {
  # The SDK tree, as assembled (reflinks where the filesystem allows).
  # fakeroot makes it root-owned; directories 755, files at least 644.
  install -d "$pkgdir/opt/nvidia/maxine"
  cp -a --reflink=auto -- "$srcdir/arsdk" "$pkgdir$_root"
  chmod -R u+rwX,go+rX,go-w -- "$pkgdir$_root"

  # The shim and its replacement os-release (Ubuntu 24.04), inactive: a
  # consumer preloads it on its own program.
  install -Dm755 "$srcdir/shim/os-release-shim.so" "$pkgdir/usr/lib/maxine-ar/os-release-shim.so"
  install -Dm644 "$_repo/tools/maxine-probe/fake-os-release" "$pkgdir/usr/lib/maxine-ar/fake-os-release"

  # The environment file: KEY=value lines, no quotes, no expansion, so it
  # works as a systemd EnvironmentFile= and with `set -a; . file; set +a`.
  # One features/<f>/lib per packaged feature, sorted by name, as
  # assemble.sh recorded them (comma-separated lists, no spaces).
  local key value features='' archs='' f
  while IFS='=' read -r key value; do
    case $key in
      MAXINE_AR_FEATURES) features=$value ;;
      MAXINE_AR_ARCHS) archs=$value ;;
    esac
  done <"$srcdir/arsdk.state"
  if [[ ! $features =~ ^[A-Za-z0-9_-]+(,[A-Za-z0-9_-]+)*$ || ! $archs =~ ^(sm_[0-9]+(,sm_[0-9]+)*)?$ ]]; then
    echo "arsdk.state: unexpected features '$features' or architectures '$archs'" >&2
    return 1
  fi
  local libpath="$_root/lib"
  local -a _features
  IFS=, read -ra _features <<<"$features"
  for f in "${_features[@]}"; do
    [[ -d $srcdir/arsdk/features/$f/lib ]] ||
      { echo "feature $f was not assembled" >&2; return 1; }
    libpath+=":$_root/features/$f/lib"
  done
  libpath+=":$_root/external/cuda/lib:$_root/external/tensorrt/lib"
  local envfile="$pkgdir/usr/share/maxine-ar/maxine-ar.env"
  install -d "${envfile%/*}"
  cat >"$envfile" <<EOF
# NVIDIA Maxine AR SDK ($pkgname $pkgver-$pkgrel).
# Usage: /usr/share/doc/$pkgname/usage.md
# Load it for one program only (systemd EnvironmentFile=, or
#   set -a; . /usr/share/maxine-ar/maxine-ar.env; set +a
# in a script); never from a login profile. It does not set LD_PRELOAD: put
# LD_PRELOAD=\$MAXINE_AR_OS_RELEASE_SHIM on the final program yourself.
# MAXINE_AR_FEATURES and MAXINE_AR_ARCHS are informational: the features
# and GPU architectures this package was built with.
MAXINE_AR_ROOT=$_root
MAXINE_AR_MODEL_DIR=$_root/lib/models
MAXINE_AR_LIBRARY_PATH=$libpath
LD_LIBRARY_PATH=$libpath
MAXINE_AR_OS_RELEASE_SHIM=/usr/lib/maxine-ar/os-release-shim.so
MAXINE_OS_RELEASE=/usr/lib/maxine-ar/fake-os-release
MAXINE_AR_FEATURES=$features
MAXINE_AR_ARCHS=$archs
EOF
  chmod 644 "$envfile"
  local dir
  # Every key as specified, and no quote, $, space, LD_PRELOAD, deprecated
  # OMA_BROADCAST_* name or other non-KEY=value line outside the comments.
  if ! { grep -qx "MAXINE_AR_ROOT=$_root" "$envfile" &&
    grep -qx "MAXINE_AR_MODEL_DIR=$_root/lib/models" "$envfile" &&
    grep -qx "MAXINE_AR_LIBRARY_PATH=$libpath" "$envfile" &&
    grep -qx "LD_LIBRARY_PATH=$libpath" "$envfile" &&
    grep -qx 'MAXINE_AR_OS_RELEASE_SHIM=/usr/lib/maxine-ar/os-release-shim.so' "$envfile" &&
    grep -qx 'MAXINE_OS_RELEASE=/usr/lib/maxine-ar/fake-os-release' "$envfile" &&
    grep -qx "MAXINE_AR_FEATURES=$features" "$envfile" &&
    grep -qx "MAXINE_AR_ARCHS=$archs" "$envfile" &&
    ! grep -v '^#' "$envfile" | grep -q -e '["'\''$ ]' -e '^LD_PRELOAD=' -e '^OMA_BROADCAST_' -e '^[^=]*$'; }; then
    echo 'maxine-ar.env: the generated file is not as expected' >&2
    return 1
  fi
  while IFS= read -r -d : dir; do
    [[ -d $pkgdir$dir ]] || { echo "maxine-ar.env: $dir is not in the package" >&2; return 1; }
  done <<<"$libpath:"
  [[ -d $pkgdir$_root/lib/models ]] ||
    { echo "maxine-ar.env: $_root/lib/models is not in the package" >&2; return 1; }

  # Licences: links to the SDK's own licence files (those present), and
  # this repository's licence for the shim. The features ship the same
  # agreements plus the models' licence in features/<f>/license/; the first
  # feature's copy of a name that the SDK's share/ lacks is linked.
  local licdir="$pkgdir/usr/share/licenses/$pkgname" lic
  install -Dm644 -t "$licdir" "$_repo/LICENSE-MIT" "$_repo/LICENSE-APACHE"
  for lic in "$srcdir"/arsdk/share/*.pdf "$srcdir/arsdk/share/external/ThirdPartyLicenses.txt" \
    "$srcdir"/arsdk/features/*/license/*.pdf; do
    # The links point into $_root, which does not exist at build time.
    [[ -f $lic && ! -L $licdir/${lic##*/} ]] || continue
    ln -s "$_root/${lic#"$srcdir/arsdk/"}" "$licdir/${lic##*/}"
  done

  install -Dm644 "$_repo/docs/usage.md" "$pkgdir/usr/share/doc/$pkgname/usage.md"
}
