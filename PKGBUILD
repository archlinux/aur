# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="pymoldyn"
pkgver="0.11.1"
pkgrel="1"
pkgdesc="A molecule viewer with cavity computation."
arch=("x86_64")
url="https://github.com/sciapp/pyMolDyn"
license=("MIT")
depends=(
    "pyside6"
    "python-dateutil"
    "python-gr-framework"
    "python-h5py"
    "python-jinja"
    "python-numpy"
    "python-opengl"
)
makedepends=(
    "python-build"
    "python-gr-framework"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("https://github.com/sciapp/pyMolDyn/archive/v${pkgver}.tar.gz")
sha256sums=("9b3dbb0356ad87810ab0da3250e37d70fac68433a78e5b98ea1643c25c39a75b")

build() {
    cd "${srcdir}/pyMolDyn-${pkgver}" || return
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/pyMolDyn-${pkgver}" || return
    python -m installer --destdir="${pkgdir}" dist/*.whl && \
    cd "${pkgdir}" || return
    mkdir -p \
        usr/share/applications \
        usr/share/pixmaps && \
    cp -v "${srcdir}/pyMolDyn-${pkgver}/pymoldyn/icon.png" "usr/share/pixmaps/pymoldyn.png" && \
    cat <<-EOF > "usr/share/applications/pyMolDyn.desktop" || return
		[Desktop Entry]
		Categories=Science;
		Comment=A molecule viewer with cavity computation
		Exec=pymoldyn
		GenericName=pyMolDyn
		Icon=pymoldyn
		Name=PyMolDyn
		Terminal=false
		Type=Application
		Version=${pkgver}
	EOF
}
