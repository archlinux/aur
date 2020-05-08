# Maintainer: Peter Nebe <mail@peter-nebe.dev>
pkgname=minidlna-mp34
pkgver=1.0.0
pkgrel=1
pkgdesc="Extended MiniDLNA server. A possible solution if the audio player of your DLNA client has a poor appearance."
arch=('x86_64')
url="https://github.com/peter-nebe/minidlna-mp34"
license=('GPL3')
depends=('qt5-webkit' 'ffmpeg' 'libid3tag' 'libexif')
makedepends=('git')
install=post_install.pacman
source=(
  https://ffmpeg.org/releases/ffmpeg-4.2.2.tar.bz2
  https://downloads.sourceforge.net/project/minidlna/minidlna/1.2.1/minidlna-1.2.1.tar.gz
  git+https://github.com/peter-nebe/minidlna-mp34.git
)
sha256sums=(
  b620d187c26f76ca19e74210a0336c3b8380b97730df5cdf45f3e69e89000e5c
  67388ba23ab0c7033557a32084804f796aa2a796db7bb2b770fb76ac2a742eec
  SKIP
)
build() {
  cd ffmpeg-4.2.2
  ./configure
  cd ../minidlna-1.2.1
  ./configure
  cd ../$pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/ .
  make
  cd mp3-to-mp4/src
  cmake -DCMAKE_INSTALL_PREFIX=/ .
  make
}
package() {
  cd $pkgname/mp3-to-mp4/src
  make DESTDIR="$pkgdir/" install
  cd ../..
  make DESTDIR="$pkgdir/" install
}
