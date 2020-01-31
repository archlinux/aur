# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

_google_breakpad_commit=9474c3f
_google_mock_commit=17945db
_google_test_commit=50d6fc3
_openfx_commit=1645fd7
_SequenceParsing_commit=977e36f
_tinydir_commit=3aae922

pkgname=natron
_pkgname=Natron
pkgver=2.3.15_rc15
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Open source compositing software. Node-graph based. Similar in functionalities to Adobe After Effects and Nuke by The Foundry."
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/NatronGitHub/Natron"
license=('GPL')
depends=('openfx-arena' 'openfx-gmic' 'openfx-io' 'openfx-misc' 'python2-pyside')
makedepends=('boost' 'expat' 'glfw-x11' 'openmp' 'pango')
optdepends=('natron-plugins')
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/NatronGitHub/Natron/archive/v$_pkgver.tar.gz"
        "google-breakpad-$_google_breakpad_commit.tar.gz::https://github.com/NatronGitHub/google-breakpad/tarball/$_google_breakpad_commit"
        "google-mock-$_google_mock_commit.tar.gz::https://github.com/NatronGitHub/google-mock/tarball/$_google_mock_commit"
        "google-test-$_google_test_commit.tar.gz::https://github.com/NatronGitHub/google-test/tarball/$_google_test_commit"
        "openfx-$_openfx_commit.tar.gz::https://github.com/NatronGitHub/openfx/tarball/$_openfx_commit"
        "SequenceParsing-$_SequenceParsing_commit.tar.gz::https://github.com/NatronGitHub/SequenceParsing/tarball/$_SequenceParsing_commit"
        "tinydir-$_tinydir_commit.tar.gz::https://github.com/NatronGitHub/tinydir/tarball/$_tinydir_commit"
        "OpenColorIO-Configs-$_pkgname-v${pkgver%.??_*}.tar.gz::https://github.com/NatronGitHub/OpenColorIO-Configs/archive/$_pkgname-v${pkgver%.??_*}.tar.gz"
        "config.pri")
sha512sums=('4e4b10129cf3834df61f1d2b4040cee356bbabf50085afbc554454ba245c17cca50dc3e995ef756da14c3d241b866d4abbb5a799db53d1c863839b1ec5b64291'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0c63a5f52aa7b8d32ed068a1f9f1092082f70e9a95b916b33213d899fd9dd4e487af3baa4d6bfbd9eb4d5051e6efef15155e3a22897f8ec32330d0825df643be'
            '48017b7b9cd1854064b9ddffecedef89a4d38070f9a7d2cd506aad481a8061c5cffe5e5c84fc9b0ac5216fc99e093481db367e91ce52cb2a8a66223c4209402a')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"
  
  if [ -d OpenColorIO-Configs ]; then
    rm -rf OpenColorIO-Configs
  fi
  
  mv "$srcdir/OpenColorIO-Configs-Natron-v${pkgver%.??_*}" \
     "$srcdir/$_pkgname-$_pkgver/OpenColorIO-Configs"

  rm -rf OpenColorIO-Configs/aces*
  rm -rf OpenColorIO-Configs/spi*

  tar -xzf "$srcdir/google-breakpad-$_google_breakpad_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname-$_pkgver/libs/google-breakpad/"
  tar -xzf "$srcdir/openfx-$_openfx_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname-$_pkgver/libs/OpenFX/"
  tar -xzf "$srcdir/SequenceParsing-$_SequenceParsing_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname-$_pkgver/libs/SequenceParsing/"
  tar -xzf "$srcdir/tinydir-$_tinydir_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname-$_pkgver/libs/SequenceParsing/tinydir/"
  tar -xzf "$srcdir/google-mock-$_google_mock_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname-$_pkgver/Tests/google-mock/"
  tar -xzf "$srcdir/google-test-$_google_test_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname-$_pkgver/Tests/google-test/"

  mv "$srcdir/config.pri" \
     "$srcdir/$_pkgname-$_pkgver/config.pri"
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  [[ -d build ]] && rm -r build; mkdir build; cd build

  qmake-qt4 -r "$srcdir/$_pkgname-$_pkgver/Project.pro" \
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
  cd "$srcdir/$_pkgname-$_pkgver/build"
  make INSTALL_ROOT="$pkgdir" install
  
  install -d "$pkgdir/usr/share/Natron/Plugins/"
  cp -r "$srcdir/$_pkgname-$_pkgver/Gui/Resources/PyPlugs" \
        "$pkgdir/usr/share/Natron/Plugins/"

  install -d "$pkgdir/etc/profile.d"
  echo -e "export FONTCONFIG_PATH=/etc/fonts\n" > $pkgdir/etc/profile.d/$pkgname.sh
  echo -e "setenv FONTCONFIG_PATH /etc/fonts\n" > $pkgdir/etc/profile.d/$pkgname.csh
}
