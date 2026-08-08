# Maintainer: Yardena Cohen <yardenack@gmail.com>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Francois Boulogne <devel at sciunto dot org>

gitname=mat2
pkgname=${gitname}-git
pkgver=0.15.0
pkgrel=1
pkgdesc='Metadata removal tool, supporting a wide range of commonly used file formats'
url="https://github.com/jvoisin/${gitname}"
arch=('any')
license=('LGPL-3.0-or-later')
depends=(
  gdk-pixbuf2
  hicolor-icon-theme
  librsvg
  mailcap
  perl-image-exiftool
  poppler-glib
  python
  python-cairo
  python-gobject
  python-mutagen
  zenity
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  git
)
optdepends=(
  'ffmpeg: video support'
  'bubblewrap: sandboxing support'
  'kdialog: dolphin file browser integration'
)
checkdepends=(
  ffmpeg
  python-pytest
)
conflicts=(mat mat-git mat2)
provides=(mat mat-git mat2)
source=("git+${url}.git")
sha512sums=('SKIP')
validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC') # Julien (jvoisin) Voisin

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags | sed 's|-|\.|g')"
    printf "%s" "${ver//-/.}"
}
build() {
    cd "${srcdir}/${gitname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${gitname}"
    pytest -vv --deselect tests/test_libmat2.py::TestCleaning::test_all_parametred \
      --deselect tests/test_climat2.py::TestControlCharInjection::test_jpg \
      --deselect tests/test_corrupted_files.py::TestCorruptedFiles::test_wrong_tif
}

package() {
    cd "${srcdir}/${gitname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 dolphin/mat2.desktop -t "${pkgdir}/usr/share/kio/servicemenus"
    install -vDm 644 nemo/mat2.nemo_action -t "${pkgdir}/usr/share/nemo/actions"
    install -vDm 644 data/mat2.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -vDm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
