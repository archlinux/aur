# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

_google_breakpad_commit=9474c3f7f9939391f281d46c42bfe20cc0f0abd9
_google_mock_commit=17945db42c0b42496b2f3c6530307979f2e2a5ce
_google_test_commit=50d6fc317c843a2e40dbf08c2efd3f068801ae6d
_SequenceParsing_commit=3c93fcc488632b0bdfeee3181586809932357598
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=natron-compositor
pkgver=2.4.3
pkgrel=2
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

_pkgname=${pkgname%-*}
_pkgname=${_pkgname^}
_pkgname="${_pkgname}-${pkgver}"
_url="https://github.com/NatronGitHub"

source=("${_pkgname}.tar.gz::${_url}/${_pkgname%-*}/archive/refs/tags/v${pkgver}.tar.gz"
        "openfx-${_pkgname}.tar.gz::${_url}/openfx/archive/refs/tags/${_pkgname}.tar.gz"
        "OpenColorIO-Configs-${_pkgname%-*}-v${pkgver%.*}.tar.gz::${_url}/OpenColorIO-Configs/archive/refs/tags/${_pkgname%-*}-v${pkgver%.*}.tar.gz"
        "google-breakpad-${_google_breakpad_commit}.tar.gz::${_url}/google-breakpad/archive/${_google_breakpad_commit}.tar.gz"
        "google-mock-${_google_mock_commit}.tar.gz::${_url}/google-mock/archive/${_google_mock_commit}.tar.gz"
        "google-test-${_google_test_commit}.tar.gz::${_url}/google-test/archive/${_google_test_commit}.tar.gz"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/archive/${_SequenceParsing_commit}.tar.gz"
	"tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz")
sha512sums=('50339d72f4ba57f63ccc15a3a28badb3f4fbd840497a2840b55132d965583f330e6011939631f445a4d0b6120a532bb795a3d53e3f61dd698ec073c50e15e954'
            '56fc96d0820d053940336ef3ae9fee4e4386e90c9cede6e5450de66c92220f2670f12b25dfb17aaec621001db140281ab47ee8f3fa5e5915a56cfefe2be813fe'
            '1e2c20a2ccc597aec8c69352f2b0533f75afcceda427247346b64752ce0de82631ab89f47ff182c326e12d3fce2efda8ee846d6768cb8cfcb27e3da6e2399e78'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

prepare() {
  mv "OpenColorIO-Configs-Natron-v${pkgver%.*}/" \
     "${_pkgname}/OpenColorIO-Configs/"

  tar -xzf "google-breakpad-${_google_breakpad_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/libs/google-breakpad/"
  tar -xzf "SequenceParsing-${_SequenceParsing_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/libs/SequenceParsing/"
  tar -xzf "tinydir-${_tinydir_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/libs/SequenceParsing/tinydir/"
  tar -xzf "google-mock-${_google_mock_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/Tests/google-mock/"
  tar -xzf "google-test-${_google_test_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/Tests/google-test/"

  tar -xzf "openfx-${_pkgname}.tar.gz" --strip 1 \
      -C   "${_pkgname}/libs/OpenFX/"

#  mv "config.pri" \
#     "${_pkgname}/config.pri"
  mv "${_pkgname}/build-configs/arch-linux/config.pri" \
     "${_pkgname}"
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
