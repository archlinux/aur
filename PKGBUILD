# Maintainer: dreieck

_pkgname='monav-light'
pkgname="${_pkgname}-git"
epoch=1
pkgver=0.1+6+r40.20160309.489ef8f
pkgrel=1
pkgdesc="A lightweight and platform independent offline routing software that works on pre-processed OpenStreetMap data and uses JSON for input and output."
url='https://github.com/M4rtinK/monav-light/'
arch=('i686' 'x86_64')
license=(GPL3)

backup=(
)

depends=(
  'qt5-base'
  ### The following are needed by the preprocessor:
  # 'bzip2'
  # 'libxml2'
  # 'mapnik'
  # 'protobuf'
)

makedepends=(
  'git'
  'qt5-base'
)

optdepends=(
)

provides=(
  "${_pkgname}=${pkgver}"
  "monav-client"
  # "monav-daemon"
  # "monav-preprocessor"
  # "monav-preprocessor-gui"
  "monav"
)

replaces=(
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "monav-client"
  # "monav-daemon"
  # "monav-preprocessor"
  # "monav-preprocessor-gui"
  "monav"
)

_source_base="https://github.com/M4rtinK/monav-light/"

source=(
  "${_pkgname}::git+${_source_base}"
)

sha256sums=(
  "SKIP"
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -e 's|monav-light-||' -e 's|-g[0-9a-f]*||g' | tr '-' '+' | tr -d '[[:space:]]v')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  qmake monav-light.pro
  make
  
#   qmake monavpreprocessor-gui.pro
#   make
#   
#   qmake DEFINES+=NOGUI monavpreprocessor.pro
#   make

}

package() {
  
#   _incdirbase="/usr/include"
#   _incdir="${pkgdir}${_incdirbase}"
  
  _bindirbase="/usr/bin"
  _bindir="${pkgdir}${_bindirbase}"
  
  install -v -m755 -D "${srcdir}/${_pkgname}/bin/monav-light" "${_bindir}/monav-light"
  
  cd "${_bindir}"
  ln -sv monav-light monav
  
  install -v -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
