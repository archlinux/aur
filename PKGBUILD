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
pkgver=2.5.0
pkgrel=1
pkgdesc="Open source compositing software"
arch=('x86_64')
url="https://natrongithub.github.io/"
license=('GPL')
depends=('boost-libs' 'cairo' 'pyside2')
makedepends=('boost' 'extra-cmake-modules' 'git' 'glfw' 'openmp' 'ninja' 'python-qtpy' 'shiboken2')
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
sha512sums=('f60d5aebd8cc2f653985868a12b5fbddc0252e4253907cd38b2d9d4c631a15f9825fa5648140e401a7f44e8db3a509f677e2fd9b69b83dabecaa1c46933f19c8'
            '174b75061ac2bb887f2e10df1ec899276e8e27f1873d2dda2ef07ee3fb53f54169fe37d9921642248e28faa974a50a62e5e8ab20ccdd09c96a235084ae16d87d'
            '14e57f510c30eb90fb556a104978adda72655d80b3bb9f441b578086322fc1d19f01a6c5dabcd22d3d45f8406fec3d148089ea9249f33ac722c9a42056120296'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

prepare() {
  mv "OpenColorIO-Configs-Natron-v${pkgver%.*}/" \
     "OpenColorIO-Configs/"

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
}

build() {
  cd $_pkgname

  cmake -G Ninja \
        -B build \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D NATRON_BUILD_TESTS=OFF

  ninja -C build/
}

package() {
  cd $_pkgname

  DESTDIR="$pkgdir" ninja -C build/ install

  install -d "$pkgdir/usr/share/Natron/Plugins/"
  cp -r "Gui/Resources/PyPlugs" \
        "$pkgdir/usr/share/Natron/Plugins/"

  install -d "$pkgdir/usr/share/mime/application/"
  mv "$pkgdir/usr/share/mime/x-natron.xml" \
     "$pkgdir/usr/share/mime/application/"

  install -d "$pkgdir/usr/share/OpenColorIO-Configs/"
  for directory in blender natron nuke-default
  do
    cp -r "$srcdir/OpenColorIO-Configs/$directory/" \
          "$pkgdir/usr/share/OpenColorIO-Configs/"
  done

  install -d "$pkgdir/etc/profile.d"
  echo -e "export FONTCONFIG_PATH=/etc/fonts\n" > "$pkgdir/etc/profile.d/$_pkgname.sh"
  echo -e "setenv FONTCONFIG_PATH /etc/fonts\n" > "$pkgdir/etc/profile.d/$_pkgname.csh"
}
