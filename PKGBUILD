# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

_google_breakpad_commit=9474c3f7f9939391f281d46c42bfe20cc0f0abd9
_google_mock_commit=17945db42c0b42496b2f3c6530307979f2e2a5ce
_google_test_commit=50d6fc317c843a2e40dbf08c2efd3f068801ae6d
_SequenceParsing_commit=ab247c293c12066bd31cc1caabeedeac9c387e49
_tinydir_commit=3aae9224376b5e1a23fd824f19d9501162620b53

pkgname=natron-compositor
pkgver=2.4.0
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
conflicts=("${pkgname}-git")

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
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz"
        "config.pri")
sha512sums=('36c731748cc4020a32e17e99bd0ac71fb8b5879ed1e2491b55f05ee1d7cae34c2f0a01dc7a8db8e6a894a5bb1c0989525a71566314ec7895aaa78fb2eeb32459'
            '0a01ea18970a06eb58b03e16f9027a84f37e53581387a0fbd208be16e2fa71f3e0d314307934348e3a7a0c3bc699c36535fd044f18e89a937e9bfca239037096'
            '1e2c20a2ccc597aec8c69352f2b0533f75afcceda427247346b64752ce0de82631ab89f47ff182c326e12d3fce2efda8ee846d6768cb8cfcb27e3da6e2399e78'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '48017b7b9cd1854064b9ddffecedef89a4d38070f9a7d2cd506aad481a8061c5cffe5e5c84fc9b0ac5216fc99e093481db367e91ce52cb2a8a66223c4209402a')

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

  mv "config.pri" \
     "${_pkgname}/config.pri"
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
