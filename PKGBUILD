# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=jcvi
pkgver=1.6.6
pkgrel=1
pkgdesc="Python utility libraries on genome assembly, annotation and comparative genomics"
arch=('x86_64')
url="https://github.com/tanghaibao/jcvi"
license=('BSD-3-Clause')

# Official-repo deps (core/extra). They land in the SYSTEM site-packages; the
# bundled venv is created with --system-site-packages so its python finds them
# there at runtime (CPython merges system site-packages into sys.path). This
# avoids bundling numpy/scipy/matplotlib/scikit-image and keeps the package small.
depends=(
    'python' 'file'
    'python-numpy' 'python-scipy' 'python-matplotlib' 'python-seaborn'
    'python-scikit-image' 'python-networkx' 'python-jinja' 'python-rich'
    'python-natsort' 'python-more-itertools' 'python-boto3' 'python-pypdf'
    'python-pytesseract' 'python-graphviz' 'python-wand' 'python-webcolors'
    'imagemagick' 'graphviz' 'tesseract'
)
optdepends=('bedtools: interval operations via pybedtools' 'blast+: BLAST searches')

# Build against the SYSTEM numpy so the compiled Cython extensions match the
# numpy ABI used at runtime (system numpy, via --system-site-packages).
makedepends=(
    'uv'
    'python-build'
    'python-wheel'
    'python-setuptools'
    'python-hatchling'
    'python-hatch-vcs'
    'cython'
    'python-numpy'
)
options=('!strip' '!debug' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d2c3b372c2086dde0c5cfc69b60a3a6a781d955e22de3a87d84d63e184a098e')

_venv="/opt/$pkgname"

build() {
    # Run from $srcdir (the PARENT dir), NOT inside the source tree: jcvi ships a
    # build.py that would shadow `python -m build` via -m module lookup and then
    # silently do nothing. Passing the source dir as an argument avoids that.
    cd "$srcdir"
    # hatch-vcs cannot read git tags from a release tarball, so pretend the version.
    # --no-isolation: compile the Cython extensions against the system numpy.
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
        python -m build --wheel --no-isolation "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"

    # venv that inherits the system site-packages (include-system-site-packages=true):
    # at runtime its python sees the official deps (numpy/scipy/...) from the system.
    uv venv --system-site-packages --python "$(command -v python)" "$pkgdir$_venv"

    # Install jcvi + its full dependency closure into the venv.
    uv pip install --python "$pkgdir$_venv/bin/python" dist/*.whl

    # Strip every package the SYSTEM already provides (the pacman depends + their
    # transitive deps). This guarantees the venv never shadows the system versions
    # and keeps the package small: what stays is only the non-official packages
    # (biopython, pysam, pybedtools, ortools, goatools, ete4, ...). This is the
    # --no-deps idea done automatically -- the venv ends up with zero numpy etc.
    local sys_site venv_site
    sys_site=$(python -c "import site; print(site.getsitepackages()[0])")
    venv_site=$(find "$pkgdir$_venv" -type d -name site-packages -print -quit)
    local strip=() base name
    while IFS= read -r d; do
        base=$(basename "$d" .dist-info)   # e.g. numpy-2.5.1
        name=${base%-*}                    # e.g. numpy (drop version)
        if compgen -G "$sys_site/$name-*.dist-info" >/dev/null \
           || compgen -G "$sys_site/${name//_/-}-*.dist-info" >/dev/null; then
            strip+=("$name")
        fi
    done < <(find "$venv_site" -maxdepth 1 -name '*.dist-info' -type d)
    if ((${#strip[@]})); then
        uv pip uninstall --python "$pkgdir$_venv/bin/python" "${strip[@]}" >/dev/null
    fi

    # Drop the build-path metadata leak (avoids the $srcdir warning).
    rm -f "$venv_site"/jcvi-*.dist-info/direct_url.json

    # Relocate paths baked into venv scripts during build.
    find "$pkgdir$_venv/bin" -type f -exec sed -i "s|$pkgdir||g" {} +
    sed -i "s|$pkgdir||g" "$pkgdir$_venv/pyvenv.cfg"

    # Console wrapper so `jcvi` is on PATH.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec $_venv/bin/$pkgname "\$@"
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
