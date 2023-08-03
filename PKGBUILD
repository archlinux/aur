# Contributor: dreieck        (https://aur.archlinux.org/account/dreieck)
# Contributor: Andrej Radovic (https://aur.archlinux.org/account/andrejr)

_pkgname="kicadlibrarian"
pkgname="${_pkgname}-git"
epoch=1
pkgver=1.4.5907.r47.20210323.c075e16
pkgrel=1
pkgdesc="A utility to manage and maintain KiCad libraries with schematic symbols and footprints"
arch=('i686' 'x86_64')
url="https://github.com/randrej/KiCad-Librarian"
license=('Apache')
depends=(desktop-file-utils wxwidgets-gtk3 curl libharu)
makedepends=(git make cmake)
provides=("kicadlibrarian=${pkgver}")
conflicts=("kicadlibrarian")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"

  mkdir -p build
}

pkgver() {
  cd "$srcdir/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*#define[[:space:]]+SVN_REVSTR[[:space:]]+[^[:space:]]' src/svnrev.h | awk '{print $3}' | tr -d \"\'[[:space:]])"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_rev}" ]; then
    printf %s "${_ver}.r${_rev}.${_date}.${_hash}"
  else
    error "Could not determine version."
    return 1
  fi
}

build() {
  _CFLAGSAPPEND=' -Wno-alloc-size-larger-than' # Silence some warnings.
  CFLAGS+="${_CFLAGSAPPEND}"
  CXXFLAGS+="${_CFLAGSAPPEND}"
  export CFLAGS
  export CXXFLAGS

  cd "$srcdir"
  sed -ie "s#/usr/share/#${pkgdir}/usr/share/#" "$_pkgname/src/CMakeLists.txt"
  cmake \
    -S "$_pkgname/src" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}" \
    -DKiCadLibrarian_USE_CX3D=0 \
    -DKiCadLibrarian_USE_CURL=1

  cd "$srcdir/build"
  make
  sed -ie "s#^Exec=.*\$#Exec=kicadlibrarian#" kicadlibrarian.desktop # The absolute build dir path is hardcoded. We do not want that.
}

package() {
  cd "$srcdir/build"
  install -dm755 "${pkgdir}/usr/share/applications"        # Needed by 'make install'.
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/48x48" # Needed by 'make install'.
  install -dm755 "${pkgdir}/usr/share/mime/packages"       # Needed by 'make install'.
  make install
  install -Dm644 kicadlibrarian.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "$srcdir/$_pkgname"
  install -Dm644 kicadlibrarian32.png "${pkgdir}/usr/share/icons/hicolor/48x48/kicadlibrarian32.png"
  install -Dm644 kicadlibrarian.xml "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"

  cd "$srcdir/$_pkgname"
  install -dm755 "${pkgdir}/usr/bin"
  mv -v "${pkgdir}/bin"/* "${pkgdir}/usr/bin"/
  rmdir "${pkgdir}/bin"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  mv -v "${pkgdir}/doc"/* "${pkgdir}/usr/share/doc/${_pkgname}"/
  rmdir "${pkgdir}/doc"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}/template"
  mv -v "${pkgdir}/template"/* "${pkgdir}/usr/share/${_pkgname}/template"/
  rmdir "${pkgdir}/template"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}/font"
  mv -v "${pkgdir}/font"/* "${pkgdir}/usr/share/${_pkgname}/font"/
  rmdir "${pkgdir}/font"

  for _docfile in 'README.md'; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in 'LICENSE'; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
  done
}
