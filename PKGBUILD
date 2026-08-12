# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

# Hybrid deepTools package:
#   * official-repo deps (numpy/scipy/matplotlib/plotly/numpydoc) -> pacman (depends)
#   * everything else (deepTools + pysam/pyBigWig/py2bit/deeptoolsintervals) -> uv venv
# Rule: only deps in the official repos reuse the system; the rest are bundled.

pkgname=deeptools
pkgver=3.5.6
pkgrel=1
pkgdesc="Tools to process and analyze deep sequencing data (ChIP-seq, ATAC-seq, RNA-seq, etc.)"
arch=('x86_64')
url="https://github.com/deeptools/deepTools"
license=('GPL3')
# Only what the OFFICIAL repos provide comes from pacman:
depends=('python'
         'python-numpy' 'python-scipy' 'python-matplotlib'
         'python-plotly' 'python-numpydoc')
makedepends=('uv')
options=('!strip')
_site=/opt/$pkgname

package() {
    # 1) venv on the system interpreter, WITH system site-packages visible so
    #    the official numpy/scipy/matplotlib/plotly/numpydoc are importable.
    UV_PYTHON_PREFERENCE=only-system uv venv --system-site-packages "$pkgdir$_site"

    # 2) Install ONLY deepTools + the deps NOT in the official repos.
    #    --no-deps: never drag numpy/scipy/etc. into the venv; reuse system ones.
    UV_PYTHON_PREFERENCE=only-system uv pip install \
        --python "$pkgdir$_site/bin/python" --no-deps \
        "deepTools==$pkgver" pysam pyBigWig py2bit deeptoolsintervals

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
}
