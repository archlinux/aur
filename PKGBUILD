# Maintainer: Partha Pratim Gogoi 160270614+rugbedbugg@users.noreply.github.com
pkgname=reagent
pkgver=0.2.0
pkgrel=1
pkgdesc="Agentic retrosynthesis planner scoring routes on seven objectives with RDKit-grounded chemistry"
arch=('x86_64')
url="https://github.com/rugbedbugg/ReAgent"
license=('Apache-2.0')
# Arch's python is 3.14. RDKit, ONNX Runtime and AiZynthFinder cap out at 3.12,
# and none of the three is packaged for Arch at all, so this installs a
# self-contained venv on python311 under /opt rather than into site-packages.
depends=('python311' 'glibc' 'gcc-libs')
optdepends=('ollama: score routes with a local model via --local')
# !strip: the venv carries upstream manylinux .so files (RDKit, ONNX Runtime,
#   NumPy, SciPy). They are already stripped by their publishers, and running
#   strip over vendored wheels risks breaking them for no size win.
# !debug: nothing here is compiled from source, so there are no debug symbols
#   to split out.
options=('!strip' '!debug')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/reagent-$pkgver.tar.gz"
        'requirements.lock'
        'reagent.sh'
        'reagent-download-data.sh')
sha256sums=('8105e34e4c594c175a9fbf5b2070da520358efc2efeeb9ac2dd47ebcf649c696'
            '77e6ec5e25d9255824884e5b360797bd0c69501230d525ada52d198384aa75c6'
            '583982a4cd3c6f918313a1520ad3fad40a87025be4ba76e40a24b57d6158598f'
            '86688a17f0a5c685a67dfc40fed579150d89845014e3af904518a0568273c6af')

_srcdir="$pkgname-$pkgver"
_venv="venv"
_prefix="/opt/$pkgname"

build() {
    cd "$srcdir"

    python3.11 -m venv "$_venv"

    # Every runtime dependency is pinned by digest in requirements.lock, which
    # is generated from the repository's uv.lock. --require-hashes makes pip
    # refuse anything that does not match, so the build cannot silently drift
    # when a version is yanked or re-uploaded.
    "$_venv/bin/pip" install --upgrade --quiet pip
    "$_venv/bin/pip" install --quiet --require-hashes -r requirements.lock

    # ReAgent itself, from the release sdist. --no-deps because the line above
    # already installed the full closure at the pinned versions; letting pip
    # resolve again here would be a second, unpinned resolution.
    "$_venv/bin/pip" install --quiet --no-deps "$srcdir/$_srcdir"
}

check() {
    cd "$srcdir/$_srcdir"

    # pytest is a dev extra, so it is absent from requirements.lock by design.
    # Install it beside the venv rather than into it and reach it through
    # PYTHONPATH: package() copies the venv verbatim, and test tooling has no
    # business shipping to users.
    "$srcdir/$_venv/bin/pip" install --quiet --target "$srcdir/checkdeps" pytest
    PYTHONPATH="$srcdir/checkdeps" "$srcdir/$_venv/bin/python" -m pytest -q tests
}

package() {
    cd "$srcdir"

    install -d "$pkgdir$_prefix"
    cp -a "$_venv/." "$pkgdir$_prefix/"

    # A venv records the path it was created at, in the shebang of every
    # console script and in pyvenv.cfg. Those all currently point into
    # $srcdir, which will not exist on the user's machine. Rewrite them to the
    # install prefix. -I skips the binaries, and recursion does not follow the
    # bin/python symlinks, so only real text files are touched.
    grep -rIl "$srcdir/$_venv" "$pkgdir$_prefix/bin" | while read -r script; do
        sed -i "s|$srcdir/$_venv|$_prefix|g" "$script"
    done
    sed -i "s|$srcdir/$_venv|$_prefix|g" "$pkgdir$_prefix/pyvenv.cfg"

    # pyvenv.cfg also records whichever python3.11 was on PATH when the venv
    # was created, which is only /usr/bin on a machine that resolved
    # python3.11 to the python311 package. A build host with pyenv, mise or
    # asdf ahead of it on PATH would otherwise bake in a path that does not
    # exist for the person installing. depends=('python311') guarantees
    # /usr/bin/python3.11 at runtime, so pin it.
    sed -i -e "s|^home = .*|home = /usr/bin|" \
           -e "s|^executable = .*|executable = /usr/bin/python3.11|" \
           -e "s|^command = .*|command = /usr/bin/python3.11 -m venv $_prefix|" \
           "$pkgdir$_prefix/pyvenv.cfg"

    # Bytecode was compiled against the build path. Drop it and recompile with
    # -d so tracebacks name the installed location; /opt is not writable by the
    # user running reagent, so an uncached venv would recompile on every call.
    # pip records the directory it installed ReAgent from, which is $srcdir.
    # Nothing reads it here and it trips makepkg's reference check.
    rm -f "$pkgdir$_prefix"/lib/python3.11/site-packages/*.dist-info/direct_url.json

    find "$pkgdir$_prefix" -name '__pycache__' -type d -prune -exec rm -rf {} +
    python3.11 -m compileall -q -d "$_prefix" "$pkgdir$_prefix/lib" || true

    install -Dm755 reagent.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 reagent-download-data.sh "$pkgdir/usr/bin/$pkgname-download-data"

    install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
