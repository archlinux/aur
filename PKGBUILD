# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=braille-printer-app
pkgname="${_pkgname}-git"
pkgver=2.0b1+r7111.20241209.272d5471
pkgrel=1
pkgdesc="Braille Printer Application"
url='https://github.com/OpenPrinting/braille-printer-app'
license=("Apache-2.0")
arch=('x86_64')
depends=(
  'bash'
  'glibc'
  'libmagic.so'  # Provided by 'file'.
  'libcups'
  'libcupsfilters'
  'pappl'
)
optdepends=(
  "liblouis:        for musicxml files and backup Braille translations ('lou_translate')"
  "liblouisutdml:   for text files and best Braille translations ('file2brl')"
  "imagemagick:     for raster images ('convert')"
  "poppler:         for PDF files ('pdftotext')"
  "inkscape:        for vector images"
  "lynx:            for html files"
  "antiword:        for MS Word doc files"
  "cups-filters>=2: for possible input file's conversion into formats which Braille filters accept"
  "docx2txt:        for MS Word docx files"
  "unzip:           for OpenOffice/Libreoffice file conversions"
  "rtf2txt:         for translating RTF files"
  "freedots:        for better translation of musicxml files ('FreeDots')"
)
makedepends=(
  'git'
  'file'
  'liblouis'
  'liblouisutdml'
  # 'freedots'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "git+${url}.git"
)
sha256sums=(
  'SKIP'
)
options=('emptydirs')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  ./autogen.sh
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed 's|^v||' | sed 's|\-[^-]*$||' | tr '-' '_')"
  _ver="$(grep -E '^[[:space:]]*PACKAGE_VERSION=' configure | sed 's|#.*||' | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf %s "${_ver}+r${_rev}.${_date}.${_hash}"
  else
    error "Could not determine version."
    return 1
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --enable-nls \
    --enable-largefile \
    --disable-werror \
    --enable-braille \
    --enable-musicxml \
    --enable-year2038

  make all
}

package() {
  cd "${srcdir}/${_pkgname}"

  # unitdir="/usr/lib/systemd/system/"

  make DESTDIR="${pkgdir}/" install

  # Fix permissions
  chmod 644 "${pkgdir}/usr/lib/cups/backend/cups-brf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log AUTHORS ChangeLog CHANGES-cups-filters.md CHANGES.md CONTRIBUTING.md DEVELOPING.md INSTALL NEWS README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING LICENSE NOTICE
}
