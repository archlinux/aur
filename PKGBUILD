# Maintainer: saber-nyan <saber-nyan@ya.ru>
# Written by an LLM: Qwen3.8-Flash-Next (Qwen3.8-FN-GSQ-RCO-IQ3_S) served by basalt itself - the
# engine this package builds - with a human driving, reviewing and running every build.
# Tracks upstream main of https://github.com/jesdga95/basalt plus two local patches:
#   0001-cmake-overridable-basalt-source-dir.patch  BASALT_SOURCE_DIR / engine path become cmake options
#   ram-guard-mib.patch                             --ram-guard-mib N (0 = the RAM guard off)
# Both patches apply with `git am --3way` to upstream main through bd984820 (checked 2026-11-03).
# Upstream bug found through this package: https://github.com/jesdga95/basalt/issues/224
# (out-of-range operator[] in Tokenizer::merge_piece; see build() and README).
# Named basalt-inference-git, and the PATH commands are qualified the same way: AUR already has
# aur/basalt and aur/basalt-bin (a TUI for Obsidian) owning /usr/bin/basalt, plus the vkBasalt
# family and basalt-monado (a SLAM library). Qualifying the names beats declaring a conflict with
# unrelated software. The runtime tree keeps upstream's own names (/usr/lib/basalt/bin/basalt),
# which is also the path baked into basalt-probe/-bench as their engine.
pkgname=basalt-inference-git
pkgver=0.2.0.45.g83d76f90
pkgrel=1
pkgdesc='Local inference engine for Qwen3.8-Flash-Next MoE packs (NVIDIA Blackwell, sm_120)'
arch=(x86_64)
url='https://github.com/jesdga95/basalt'
license=(MIT)
depends=(cuda python python-numpy python-jinja python-markupsafe
         python-regex python-yaml python-tqdm python-pillow python-psutil)
makedepends=(git cmake ninja)
source=("basalt::git+https://github.com/jesdga95/basalt.git#branch=main"
        ram-guard-mib.patch
        0001-cmake-overridable-basalt-source-dir.patch)
sha256sums=('SKIP'
            '3f591caf54a17dff4f7c4093fc01581154e5e170e4be87a20e3189bfcf4e3f0b'
            'd065296aa095292902f3b02a87d9321c798c6f00972c17594a14a4f324747490')

# BASALT_DEBUG=1 makepkg -si builds with -g, splits off a basalt-git-debug package (gdb then reports
# file:line), and turns LTO off there: -g plus -flto wants far more RAM than this codebase compiles
# comfortably. Used to catch the engine's out-of-bounds vector<int> (see README).
[[ -n ${BASALT_DEBUG:-} ]] && options=('debug' '!lto')

# The installed runtime tree: basalt serve chdirs here and runs `python3 -m serve.server`, and the
# engine reads its expert profiles from $pkgdir$_prefix/data/profiles.
_prefix=/usr/lib/basalt

pkgver() {
  cd "$srcdir/basalt"
  git describe --tags --always | sed -e 's/^v//' -e 's/-/./g'
}

prepare() {
  cd "$srcdir/basalt"
  git config user.email pkgbuild@localhost     # git am needs a committer identity
  git config user.name  makepkg
  for p in 0001-cmake-overridable-basalt-source-dir.patch ram-guard-mib.patch; do
    if ! git am --3way "$srcdir/$p"; then
      git am --abort 2>/dev/null
      printf '%s does not apply to %s:\n' "$p" "$(git describe --tags --always)" >&2
      printf '  1. in a scratch clone: git checkout <new-main>; git am --3way %s/%s\n' "$srcdir" "$p" >&2
      printf '     fix the conflicts, git add them, git am --continue, then:\n' >&2
      printf '     git format-patch -1 --stdout > %s/%s   (keep the patch file name)\n' "$srcdir" "$p" >&2
      printf '  2. sha256sum that file, put the new sum in sha256sums[]\n' >&2
      printf '  3. rm -rf src pkg && makepkg -si\n' >&2
      printf 'A silently unpatched tree is worse than a failed build: the flag would just be missing.\n' >&2
      return 1
    fi
  done
}

