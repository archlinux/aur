# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=cavalcade-git
pkgver=0.8.r13.g5a41710
pkgrel=1
pkgdesc="GUI wrapper for C.A.V.A. utility"
arch=("any")
url="https://github.com/worron/cavalcade"
license=("GPL")
depends=("cava>=0.6"
         "gtk3>=3.18"
         "python>=3.5"
         "python-cairo"
         "python-gobject")
makedepends=("git" "python-setuptools")
optdepends=("gstreamer>=1.0: audio player support"
            "gst-plugins-good: required plugins for gstreamer"
            "python-pillow: auto color detection support")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/worron/cavalcade.git#branch=devel"
        "python311.patch")
b2sums=("SKIP"
        "81467e5db23914aa20c9a8f5cf0c0f284b46896c1958e0b27d7455f63c1b475388224fcb500b7878b4f342be63ef15b50306d6312108813bf49e08b2db1d076b")

pkgver() {
  printf "%s" \
    $(git -C "${pkgname}" describe --long --tags \
      | sed "s/\([^-]*-g\)/r\1/;s/-/./g")
}

prepare() {
  patch --forward --strip=1 \
    --directory="${pkgname}" \
    --input="${srcdir}/python311.patch"
}

build() {
  cd "${pkgname}"

  python "setup.py" build
}

package() {
  cd "${pkgname}"

  python "setup.py" install \
    --optimize=1 \
    --prefix="/usr/" \
    --root="${pkgdir}" \
    --skip-build
}
