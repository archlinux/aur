# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: hbdee <hbdee.arch@gmail.com>

_pkgname=hydrogen
pkgname="${_pkgname}-git"
pkgver=1.0.0.r90.g051e723e
pkgrel=1
pkgdesc="An advanced drum machine (git version)"
arch=('x86_64')
license=('GPL')
groups=('pro-audio')
url="https://github.com/hydrogen-music/hydrogen"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt5-base' 'qt5-xmlpatterns')
makedepends=('git' 'alsa-lib' 'cmake' 'jack' 'ladspa' 'libarchive' 'liblo'
             'liblrdf' 'libpulse' 'libsndfile' 'portaudio' 'portmidi' 'python'
             'qt5-tools' 'docbook-xml' 'docbook-sgml' 'docbook-utils'
             'docbook-xsl' 'poxml' 'xmlto')
optdepends=('new-session-manager: for session management')
source=("${_pkgname}"::'git://github.com/hydrogen-music/hydrogen.git'
        "hydrogen-docs::git+https://github.com/hydrogen-music/documentation.git"
        'fix_dtd_version.patch')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
md5sums=('SKIP'
         'SKIP'
         '67122f71e3be7546d0b483f6fc923b19')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build

  # link docs sources
  git submodule init
  git config submodule.doc.url "${srcdir}/hydrogen-docs"
  git submodule update

  # update docbook dtd version
  patch -Np1 -r - -i "${srcdir}/fix_dtd_version.patch" || true

  # fix *.qm file installation path
  sed -i 's|\./data/i18n|${H2_DATA_PATH}/data/i18n|' data/i18n/CMakeLists.txt
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake .. \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_CPPUNIT=OFF \
    -DWANT_DEBUG=OFF \
    -DWANT_LASH=OFF \
    -DWANT_LRDF=ON \
    -DWANT_PORTAUDIO=ON \
    -DWANT_PORTMIDI=ON \
    -DWANT_PULSEAUDIO=ON \
    -Wno-dev
    make
  # build html manual & tutorial
  cd "${srcdir}/${_pkgname}/data/doc"
  make
  # update translations
  cd "${srcdir}/${_pkgname}/data/i18n"
  ./updateTranslations.sh
}

package() {
  depends+=('libarchive.so' 'libasound.so' 'liblo.so' 'libjack.so' 'liblrdf.so'
            'liblo.so' 'libportaudio.so' 'libportmidi.so' 'libpulse.so'
            'libsndfile.so')
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  # install docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 ../{ChangeLog,DEVELOPERS,INSTALL.md,README.txt}
  # install html manual & tutorial
  cd "${srcdir}/${_pkgname}/data/doc"
  install -Dm644 *.html -t "${pkgdir}/usr/share/${_pkgname}/data/doc"
  install -Dm644 img/*.png img/*.h2song -t "${pkgdir}/usr/share/${_pkgname}/data/doc/img"
  install -Dm644 img/nl/*.png -t "${pkgdir}/usr/share/${_pkgname}/data/doc/img/nl"
  install -Dm644 img_tutorial/*.png -t "${pkgdir}/usr/share/${_pkgname}/data/doc/img_tutorial"
}

# vim:set ts=2 sw=2 et:
