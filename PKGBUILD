# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

_google_breakpad_commit=9474c3f
_google_mock_commit=17945db
_google_test_commit=50d6fc3
_SequenceParsing_commit=1bbcd07
_tinydir_commit=3aae922

pkgname=natron
_pkgname=Natron
pkgver=2.3.15
pkgrel=1
pkgdesc="Open source compositing software"
arch=('i686' 'pentium4' 'x86_64')
url="https://natrongithub.github.io/"
_url="https://github.com/NatronGitHub"
license=('GPL')
depends=('openfx-arena' 'openfx-gmic' 'openfx-io' 'openfx-misc' 'python2-pyside')
makedepends=('boost' 'glfw-x11' 'openmp')
optdepends=('natron-plugins-git: Extra Python plugins')
source=("${_pkgname}-${pkgver}.tar.gz::${_url}/${_pkgname}/archive/v${pkgver}.tar.gz"
        "google-breakpad-${_google_breakpad_commit}.tar.gz::${_url}/google-breakpad/tarball/${_google_breakpad_commit}"
        "google-mock-${_google_mock_commit}.tar.gz::${_url}/google-mock/tarball/${_google_mock_commit}"
        "google-test-${_google_test_commit}.tar.gz::${_url}/google-test/tarball/${_google_test_commit}"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/tarball/${_SequenceParsing_commit}"
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/tarball/${_tinydir_commit}"
        "OpenColorIO-Configs-${_pkgname}-v${pkgver%.??}.tar.gz::${_url}/OpenColorIO-Configs/archive/${_pkgname}-v${pkgver%.??}.tar.gz"
        "openfx-${_pkgname}-${pkgver}.tar.gz::${_url}/openfx/archive/${_pkgname}-${pkgver}.tar.gz"
        "config.pri")
sha512sums=('10492d698124fee5ade0806a094534846a0b6a4ee1f0e5683eb6f93570eecb5c39792eb393f387deeb484513c37bfe1e635f509d51a682937f0c77f26af76c6f'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0c63a5f52aa7b8d32ed068a1f9f1092082f70e9a95b916b33213d899fd9dd4e487af3baa4d6bfbd9eb4d5051e6efef15155e3a22897f8ec32330d0825df643be'
            '86aa7a675b64c6d7c100ecc4f49c29e834ccf08246e6ce11c4b92b51bb2fce73304a78e91f06c7eb72b18ca89084357816dd09238fdefb1998da57196e723b0d'
            '48017b7b9cd1854064b9ddffecedef89a4d38070f9a7d2cd506aad481a8061c5cffe5e5c84fc9b0ac5216fc99e093481db367e91ce52cb2a8a66223c4209402a')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  if [ -d OpenColorIO-Configs ]; then
    rm -rf OpenColorIO-Configs
  fi
  
  mv "${srcdir}/OpenColorIO-Configs-Natron-v${pkgver%.??}" \
     "${srcdir}/${_pkgname}-${pkgver}/OpenColorIO-Configs"

  tar -xzf "${srcdir}/google-breakpad-${_google_breakpad_commit}.tar.gz" --strip 1 \
      -C   "${srcdir}/${_pkgname}-${pkgver}/libs/google-breakpad/"
  tar -xzf "${srcdir}/SequenceParsing-${_SequenceParsing_commit}.tar.gz" --strip 1 \
      -C   "${srcdir}/${_pkgname}-${pkgver}/libs/SequenceParsing/"
  tar -xzf "${srcdir}/tinydir-${_tinydir_commit}.tar.gz" --strip 1 \
      -C   "${srcdir}/${_pkgname}-${pkgver}/libs/SequenceParsing/tinydir/"
  tar -xzf "${srcdir}/google-mock-${_google_mock_commit}.tar.gz" --strip 1 \
      -C   "${srcdir}/${_pkgname}-${pkgver}/Tests/google-mock/"
  tar -xzf "${srcdir}/google-test-${_google_test_commit}.tar.gz" --strip 1 \
      -C   "${srcdir}/${_pkgname}-${pkgver}/Tests/google-test/"

  tar -xzf "${srcdir}/openfx-${_pkgname}-${pkgver}.tar.gz" --strip 1 \
      -C   "${srcdir}/${_pkgname}-${pkgver}/libs/OpenFX/"

  mv "${srcdir}/config.pri" \
     "${srcdir}/${_pkgname}-${pkgver}/config.pri"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  [[ -d build ]] && rm -r build; mkdir build; cd build

  qmake-qt4 -r "${srcdir}/${_pkgname}-${pkgver}/Project.pro" \
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
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make INSTALL_ROOT="${pkgdir}" install
  
  install -d "${pkgdir}/usr/share/Natron/Plugins/"
  cp -r "${srcdir}/${_pkgname}-${pkgver}/Gui/Resources/PyPlugs" \
        "${pkgdir}/usr/share/Natron/Plugins/"

  install -d "${pkgdir}/etc/profile.d"
  echo -e "export FONTCONFIG_PATH=/etc/fonts\n" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo -e "setenv FONTCONFIG_PATH /etc/fonts\n" > "${pkgdir}/etc/profile.d/${pkgname}.csh"
}
