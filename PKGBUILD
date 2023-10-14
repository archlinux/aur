# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sholum <wallyssonryu@gmail.com>
# Contributor: Groctel <aur@taxorubio.com>
_base=manim
pkgname=${_base}-git
pkgver=0.17.3.r45.g7fab9cdbf
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://www.${_base}.community"
license=(MIT)
depends=(python-click-default-group python-scipy python-manimpango python-networkx
  python-svgelements python-screeninfo python-isosurfaces python-cloup python-moderngl-window
  python-rich python-mapbox-earcut python-decorator python-srt python-tqdm python-watchdog
  python-pydub python-skia-pathops python-cairo ffmpeg sox)
makedepends=(python-build python-installer python-poetry-core python-wheel git)
checkdepends=(python-pytest-cov python-pytest-xdist xorg-server-xvfb
  texlive-latexrecommended texlive-latexextra texlive-binextra texlive-mathscience)
optdepends=('texlive-latexrecommended: latex support'
  'texlive-latexextra: latex support'
  'texlive-bibtexextra: latex support'
  'tllocalmgr: latex support')
source=(git+https://github.com/ManimCommunity/${_base}.git#branch=main)
sha512sums=('SKIP')
provides=(${_base})
conflicts=(${_base})

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # https://github.com/dimkir/nightmare-lambda-tutorial/issues/10#issuecomment-947244559
  Xvfb $DISPLAY -screen 0 1280x1024x24 &
  test-env/bin/python -m pytest \
    --ignore=tests/test_graphical_units \
    -k 'not good_markup and not font_size and not transparent and not graph_add_vertices and not code_indentation and not background_color and not special_tags_markup and not custom_dirs and not dry_run_with_png_format and not dry_run_with_png_format_skipped_animations and not graph_add_vertices and not good_markup and not special_tags_markup and not font_size and not manim_checkhealth_subcommand and not force_window_opengl_render_with_format and not manim_new_command'
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
