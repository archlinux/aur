# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3down2
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=3
pkgdesc="Convert markdown segments into images and other transferable media"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3down2"
_pydeps=(
    k3proc # AUR
    playwright
    pillow
    pylatexenc
    pygments
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    python-pytest
    python-k3ut
    python-scikit-image
    python-numpy
    pandoc
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('872d0c621e927dbfbe5dd7211a9836715041e55a499d540e9fa0ef14e4c80366')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"
    export PYTHONPATH="${srcdir}${PYTHONPATH:+:${PYTHONPATH}}"
	# These tests need external tools not available in the build chroot:
	# Playwright's Chromium binary (render_to_img / web_to_png / convert to
	# jpg/png) and node + MathJax (tex_to_*). Keep the pure-Python tests.
	# Note: --deselect matches prefixes, so test_render_to_img also drops
	# its *_closes_page/_raises/_retries siblings.
	pytest -x \
		--deselect=test/test_down2.py::TestTex::test_convert \
		--deselect=test/test_down2.py::TestTex::test_get_browser_after_launch_failure \
		--deselect=test/test_down2.py::TestTex::test_md_to_html_embed_image \
		--deselect=test/test_down2.py::TestTex::test_render_to_img \
		--deselect=test/test_down2.py::TestTex::test_tex_to_img \
		--deselect=test/test_down2.py::TestTex::test_tex_to_svg \
		--deselect=test/test_down2.py::TestTex::test_web_to_png
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
