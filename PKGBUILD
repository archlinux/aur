# Maintainer: Gergely Imreh <gergely@imreh.net>
# shellcheck disable=SC2034,SC2154,SC2164

pkgname=fizzbee
pkgver=0.5.4
# Custom since the current source requires & tested with a bazel version behind Arch's shipped one
# Upstream asks for 8.x, and here the latest compatible one is used.
_bazelversion=8.9.0
pkgrel=1
pkgdesc="Formal specification language and model checker to specify distributed systems"
arch=('x86_64')
url='https://fizzbee.io/'
# Apache-2.0: fizzbee, glog, yaml.v3 (also MIT); BSD-3-Clause: Go stdlib, starlark-go, protobuf (Go + Python),
# x/sys, antlr4 runtime, jinja2/markupsafe (in mbt_gen.zip); PSF-2.0: the bundled CPython
license=('Apache-2.0' 'BSD-3-Clause' 'MIT' 'PSF-2.0')
depends=('python' 'bash')  # parser launcher is '#!/usr/bin/env python3'; fizz wrapper is bash
optdepends=('curl: for "fizz install-skills" (fetches Claude Code skills and docs from upstream GitHub main, not this version)'
            'wget: alternative to curl for "fizz install-skills"')
checkdepends=('python')
# !strip: makepkg's strip breaks the bundled hermetic python3.12 binary; safe parts are stripped by hand in package()
options=('!ccache' '!strip' '!debug')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/fizzbee-io/fizzbee/archive/refs/tags/v$pkgver.tar.gz"
        "bazel-makepkg::https://github.com/bazelbuild/bazel/releases/download/${_bazelversion}/bazel-${_bazelversion}-linux-x86_64"
        "bazel-makepkg.sig::https://github.com/bazelbuild/bazel/releases/download/${_bazelversion}/bazel-${_bazelversion}-linux-x86_64.sig")
sha256sums=('f7ac1f45702113ad68d6082e7c3b6a26d36a0744144c56d7f0c85a487712fbe0'
            'bc4b5efbaf8b1d85913fb0e6873e40e4d9b33244d30cbbbbcd1b7835d940f8fa'
            'SKIP')
b2sums=('069e4b76af3ddd47a921e73e6a8d0a36bf16b14ce673282fa0698888895e3b240c4f9551188395f167cd4f0785cf8a7307ea9babbaa0695b878bfcb78b147263'
        '81818afab849751754b66367f604c6ba6f7d209cda72a24666a6fb5a6efc2803cbbb1b1bb3a38f0cbba40cbcc1b5c195fb4ded98e0383c99e031c36fd82a25d1'
        'SKIP')
validpgpkeys=('71A1D0EFCFEB6281FD0437C93D5919B448457EE0')
noextract=("bazel-makepkg")

_bazel() {
  "${srcdir}/bazel/bazel" --output_user_root="$srcdir/bazel-root" --max_idle_secs=60 "$@"
}

prepare() {
  install -Dm755 "${srcdir}/bazel-makepkg" "${srcdir}/bazel/bazel"
  "${srcdir}/bazel/bazel" --version

  cd "$srcdir/$pkgname-$pkgver" || exit 1
  export CC=/usr/bin/gcc  # setting so ccache is not picked up from PATH as it doesn't work with bazel here
  _bazel fetch //:fizzbee //parser:parser_bin //mbt/generator:generator_bin_zip
  _bazel shutdown
}

build() {
  # With SOURCE_DATE_EPOCH set (e.g. chroot builds via pkgctl), makepkg resets all mtimes in $srcdir
  # after prepare(). Bazel marks its extracted install base with far-future mtimes and refuses to start
  # ("corrupt installation") once they are reset, so drop it here and let Bazel re-extract it.
  rm -rf "$srcdir/bazel-root/install"

  cd "$srcdir/$pkgname-$pkgver" || exit 1
  export CC=/usr/bin/gcc  # setting so ccache is not picked up from PATH as it doesn't work with bazel here
  # linkmode=pie: rules_go ignores GOFLAGS; this gives PIE + full RELRO on the fizzbee binary
  _bazel build -c opt --nostamp --@rules_go//go/config:linkmode=pie //parser:parser_bin //:fizzbee //mbt/generator:generator_bin_zip
  _bazel shutdown
}

check() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1
  # Upstream's own test suite (not run by their CI, but documented in CLAUDE.md).
  # `bazel test //...` is broken at v0.5.4: the Java MBT lib doesn't compile and
  # the Go unit tests have stale expectations.
  # No bytecode: .pyc files written into the runfiles tree would be packaged and embed build-time
  # mtimes, which breaks reproducibility.
  PYTHONDONTWRITEBYTECODE=1 python3 test_references.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1
  local _lib="$pkgdir/usr/lib/$pkgname"

  install -Dm755 bazel-bin/fizzbee_/fizzbee "$_lib/fizzbee"
  strip --strip-all "$_lib/fizzbee"

  # -L: the runfiles tree is symlinks into $srcdir/bazel-root
  cp -L -R bazel-bin/parser "$_lib/"
  chmod -R u+w,go-w "$_lib/parser"
  # The runfiles manifests map every file to its absolute $srcdir build path (stale after cp -L).
  # The launcher prefers a manifest when present, so drop them and let it use the runfiles directory.
  rm -f "$_lib/parser/parser_bin.runfiles_manifest" "$_lib/parser/parser_bin.runfiles/MANIFEST"

  # Trim the bundled hermetic CPython (pip removal mirrors upstream's release/build_release.sh)
  local _pydirs=("$_lib"/parser/parser_bin.runfiles/rules_python++python+python_3_*-unknown-linux-gnu)
  [[ ${#_pydirs[@]} -eq 1 && -d ${_pydirs[0]} ]] || { echo "bundled python not found" >&2; return 1; }
  local _py=${_pydirs[0]}
  find "$_lib/parser" -type d \( -name pip -o -name 'pip-*.dist-info' -o -name ensurepip \) -prune -exec rm -rf {} +
  find "$_py/bin" -type f \( -name pip -o -name 'pip3*' \) -delete
  find "$_py" -name '*.a' -delete
  rm -rf "$_py"/{include,share} "$_py"/lib/python3.*/{test,idlelib,tkinter,turtledemo}
  # Tk/Tcl and _crypt are unused by the parser; they drag in tk/tcl/libxcrypt-compat and insecure RPATHs (namcap)
  rm -rf "$_py"/lib/{libtcl*.so,libtk*.so,itcl*,tcl8*,tk8*,thread2*,pkgconfig} \
         "$_py"/lib/python3.*/lib-dynload/{_tkinter,_crypt}.cpython-*.so
  strip --strip-unneeded "$_py"/lib/libpython3.*.so.1.0  # safe; do NOT strip bin/python3.*
  # cp -L turned these symlinks into full copies of the interpreter
  local _pyexe
  _pyexe=$(find "$_py/bin" -maxdepth 1 -type f -regex '.*/python3\.[0-9]+' -printf '%f\n')
  [[ -n $_pyexe && $_pyexe != *$'\n'* ]] || { echo "bundled python interpreter not found" >&2; return 1; }
  ( cd "$_py/bin" && ln -sf "$_pyexe" python3 && ln -sf python3 python )
  # Bytecode: /usr/lib isn't writable at runtime, and without .pyc every parser run is ~3x slower
  # (~290ms vs ~100ms). Drop whatever got generated during the build and precompile reproducibly:
  # hash-based pycs (no mtimes), installed paths (-s/-p), and no side-effect timestamp pycs from
  # compileall's own imports (PYTHONDONTWRITEBYTECODE).
  find "$_lib/parser" -type d -name __pycache__ -prune -exec rm -rf {} +
  PYTHONDONTWRITEBYTECODE=1 "$_py/bin/$_pyexe" -m compileall -q -f --invalidation-mode checked-hash \
    -s "$pkgdir" -p / "$_lib/parser" >/dev/null

  # `fizz mbt-scaffold` runs this as `python mbt_gen.zip` (self-extracting, bundles its own python)
  install -Dm644 bazel-bin/mbt/generator/generator_bin.zip "$_lib/mbt_gen.zip"

  install -Dm755 fizz "$_lib/fizz"
  install -Dm644 release/fizz.env "$_lib/fizz.env"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/fizz" "$pkgdir/usr/bin/fizz"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Reference specs + language guides (the same files `fizz install-skills` fetches from GitHub main).
  # Extracted from the tarball, because check() leaves generated .json/out/ files in the source tree.
  install -d "$pkgdir/usr/share/doc/$pkgname"
  bsdtar -xf "$srcdir/$pkgname-v$pkgver.tar.gz" -C "$pkgdir/usr/share/doc/$pkgname" \
         --strip-components 1 "$pkgname-$pkgver/examples/references"

  # Bazel's output tree and rules_python's toolchain (`chmod -R ugo-w lib`) contain read-only
  # directories, which make `makepkg -C` fail to remove $srcdir. Done last, so check() can't
  # write .pyc files into the bundled python before it is copied above.
  chmod -R u+w "$srcdir/bazel-root"
}