build() {
  cd "$srcdir/basalt"
  # Arch's hardening puts -Wp,-D_GLIBCXX_ASSERTIONS in CXXFLAGS, and libstdc++ then checks every
  # vector::operator[].  The engine hits one on the serve path - Tokenizer::merge_piece forms
  # &sym_[count] in its shift (src/program/tokenizer/bpe.cpp:240), reported upstream as
  # https://github.com/jesdga95/basalt/issues/224 - and the check aborts the engine mid-request
  # (exit -6, "stl_vector.h:1253 ... Assertion '__n < this->size()' failed") on ordinary tool-list
  # prompts.  A plain build is not hurt today (the move is empty), it is silent UB, so the flag
  # cannot stay on here; the checks also sit in the hot expert/token loops.
  # Drop the one flag; the rest of the hardening stays.  BASALT_GLIBCXX_ASSERTIONS=1 keeps it on to
  # hunt the next one (README), and to re-check this once #224 is fixed upstream.
  # given to cmake as -DCMAKE_CXX_FLAGS below, not just exported: an existing build/ directory keeps
  # its cached CMAKE_CXX_FLAGS otherwise, and the flag would come back on an incremental rebuild.
  local cxxflags="$CXXFLAGS" cudaflags=""
  [[ -z ${BASALT_GLIBCXX_ASSERTIONS:-} ]] && cxxflags="${cxxflags/-Wp,-D_GLIBCXX_ASSERTIONS/}"
  # nvcc does not take CXXFLAGS, so the .cu host code needs -g passed through explicitly
  [[ -n ${BASALT_DEBUG:-} ]] && cudaflags="-Xcompiler=-g"
  [[ -n ${BASALT_JOBS:-} ]] && echo "basalt: building with ${BASALT_JOBS} jobs, CXXFLAGS=[$cxxflags]" >&2
  # CMAKE_SKIP_RPATH: the cuda package ships /etc/ld.so.conf.d/cuda.conf, so the binaries do not
  # need a RUNPATH into /opt/cuda (namcap flags it as insecure).
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$cxxflags" \
    -DCMAKE_CUDA_FLAGS="$cudaflags" \
    -DBASALT_SOURCE_DIR="$_prefix" \
    -DBASALT_ENGINE_BIN="$_prefix/bin/basalt" \
    -DCMAKE_CUDA_ARCHITECTURES=120 \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_TESTING=OFF \
    -DWERROR=OFF
  # peak nvcc memory is bounded by the job count: BASALT_JOBS=2 makepkg -si  (default: nproc)
  cmake --build build -- -k 0 -j "${BASALT_JOBS:-$(nproc)}"
}

package() {
  cd "$srcdir/basalt"
  # CMake has no install() rules and puts the binaries in the source tree's bin/, so they are installed by hand.
  # In the tree they keep upstream's names (the engine path is baked into probe/bench); only the PATH
  # symlinks are qualified, so /usr/bin/basalt stays free for aur/basalt and aur/basalt-bin.
  install -d "$pkgdir/usr/bin"
  for b in basalt basalt-bench basalt-probe basalt-vision; do
    install -Dm755 "bin/$b" "$pkgdir$_prefix/bin/$b"
    ln -sfn "$_prefix/bin/$b" "$pkgdir/usr/bin/basalt-inference${b#basalt}"
  done

  # serve/ (the Python server), tools/ (on serve's sys.path) and data/ (profiles, bench fixtures)
  # are read at run time from $_prefix.
  for d in serve tools data; do
    cp -a "$d" "$pkgdir$_prefix/"
  done
  find "$pkgdir$_prefix" -name '__pycache__' -type d -prune -exec rm -rf {} +
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 THIRD_PARTY_LICENSES "$pkgdir$_prefix/THIRD_PARTY_LICENSES"

  # both patches must be baked into the installed engine, or the package is broken
  if ! grep -aq -- '--ram-guard-mib' "$pkgdir$_prefix/bin/basalt"; then
    printf 'ram-guard-mib.patch is not in the installed binary: the flag would be missing.\n' >&2
    return 1
  fi
  if ! grep -aq "$_prefix" "$pkgdir$_prefix/bin/basalt"; then
    printf 'BASALT_SOURCE_DIR is not %s: basalt serve would not find its tree.\n' "$_prefix" >&2
    return 1
  fi
  # basalt-probe and basalt-bench bake in the engine they start and the fixtures they read
  for b in basalt-probe basalt-bench; do
    if ! grep -aq "$_prefix/bin/basalt" "$pkgdir$_prefix/bin/$b"; then
      printf '%s still points at the build tree for its engine; it would need --engine.\n' "$b" >&2
      return 1
    fi
  done
}
