# Maintainer: Will Handley <wh260@cam.ac.uk>
#
# Liquidsoap is an OCaml-based scripting language and runtime for live audio
# composition. Upstream is built with opam (the OCaml package manager), which
# pulls in ~80 OCaml libraries. Rather than packaging each OCaml dependency
# as its own Arch package, this PKGBUILD uses opam at build time with a
# private OPAM root scoped to the build directory. The resulting native
# binary is then installed into $pkgdir via `dune install`.
#
# Build deps come from Arch (opam, ocaml, dune, system C libs); OCaml deps
# come from opam-repository at build time. Runtime deps are only the C
# shared libraries the binary links against, since `dune build --release`
# produces a self-contained native executable.

pkgname=liquidsoap
pkgver=2.4.4
pkgrel=1
pkgdesc='Swiss-army knife for multimedia streaming — scriptable live-audio engine used by Radio France, AzuraCast, Libretime'
arch=('x86_64')
url='https://www.liquidsoap.info/'
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'curl'
  'ffmpeg'         # HLS input, audio/video decoding (linked by build)
  'openssl'        # HTTPS sources, TLS output (linked by build)
  'libsamplerate'  # high-quality resampling (linked by build)
)
makedepends=(
  'opam'
  'ocaml'
  'dune'
  'pkgconf'
  'git'
  'unzip'
  'python'
)
source=("https://github.com/savonet/liquidsoap/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed5ce71363f28e4f5a0d11eca2426cd973f9d0d929e1b864de93973a18e2d39c')

_opam_packages=(
  # Core deps from liquidsoap.opam
  'dune-build-info'
  'dune-site'
  'mm'
  're'
  'curl'
  'camomile'
  'uri'
  'menhirLib'
  'mem_usage'
  'metadata'
  'magic-mime'
  'ppx_string'
  'base-bytes'
  # Optional but wanted for our use case
  'ffmpeg'    # HLS input + decoding
  'ssl'       # HTTPS sources
  'samplerate' # Resampling
  'posix-time2'
)

_opam_env() {
  export OPAMROOT="${srcdir}/.opam"
  export OPAMYES=1
  export OPAMCONFIRMLEVEL=unsafe-yes
  export OPAMVERBOSE=0
  export OPAMCOLOR=never
  # Use system OCaml, don't recompile it
  export OPAMNOEXTERNALSOLVERFETCH=true
  # opam's sandboxing uses bubblewrap which can clash with makepkg's
  # restrictions; disable for the build.
  export OPAMSANDBOXING=false
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  _opam_env

  if [[ ! -d "${OPAMROOT}" ]]; then
    opam init \
      --bare \
      --no-setup \
      --disable-shell-hook \
      --disable-sandboxing \
      --shell=bash \
      --reinit
  fi

  if ! opam switch list --short 2>/dev/null | grep -qx build-switch; then
    opam switch create build-switch --packages=ocaml-system --no-install
  fi

  eval "$(opam env --switch=build-switch --set-switch)"

  # Pin local liquidsoap-* opam packages from this source tree so opam
  # resolves deps against this version and doesn't pull liquidsoap-lang
  # from opam-repository.
  cd opam
  for f in liquidsoap-lang.opam liquidsoap.opam; do
    opam pin add --no-action --kind=path "${f%.opam}" "${srcdir}/${pkgname}-${pkgver}"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  _opam_env
  eval "$(opam env --switch=build-switch --set-switch)"

  opam install --yes "${_opam_packages[@]}"
  opam install --yes --deps-only liquidsoap-lang liquidsoap

  dune build --release --profile=release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  _opam_env
  eval "$(opam env --switch=build-switch --set-switch)"

  # dune install lays out bin/, share/liquidsoap/, share/man/, etc.
  # --docdir is required because dune's default doc target is /usr/doc on Arch.
  dune install --release \
    --destdir="${pkgdir}" \
    --prefix=/usr \
    --docdir=/usr/share/doc \
    liquidsoap-lang liquidsoap

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # OCaml source files leak into the installed lib dir; only the compiled
  # .cmxs/.cmi are needed at runtime.
  find "${pkgdir}/usr/lib/liquidsoap-lang" \( -name '*.ml' -o -name '*.mli' \) -delete

  # Camomile (Unicode lib) uses dune-site to encode its data directory at
  # link time, pointing into the opam build switch. Ship the data under our
  # own namespace (a future Arch camomile package would own /usr/share/camomile)
  # and patch the encoded path in the binary in place.
  local cam_src="${OPAMROOT}/build-switch/share/camomile"
  install -d "${pkgdir}/usr/share/liquidsoap/camomile"
  cp -a "${cam_src}/." "${pkgdir}/usr/share/liquidsoap/camomile/"

  # dune-site encodes "=<len>:<path><padding>" with a fixed total field
  # width. Replace the srcdir path with /usr/share/liquidsoap/camomile,
  # preserving the total byte count by adjusting length prefix and padding.
  python3 - "${pkgdir}/usr/bin/liquidsoap" <<'PY'
import sys, re
path = sys.argv[1]
with open(path, 'rb') as f:
    data = f.read()
# Match =<len>:<srcdir>/.opam/build-switch/share/camomile<spaces>
pat = re.compile(rb'=(\d+):(/[^\x00]*?\.opam/build-switch/share/camomile)( +)', re.DOTALL)
def sub(m):
    new = b'/usr/share/liquidsoap/camomile'
    orig_total = len(m.group(0))
    new_prefix = b'=%d:%s' % (len(new), new)
    pad = orig_total - len(new_prefix)
    assert pad >= 0, f"camomile path replacement overflow: {orig_total} vs {len(new_prefix)}"
    return new_prefix + b' ' * pad
new_data, n = pat.subn(sub, data)
if n == 0:
    sys.exit("camomile encoded path not found in binary")
with open(path, 'wb') as f:
    f.write(new_data)
print(f"patched {n} camomile path(s)")
PY

  # Two more residual srcdir paths embedded in the binary:
  #   - a ctypes -I include flag (NUL-terminated string) used by runtime FFI
  #     stub compilation in Ctypes.Foreign, almost never invoked by scripts;
  #   - the OCaml library search path that dune-site bakes into an `=N:hardcoded
  #     \0/usr/lib/ocaml\0<srcdir>/lib<padding>` block used by Dynlink for
  #     plugin discovery. /usr/lib/ocaml is already in that list, so blanking
  #     the srcdir entry leaves a working search path on the user system.
  # Blank both to space-padded empty fields so any caller sees a no-op rather
  # than a stale build-host path.
  python3 - "${pkgdir}/usr/bin/liquidsoap" "${srcdir}" <<'PY'
import sys, re
binpath, srcdir = sys.argv[1], sys.argv[2].encode()
with open(binpath, 'rb') as f:
    data = f.read()
escaped = re.escape(srcdir + b'/.opam/build-switch/lib')
# Match the path followed by trailing C-string NULs OR dune-site padding spaces.
pat = re.compile(escaped + rb'(/ctypes)?( +|\x00+)')
def sub(m):
    return b' ' * len(m.group(0)) if m.group(2).startswith(b' ') else b'\x00' * len(m.group(0))
data, n = pat.subn(sub, data)
if n == 0:
    sys.exit("expected residual lib/ctypes srcdir paths in binary, found none")
with open(binpath, 'wb') as f:
    f.write(data)
print(f"nulled {n} residual path(s)")
PY
  # Remaining $srcdir hits at this point live in DWARF debug sections (OCaml
  # _build/default paths). makepkg's default strip pass removes them after
  # package() returns. A final check would have to run post-strip, which is
  # outside this hook's reach; rely on makepkg's own "reference to $srcdir"
  # check for that final assertion.
}
