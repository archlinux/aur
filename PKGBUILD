# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sholum <wallyssonryu@gmail.com>
# Contributor: Groctel <aur@taxorubio.com>
_base=manim
pkgname=${_base}-git
pkgver=0.18.0.r33.g9b18a861s
pkgrel=1
pkgdesc="Animation engine for explanatory math videos"
arch=(any)
url="https://www.${_base}.community"
license=(MIT)
depends=(python-click python-cloup python-decorator python-isosurfaces
  python-manimpango python-mapbox-earcut python-moderngl-window python-networkx
  python-cairo python-pydub python-rich python-scipy python-screeninfo
  python-skia-pathops python-srt python-svgelements python-tqdm python-watchdog sox)
makedepends=(python-build python-installer python-setuptools python-poetry-core python-wheel git)
checkdepends=(python-pytest-cov python-pytest-xdist xorg-server-xvfb
  texlive-latexrecommended texlive-latexextra texlive-binextra texlive-mathscience)
optdepends=('texlive-latexrecommended: latex support'
  'texlive-latexextra: latex support'
  'python-dearpygui: dearpygui integration')
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
    -k 'not manim_checkhealth_subcommand and not force_window_opengl_render_with_format and not whitespace_text_creatio and not Text2Color and not code_indentation and not font_size and not IntegerTable and not DecimalTable and not special_tags_markup and not non_empty_text_creation and not empty_text_creation and not run_time_for_non_empty_text and not shift_family and not bracelabel_copy and not movingcamera_auto_zoom and not ghost_vectors_len_and_types and not set_value_size'
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE* -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
