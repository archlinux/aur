# Maintainer: Ruiqi "Richard" Niu <rniu5@jh.edu>
# Contributor: Claude Opus 4.8/Sonnet 4.6 (Anthropic) <https://claude.ai>
pkgname=actflow-git
pkgver=r791.f830e76
pkgrel=1
pkgdesc="The ACT asynchronous VLSI design flow (core ACT tools, actsim, interact, chp2prs, layout, routing, etc.)"
arch=('x86_64')
url="https://github.com/asyncvlsi/actflow"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'Apache-2.0' 'BSD-3-Clause')
# explicit libgomp and libatomic dependency in response to ongoing gcc-libs meta-package split
# m4 is used at runtime for ACT macro preprocessing, triggers false namcap warning
depends=('boost-libs' 'libedit' 'zlib' 'numactl' 'libgomp' 'libatomic' 'm4' 'perl' 'python')
makedepends=('git' 'cmake' 'boost' 'fmt' 'openmpi' 'flex' 'bison' 'llvm' 'patchelf')
optdepends=('yosys: alternative logic-synthesis backend for expropt'
            'graphviz: render dataflow graphs produced by dflow2dot'
            'xyce: mixed analog/digital simulation support in actsim'
            'python-gdsfactory: GDS layout generation (gds2rect.py, rect2gds.py)')
provides=('actflow')
conflicts=('actflow')
# the build generates partial/absent debug information anyways
options=('!debug')
source=("$pkgname::git+https://github.com/asyncvlsi/actflow.git")
sha256sums=('SKIP')

_actdir=/opt/actflow

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	export ACT_HOME="$srcdir/staging$_actdir"
	export CXX=g++

	# The bundled decades-old Cadence LEF/DEF parsers (lefdef) print via
	# non-literal format strings, e.g. fprintf(stderr, str). makepkg's default
	# -Werror=format-security makes that a fatal error, which silently aborts
	# the lefdef build and only surfaces later as phyDB failing with
	# "Could not find LEF_LIBRARY". Downgrade it to a warning for the whole
	# flow (appended last, so it overrides makepkg's setting); modern
	# components never trigger it, so this is harmless to them.
	CFLAGS+=" -Wno-error=format-security"
	CXXFLAGS+=" -Wno-error=format-security"
	export CFLAGS CXXFLAGS

	install -d "$ACT_HOME"
	./build
}

package() {
	install -d "$pkgdir/opt"
	cp -a "$srcdir/staging$_actdir" "$pkgdir$_actdir"

	# --- Remove build-path leakage (insecure RUNPATH, absolute NEEDED entries,
	#     and $srcdir references in text files) ---
	#
	# 1) RUNPATH: collapse every ELF's RUNPATH to the primary $ORIGIN/../lib
	#    entry, dropping the staging-dir fallback.
	#
	# 2) NEEDED: several ACT components (e.g. expropt's act_extsyn_abc.so, the
	#    dflowmap CMake build) link against other ACT libraries by passing the
	#    absolute $ACT_HOME/lib/libX.so path on the link line. ACT's own linkso
	#    script never sets -soname on the libraries it builds, so when a
	#    dependent is linked this way, the linker has no soname to fall back on
	#    and bakes that literal absolute (staging) path into the dependent's
	#    DT_NEEDED entry instead of a bare "libX.so". Rewrite any such absolute
	#    NEEDED entry to its bare basename so it resolves via the RUNPATH fixed
	#    in step 1.
	while IFS= read -r -d '' _f; do
		patchelf --print-rpath "$_f" &>/dev/null || continue   # skip non-ELF files
		patchelf --set-rpath '$ORIGIN/../lib' "$_f" &>/dev/null || true
		while IFS= read -r _need; do
			case "$_need" in
				"$srcdir"/*)
					patchelf --replace-needed "$_need" "$(basename "$_need")" "$_f" ;;
			esac
		done < <(patchelf --print-needed "$_f" 2>/dev/null)
	done < <(find "$pkgdir$_actdir" -type f -print0)

	# 3) Rewrite the staging path baked into generated text files (e.g. scripts/config).
	grep -rIl "$srcdir/staging$_actdir" "$pkgdir$_actdir" 2>/dev/null \
		| xargs -r sed -i "s|$srcdir/staging$_actdir|$_actdir|g"

	# Set ACT_HOME and PATH for every login shell.
	install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/actflow.sh" <<EOF
export ACT_HOME=$_actdir
export PATH="\$ACT_HOME/bin:\$PATH"
EOF

	install -Dm644 "$srcdir/$pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
