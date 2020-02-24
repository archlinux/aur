# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>
# Contributor: phi-mah

pkgname=toggldesktop-git
_pkgname=toggldesktop
pkgver=7.5.50.r0.gb3a38da9e
pkgrel=2
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl-open-source/toggldesktop"
license=('BSD')
depends=(
  'libxss'
  'qt5-base'
  'qt5-webengine'
  'qt5-x11extras'
  'openssl'
  'poco'
  'lua'
  'jsoncpp'
)
makedepends=('cmake' 'ninja')
conflicts=("${_pkgname}" "${_pkgname}-bin" 'toggl-bin')
provides=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/toggl-open-source/toggldesktop.git"
  "jsoncpp.patch"
)

sha512sums=(
  'SKIP'
  '05813df185163e1361d99cf24291bd44bdfefeee050b56f2923fb909c2c57d532e0a459cdaea96504ed10d27004fe3ee9f3c34ec35bcc9f9f2e064cccd8cfe77'
)

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"

    # patch to build
    patch -p1  < ../jsoncpp.patch

    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi
}

build() {
  mkdir -p _build && cd _build
  cmake ../${_pkgname} \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr\
    -DTOGGL_VERSION:STRING="${pkgver}"\
    -DTOGGL_PRODUCTION_BUILD=ON\
    -DTOGGL_ALLOW_UPDATE_CHECK=ON\
    -DUSE_BUNDLED_LIBRARIES=OFF
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C _build install

  cd "${_pkgname}"

  # license file in standard location
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

