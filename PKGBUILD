# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

pkgname=natron-compositor-git
pkgver=v2.4.0.r6.g4007f810d
pkgrel=1
pkgdesc="Open source compositing software"
arch=('x86_64')
url="https://natrongithub.github.io/"
license=('GPL')
depends=('boost-libs' 'cairo' 'glfw-x11' 'python2-pyside')
makedepends=('boost' 'expat' 'openmp')
optdepends=('openfx-arena: Extra OpenFX plugins for Natron'
            'openfx-gmic: OpenFX wrapper for the GMIC framework'
            'openfx-io: Readers/Writers plugins'
            'openfx-misc: Miscellaneous OpenFX plugins')

_pkgname=${pkgname%%-*}
_url="https://github.com/NatronGitHub"

conflicts=("${_pkgname}")

source=("${_pkgname}::git+${_url}/${_pkgname^}"
        "openfx::git+${_url}/openfx"
        "OpenColorIO-Configs::git+${_url}/OpenColorIO-Configs"
        "google-breakpad::git+${_url}/google-breakpad"
        "google-mock::git+${_url}/google-mock"
        "google-test::git+${_url}/google-test"
        "SequenceParsing::git+${_url}/SequenceParsing"
        "tinydir::git+${_url}/tinydir"
        "config.pri")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '48017b7b9cd1854064b9ddffecedef89a4d38070f9a7d2cd506aad481a8061c5cffe5e5c84fc9b0ac5216fc99e093481db367e91ce52cb2a8a66223c4209402a')

prepare() {
  mv -f OpenColorIO-Configs config.pri ${_pkgname}

  cd ${_pkgname}
  git submodule init
  git config submodule.libs/google-breakpad.url $srcdir/google-breakpad
  git config submodule.libs/OpenFX.url $srcdir/openfx
  git config submodule.libs/SequenceParsing.url $srcdir/SequenceParsing
  git config submodule.Tests/google-mock.url $srcdir/google-mock
  git config submodule.Tests/google-test.url $srcdir/google-test
  git submodule update

  cd libs/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
}

build() {
  cd "${_pkgname}"

  [[ -d build ]] && rm -r build; mkdir build; cd build

  qmake-qt4 -r ../Project.pro \
               PREFIX=/usr \
               BUILD_USER_NAME="Arch_Linux" \
               CONFIG+=custombuild \
               CONFIG+=openmp \
               DEFINES+=QT_NO_DEBUG_OUTPUT \
               QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
               QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
               QMAKE_LFLAGS_RELEASE="${LDFLAGS}"

  make
}

package() {
  cd "${_pkgname}/build"
  make INSTALL_ROOT="${pkgdir}" install
  
  install -d "${pkgdir}/usr/share/Natron/Plugins/"
  cp -r "../Gui/Resources/PyPlugs" \
        "${pkgdir}/usr/share/Natron/Plugins/"

  install -d "${pkgdir}/etc/profile.d"
  echo -e "export FONTCONFIG_PATH=/etc/fonts\n" > "${pkgdir}/etc/profile.d/${pkgname%-*}.sh"
  echo -e "setenv FONTCONFIG_PATH /etc/fonts\n" > "${pkgdir}/etc/profile.d/${pkgname%-*}.csh"
}
