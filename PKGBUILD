# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="spinvis"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="A visualization program for spins."
arch=("any")
url="https://github.com/sciapp/spinvis"
license=("MIT")
depends=("python" "python-gr-framework" "python-numpy" "python-pyqt5")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/spinvis/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/sciapp/spinvis/v${pkgver}/icon.png")
sha256sums=("5b2f7fa803d2347cf25973dd3eb458388fe776c3c2ef17f1b6245ea5c0813cf3"
            "136d8aaf4aaff1d9c770d5caf13e63c87022dedc51394a7cb7f56e2e65020aef")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build && \
    cd "${pkgdir}" && \
    mkdir -p usr/share/applications usr/share/pixmaps && \
    cat <<-EOF > "usr/share/applications/spinvis.desktop" || return
		[Desktop Entry]
		Categories=Science;
		Comment=A visualization program for spins
		Exec=spinvis
		GenericName=SpinVis
		Icon=spinvis
		Name=SpinVis
		Terminal=false
		Type=Application
		Version=${pkgver}
	EOF
    cp -v "${srcdir}/icon.png" "usr/share/pixmaps/spinvis.png"
}
