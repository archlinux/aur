# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: liberodark

pkgname=natron-compositor-git
pkgver=2.5.0.alpha.2.r83.g395c2227a
pkgrel=1
pkgdesc="Open source compositing software"
arch=('x86_64')
url="https://natrongithub.github.io/"
license=('GPL')
depends=('boost-libs' 'cairo' 'glfw' 'pyside2' 'python-qtpy' 'shiboken2')
makedepends=('boost' 'extra-cmake-modules' 'expat' 'git' 'openmp' 'ninja')
optdepends=('openfx-arena: Extra OpenFX plugins for Natron'
            'openfx-gmic: OpenFX wrapper for the GMIC framework'
            'openfx-io: Readers/Writers plugins'
            'openfx-misc: Miscellaneous OpenFX plugins')

_pkgname=${pkgname%%-*}
_url="https://github.com/NatronGitHub"

conflicts=("${pkgname%-*}")

source=("$_pkgname::git+$_url/${_pkgname^}"
        "openfx::git+$_url/openfx"
        "OpenColorIO-Configs::git+$_url/OpenColorIO-Configs"
        "google-breakpad::git+$_url/google-breakpad"
        "google-mock::git+$_url/google-mock"
        "google-test::git+$_url/google-test"
        "SequenceParsing::git+$_url/SequenceParsing"
	"tinydir::git+$_url/tinydir")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.libs/google-breakpad.url "$srcdir/google-breakpad"
  git config submodule.libs/OpenFX.url "$srcdir/openfx"
  git config submodule.libs/SequenceParsing.url "$srcdir/SequenceParsing"
  git config submodule.Tests/google-mock.url "$srcdir/google-mock"
  git config submodule.Tests/google-test.url "$srcdir/google-test"
  git submodule update

  cd libs/SequenceParsing
  git config submodule.tinydir.url "$srcdir/tinydir"
  git submodule update
}

build() {
  cd $_pkgname

  cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNATRON_BUILD_TESTS=OFF

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
