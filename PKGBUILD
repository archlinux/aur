# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Hybrid deepTools package (source-built, same strategy as jcvi):
#   * deepTools itself: built from the pinned PyPI sdist (sha256-verified wheel).
#   * official-repo deps (numpy/scipy/matplotlib/plotly/numpydoc) -> pacman (depends)
#   * everything else (pysam/pyBigWig/py2bit/deeptoolsintervals) -> uv fetches them
# Rule: only deps in the official repos reuse the system; the rest are bundled.

pkgname=deeptools
pkgver=3.5.6
pkgrel=2
pkgdesc="Tools to process and analyze deep sequencing data (ChIP-seq, ATAC-seq, RNA-seq, etc.)"
arch=('x86_64')
url="https://github.com/deeptools/deepTools"
license=('GPL3')
# Only what the OFFICIAL repos provide comes from pacman:
depends=('python'
         'python-numpy' 'python-scipy' 'python-matplotlib'
         'python-plotly' 'python-numpydoc')
makedepends=('uv' 'python-build' 'python-wheel' 'python-setuptools')
options=('!strip')
_site=/opt/$pkgname
# Pinned PyPI sdist (stable version-templated URL, no hash prefix).
source=("deeptools-$pkgver.tar.gz::https://pypi.org/packages/source/d/deeptools/deeptools-$pkgver.tar.gz")
sha256sums=('2daf06abc8cf2df42f7e0ecacb3784ee95de1db4dd887f69f22a29f27e202369')

build() {
    cd "$pkgname-$pkgver"
    # Pure-Python wheel; --no-isolation builds against system setuptools.
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # 1) venv on the system interpreter, WITH system site-packages visible so
    #    the official numpy/scipy/matplotlib/plotly/numpydoc are importable.
    UV_PYTHON_PREFERENCE=only-system uv venv --system-site-packages "$pkgdir$_site"

    # 2) Install the LOCALLY built deepTools wheel (no PyPI fetch for the main
    #    package) plus the deps NOT in the official repos.
    #    --no-deps: never drag numpy/scipy/etc. into the venv; reuse system ones.
    UV_PYTHON_PREFERENCE=only-system uv pip install \
        --python "$pkgdir$_site/bin/python" --no-deps \
        dist/*.whl pysam pyBigWig py2bit deeptoolsintervals

    # 3) Strip the build-time $pkgdir prefix from console-script shebangs.
    find "$pkgdir$_site/bin" -type f -exec sed -i "s|$pkgdir||g" {} +

    # 4) Expose only deepTools' own console scripts under /usr/bin
    #    (skip dependency-provided helpers like sphinx-build).
    install -d "$pkgdir/usr/bin"
    while IFS= read -r name; do
        [[ -e "$pkgdir$_site/bin/$name" ]] &&
            ln -s "$_site/bin/$name" "$pkgdir/usr/bin/$name"
    done < <("$pkgdir$_site/bin/python" - <<'PY'
import importlib.metadata as m
d = m.distribution('deepTools')
for e in d.entry_points:
    if e.group == 'console_scripts':
        print(e.name)
PY
)

    # 5) The python call above re-imports the venv's _virtualenv shim and
    #    regenerates its .pyc (which embeds the build-time $pkgdir path).
    #    Delete it last so the package stays free of $pkgdir references.
    find "$pkgdir$_site" -name '_virtualenv*.pyc' -delete 2>/dev/null

    # 6) Drop the build-path metadata leak from the local-wheel install
    #    (the $srcdir reference makepkg warns about; uv writes direct_url.json
    #    with the file:// path when installing from dist/*.whl).
    find "$pkgdir$_site" -path '*/deeptools-*.dist-info/direct_url.json' -delete

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
