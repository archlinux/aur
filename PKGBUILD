# Maintainer: Yardena Cohen <yardenack@gmail.com>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Francois Boulogne <devel at sciunto dot org>

gitname=mat2
pkgname=${gitname}-git
pkgver=0.13.5.10.g235403b
pkgrel=1
pkgdesc='Metadata removal tool, supporting a wide range of commonly used file formats'
url='https://github.com/jvoisin/mat2'
arch=('any')
license=('LGPL3')
depends=('python' 'python-mutagen' 'python-cairo' 'python-gobject' 'gdk-pixbuf2' 'poppler-glib' 'librsvg' 'perl-image-exiftool' 'mailcap')
makedepends=('python-setuptools' git)
optdepends=(
  'ffmpeg: video support'
  'bubblewrap: sandboxing support'
)
checkdepends=('ffmpeg')
conflicts=(mat mat-git mat2)
provides=(mat mat-git mat2)
source=("git+https://0xacab.org/jvoisin/${gitname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags | sed 's|-|\.|g')"
    printf "%s" "${ver//-/.}"
}
build() {
    cd "${srcdir}/${gitname}"
    export PYTHONHASHSEED=0
    python setup.py build
}

check() {
    cd "${srcdir}/${gitname}"
    python -m unittest discover -v
}

package() {
    cd "${srcdir}/${gitname}"
    python setup.py install --skip-build -O1 --root="${pkgdir}"
    install -Dm 644 dolphin/mat2.desktop -t "${pkgdir}/usr/share/kservices5/ServiceMenus"
    install -Dm 644 doc/mat2.1 -t "${pkgdir}/usr/share/man/man1"
    install -Dm 644 doc/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
