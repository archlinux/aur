# Maintainer: Yakov Till <yakov.till@gmail.com>

_pyname=angr
_z3ver=5.3.3.0
pkgname=python-${_pyname}-bin
pkgver=10.0.7
pkgrel=1
pkgdesc='A powerful and user-friendly binary analysis platform (prebuilt)'
arch=('x86_64' 'aarch64')
url="https://github.com/${_pyname}/${_pyname}"
license=('BSD-2-Clause' 'MIT')
depends=(
  'python'
  'python-angr-data'
  'python-archinfo'
  'python-cachetools'
  'python-capstone'
  'python-cffi'
  'python-cle'
  'python-cxxheaderparser'
  'python-gitpython'
  'python-lmdb'
  'python-msgspec'
  'python-mulpyplexer'
  'python-networkx'
  'python-platformdirs'
  'python-protobuf'
  'python-psutil'
  'python-pycparser'
  'python-pydemumble'
  'python-pypcode'
  'python-pyvex'
  'python-rich'
  'python-sortedcontainers'
  'python-typing_extensions'
)
# angr guards every one of these imports itself: they cover its optional extras plus the
# interactive debugger hook, so the package works without any of them. pydantic-ai has no
# package in the repos or the AUR, so the llm extra is deliberately unlisted.
optdepends=(
  'ipython: BP_IPYTHON debugger hook'
  'python-opentelemetry-api: tracing support'
  'python-pydantic: LLM feature models'
  'python-sqlalchemy: saving and loading projects (angrdb)'
  'python-unicorn: alternative unicorn engine backend'
)
makedepends=('patchelf' 'python-installer')
provides=("python-${_pyname}")
conflicts=("python-${_pyname}")
options=('!strip' '!debug')

# The wheel is a prebuilt binary: its Rust extension carries a hard DT_NEEDED on
# libz3.so.5.3, and angr opens that same library itself from the z3-solver wheel's own lib
# directory. Arch packages z3-solver as Python files only and keeps the library in the
# separate z3 package, whose soname is libz3.so.4.16 — neither the path nor the version is
# available. Carry the exact library angr was built against inside the package, reached
# through an $ORIGIN rpath; see 0002. Pointing the extension at the system 4.16 instead
# makes the basic paths work, but a solver answering from a different major version is a
# silent-wrong-answer risk, so the matching library is bundled rather than substituted.
# python-z3-solver is therefore not a dependency: angr never imports the z3 module, it only
# used find_spec to locate that library, and 0002 removes even that.
_pypi='https://files.pythonhosted.org/packages'
noextract=('angr.whl' 'z3.whl')
source=(
  "z3-solver-${_z3ver}.tar.gz::${_pypi}/55/15/89a6263f1476d9b636d301073ea3923833b3035d9ff5668d6eef7f5f6579/z3_solver-${_z3ver}.tar.gz"
  '0001-pycparser-3.12-token-stream.patch'
  '0002-z3-library-path-fallback.patch'
)
source_x86_64=(
  "angr.whl::${_pypi}/46/8a/74db39306a3d0093aa9533587e53151f0add724052a19ac9a207b6a6d5a3/${_pyname}-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
  "z3.whl::${_pypi}/2e/04/d785e50a2f6cd78549bebe730f2afeab5187c62085fc19b7ac272602fb2f/z3_solver-${_z3ver}-py3-none-manylinux_2_27_x86_64.whl"
)
source_aarch64=(
  "angr.whl::${_pypi}/46/02/ee63578456c2d0f77a48ddf2389993a467a58484f725dfdd31c2ea1fb4e5/${_pyname}-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl"
  "z3.whl::${_pypi}/e9/e4/73b6722cb58aeac9b6e95e02d7837ad8d929e7ba613bc73c7216ef09bffa/z3_solver-${_z3ver}-py3-none-manylinux_2_38_aarch64.whl"
)

latestver() {
  curl -fsSL "https://pypi.org/pypi/${_pyname}/json" |
    sed -nE 's/^ *"version": *"([0-9]+(\.[0-9]+)*)".*/\1/p' | head -1
}

prepare() {
  mkdir -p _angr _z3
  bsdtar -xf "${srcdir}/angr.whl" -C _angr
  bsdtar -xf "${srcdir}/z3.whl" -C _z3

  patch -d _angr -p1 -i "${srcdir}/0001-pycparser-3.12-token-stream.patch"
  patch -d _angr -p1 -i "${srcdir}/0002-z3-library-path-fallback.patch"

  # libz3.so is a symlink in the wheel; ship only the soname and link it in package() so the
  # 28 MiB library is not duplicated by the wheel re-pack.
  install -d _angr/angr/_z3lib
  install -m755 "_z3/z3/lib/libz3.so.${_z3ver%.*.*}" _angr/angr/_z3lib/
  patchelf --set-rpath '$ORIGIN/_z3lib' _angr/angr/rustylib.abi3.so
}

check() {
  # Exercise the prepared tree the package is built from: solving proves the bundled z3
  # actually answers, CFGFast proves the Rust extension loaded and ran.
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="${srcdir}/_angr" python - <<'EOF'
import angr, claripy

x = claripy.BVS("x", 32)
solver = claripy.Solver()
solver.add(claripy.And(x > 100, x < 110, x % 5 == 0))
values = [int(v) for v in solver.eval(x, 2)]
assert values and all(100 < v < 110 and v % 5 == 0 for v in values), values

project = angr.Project("/bin/true", auto_load_libs=False)
functions = project.analyses.CFGFast(normalize=True).kb.functions
assert len(functions) > 10, len(functions)

print(f"{angr.__version__}: solve {[hex(v) for v in values]}, {len(functions)} functions in /bin/true")
EOF
}

package() {
  local _wheel="${_pyname}-${pkgver}-cp312-abi3-linux_${CARCH}.whl"

  # installer validates a wheel filename and refuses an unpacked directory, so re-pack the
  # patched tree under its PEP 427 name. Clean arc names matter: a "./" prefix hides the
  # dist-info from installer's checks.
  python - "${srcdir}/_angr" "${srcdir}/${_wheel}" <<'EOF'
import pathlib, sys, zipfile

source, target = pathlib.Path(sys.argv[1]), sys.argv[2]
with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as archive:
    for path in sorted(source.rglob("*")):
        archive.write(path, path.relative_to(source).as_posix())
EOF

  python -m installer --destdir="${pkgdir}" "${srcdir}/${_wheel}"

  install -Dm644 "${srcdir}/_angr/${_pyname}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/z3_solver-${_z3ver}/core/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/z3-LICENSE.txt"
}
sha256sums=('d95af3980d65ccfd60d23124c6769b1f1564c437049502ce70c476e43abb3d42'
            '3b2d6ff7ad82567ea9ecbb5a9fb8a9da02e4a414ebb2bb0fa3da7d293f4750db'
            'ea6721a385ef24ca0c646a75cfbafba89a13b9c497316c64576b772666d41ee3')
sha256sums_x86_64=('d3c1903eb9c8481ed650aa7d9502e7baeba8bc880e7c9576d2776b4ec0fd5e08'
                   '0431023a82278dab706c02a320f63178ee0755fb8f10a5c980f0bfe3c84f6f96')
sha256sums_aarch64=('4b95794e51dc48452ca9b2a1f4969410bc32ef44002a615558471c1b6c987d1d'
                    '701619d4995695819e150e9fa10218b67a5a2241868f31dddccfe2d3fe15f986')
