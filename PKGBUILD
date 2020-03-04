# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="vimtips"
pkgver="0.2.3"
pkgrel="1"
pkgdesc="A tool to aggregate and show vim tips from different sources."
arch=("any")
url="https://github.com/IngoHeimbach/vimtips"
license=("MIT")
depends=("python" "python-pyqt5" "python-pyquery" "python-requests"
         "python-psutil")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/vimtips/archive/v${pkgver}.tar.gz")
sha256sums=("8773d6ef00caadb95c4a7c14c1320f2bf64e1a90d31b37924f064da138239dae")

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
