# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

pkgname=natron
pkgver=2.3.14
pkgrel=2
pkgdesc="Open source compositing software. Node-graph based. Similar in functionalities to Adobe After Effects and Nuke by The Foundry."
arch=("i686" "x86_64")
url="https://github.com/NatronGitHub/Natron"
license=("GPL")
depends=('boost-libs' 'cairo' 'openfx-gmic' 'openfx-io' 'openfx-misc' 'python2-pyside')
makedepends=('boost' 'expat' 'git' 'glfw-x11' 'openmp')
optdepends=('openfx-arena' 'natron-plugins')
source=("$pkgname::git+https://github.com/NatronGitHub/Natron#tag=$pkgver"
        "git+https://github.com/NatronGitHub/google-breakpad"
        "git+https://github.com/NatronGitHub/google-mock"
        "git+https://github.com/NatronGitHub/google-test"
        "git+https://github.com/NatronGitHub/openfx"
        "git+https://github.com/NatronGitHub/SequenceParsing"
        "git+https://github.com/NatronGitHub/tinydir"
        "https://github.com/NatronGitHub/OpenColorIO-Configs/archive/Natron-v${pkgver%.*}.tar.gz"
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
  cd "$srcdir/$pkgname"
  
  if [ -d "$srcdir/$pkgname/OpenColorIO-Configs" ]; then
    rm -rf "$srcdir/$pkgname/OpenColorIO-Configs"
  fi
  
  mv "$srcdir/OpenColorIO-Configs-Natron-v${pkgver%.*}" "$srcdir/$pkgname/OpenColorIO-Configs"

  # Git submodules
  git config submodule.libs/google-breakpad.url $srcdir/google-breakpad
  git config submodule.libs/OpenFX.url $srcdir/openfx
  git config submodule.libs/SequenceParsing.url $srcdir/SequenceParsing
  git config submodule.Tests/google-mock.url $srcdir/google-mock
  git config submodule.Tests/google-test.url $srcdir/google-test
  git submodule update

  cd libs/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
  cd ../..

  mv "${srcdir}/config.pri" "${srcdir}/${pkgname%%-*}/config.pri"
}

build() {
  cd "$srcdir/$pkgname"

  [[ -d build ]] && rm -r build; mkdir build; cd build

  qmake-qt4 -r "$srcdir/natron/Project.pro" \
               PREFIX=/usr \
               BUILD_USER_NAME="Arch_Linux" \
               CONFIG+=custombuild \
               CONFIG+=openmp \
               CONFIG+=enforce-gcc8 \
               DEFINES+=QT_NO_DEBUG_OUTPUT \
               QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
               QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
               QMAKE_LFLAGS_RELEASE="${LDFLAGS}"

  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make INSTALL_ROOT="$pkgdir" install
  
  install -d "$pkgdir/usr/share/Natron/Plugins/"
  cp -r "$srcdir/$pkgname/Gui/Resources/PyPlugs" \
        "$pkgdir/usr/share/Natron/Plugins/"

  install -d "$pkgdir/etc/profile.d"
  echo -e "export FONTCONFIG_PATH=/etc/fonts\n" > $pkgdir/etc/profile.d/$pkgname.sh
  echo -e "setenv FONTCONFIG_PATH /etc/fonts\n" > $pkgdir/etc/profile.d/$pkgname.csh
}

