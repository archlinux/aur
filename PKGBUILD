# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="vimtips"
pkgver="0.2.6"
pkgrel="1"
pkgdesc="A tool to aggregate and show vim tips from different sources."
arch=("any")
url="https://github.com/IngoHeimbach/vimtips"
license=("MIT")
depends=("python" "python-pyqt5" "python-pyquery" "python-requests"
         "python-psutil")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/vimtips/archive/v${pkgver}.tar.gz")
sha256sums=("05b35be8455619e27581c6d51c2c2cc0851bb177e451d8de6b17dc6ec7124405")

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
    mkdir -p opt usr/share/applications usr/share/pixmaps && \
    cat <<-EOF > "usr/share/applications/vimtips.desktop" || return
		[Desktop Entry]
		Categories=Utility;
		Comment=A tool to aggregate and show vim tips from different sources
		Exec=vimtips-gui
		GenericName=VimTips
		Icon=vimtips
		Name=VimTips
		Terminal=false
		Type=Application
		Version=${pkgver}
	EOF
    python_version="$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')" && \
    ln -s "/usr/lib/python${python_version}/site-packages/vimtips/vimlogo.svg" \
          "usr/share/pixmaps/vimtips.svg"
}
