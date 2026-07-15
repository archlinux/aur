# Contributor: Scott Alfter <scott@alfter.us>

pkgname=openkj
pkgver=2.1.39
pkgrel=1
pkgdesc="Open KJ - Cross-platform open source karaoke hosting software"
arch=('i686' 'x86_64')
url="https://openkj.org/"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'gst-plugins-good' "taglib1")
makedepends=('qt6-tools' 'git' 'cmake')
provides=("$pkgname=$pkgver")
conflicts=('openkj-git')
install=$pkgname.install
source=(
	"git+https://github.com/mattlanglands/OpenKJ#commit=29c94055e2718df8f0e387bd8db94815f43fa376"
	"spdlog-1.9.2.tar.gz::https://github.com/gabime/spdlog/archive/refs/tags/v1.9.2.tar.gz"
	)
sha256sums=(
	"SKIP"
	"6fff9215f5cb81760be4cc16d033526d1080427d236e86d70bb02994f85e3d38"
	)

prepare()
{
  cd "${srcdir}/OpenKJ/src/3rdparty"
  rm -r spdlog
  mv ../../../spdlog-1.9.2 spdlog
}

build() 
{
  cd "${srcdir}/OpenKJ"
  export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
  cmake -DSPDLOG_USE_BUNDLED=true -DCMAKE_INSTALL_PREFIX='/usr' CMakeLists.txt
  make
}

package() 
{
  cd "${srcdir}/OpenKJ"
  make DESTDIR="$pkgdir" install
}
