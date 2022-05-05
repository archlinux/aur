# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=(veles-git python-veles-git)
pkgver=2018.05.0.r0.ge65de5a
pkgrel=5
pkgdesc='Binary data analysis and visualization tool'
url='https://codisec.com/veles'
arch=('x86_64')
makedepends=('cmake' 'clang')
license=('APLv2')
source=("git+https://github.com/codilime/veles.git"
        "fix_qt5_use_modules.patch"
        "always_force_emptystylesheet.patch"
)
sha256sums=('SKIP'
            '13a352f860723304dc2ae664f0f2a4ba29f872e7cc65334409dbb6475f9473c0'
            'e7378aee4e5a08a1930a84b755ee9ee5da4cebab435343dcbb0ff46ada9ca6fa')

pkgver() {
  cd "${srcdir}/veles"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/veles"

	patch -Np1 -i "${srcdir}/fix_qt5_use_modules.patch"
	patch -Np1 -i "${srcdir}/always_force_emptystylesheet.patch"
}

build() {
  makedepends=('git' 'cmake' 'qt5-base>=5.11.0' 'python' 'python-pbr' 'python-six' 'python-msgpack' 'python-buildtools' 'python-virtualenv' 'protobuf' 'zlib')

  mkdir -p "${srcdir}/veles/build"
  cd "${srcdir}/veles/build"

  export CC=clang CXX=clang++

  cmake -Wno-dev .. \
	  -DCMAKE_VERBOSE_MAKEFILE=ON \
	  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	  -DCMAKE_BUILD_TYPE=Release
}

package_veles-git() {
  depends=('qt5-base' 'python' 'python-veles-git' 'protobuf' 'zlib' 'python-pyopenssl')
  conflicts=('veles-bin' 'veles')
  provides=('veles')

  # Install license
  install -Dm644 "${srcdir}/veles/LICENSE-2.0" "${pkgdir}/usr/share/licenses/veles/LICENSE"

  cd "${srcdir}/veles/build"

  # Install the program
  make DESTDIR="${pkgdir}" install
}

package_python-veles-git() {
  depends=('python' 'python-pbr' 'python-six' 'python-msgpack')
  conflicts=('python-veles')

  cd "${srcdir}/veles/python"

  python setup.py install --root="${pkgdir}" --optimize=1
}
