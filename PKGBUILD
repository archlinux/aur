# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Christoph Robbert <chrobbert@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: jrutila
# Contributor: grimi <grimi@poczta.fm>
# Contributor: jht <stefano@inventati.org>


pkgname=wxglade-git
pkgver=1.1.0b1.r10.g38c866b
pkgrel=2
pkgdesc='wxGlade is a GUI builder written in Python for the GUI toolkit wxWidgets/wxPython'
arch=('any')
license=('MIT')
url='https://github.com/wxGlade/wxGlade'

depends=(
  'python>=3.4'
  'python-wxpython>=2.8'
  'hicolor-icon-theme'
)

optdepends=(
  'desktop-file-utils: pacman hooks for updating desktop database'
  'shared-mime-info: pacman hooks for updating mime database'
)

makedepends=(
  'icoutils'
)

conflicts=(
  'wxglade'
)

source=(
  "${pkgname}::git+https://github.com/wxGlade/wxGlade.git"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd ${pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd ${pkgname}
  command -p python setup.py build

  icotool --extract --output=${srcdir} icons/wxglade*.ico
}

package() {
  cd ${pkgname}
  _pkgname=${pkgname%-git}

  command -p python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 "${srcdir}/${pkgname}/wxglade-mime.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
  install -Dm644 "${srcdir}/${pkgname}/wxGlade.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  find "${srcdir}" -maxdepth 1 -name "${_pkgname}*128*.png" \
    -execdir install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" \; \
    -execdir install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/application-x-wxg.png" \;

  find "${srcdir}" -maxdepth 1 -name "${_pkgname}*32*.png" \
    -execdir install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png" \; \
    -execdir install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/application-x-wxg.png" \;
}
# vim: set sw=2 ts=2 et:
