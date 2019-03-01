# Maintainer:  Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=gitahead
pkgrel=1
pkgver=2.5.4
pkgdesc='Understand your Git history!'
url='http://gitahead.scitools.com/'
arch=('x86_64')
license=('custom')
depends=('curl')
makedepends=('cmake' 'ninja')
source=(
  "git+https://github.com/gitahead/gitahead#tag=v${pkgver}"
  "gitahead-license"
  "gitahead.desktop"
  "gitahead.png"
  "gitahead.sh"
)
sha256sums=('SKIP'
            'd71bfb48c954d213986816fc29478c7f80c8bd2dd10d2889bf51897d649eedd6'
            '6070ebf6752f55f8b7d8a79107ce491c3acf04310eeb9a8242b83cfb4df055f2'
            '66cb53fc57eb2ce2e6cd02ff392476fdfb91b723b76ef5da1856e9b5dc1b5c75'
            'ba4e21c675ce7f49e6df27df1f29d1bb99c47679c4981657a2a4cf5d59930b4a')

prepare() {
  cd "$srcdir/gitahead"
  git submodule update --init --recursive
}

build() {
  # Building openssl
  echo "--- Building openssl ---"
  cd "$srcdir/gitahead/dep/openssl/openssl"
  ./config -fPIC
  make

  echo "--- Building gitahead ---"
  # Build gitahead
  if [ ! -d "$srcdir/gitahead-build" ]; then
    mkdir "$srcdir/gitahead-build"
  fi
  cd "$srcdir/gitahead-build"
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/gitahead" ../gitahead
  ninja
}

package() {
  cd "$srcdir/gitahead-build"

  ninja install

  # TODO: Figure out how to only call GitAheads install routine
  rm -rf "${pkgdir}/opt/gitahead/"{bin,include,lib,lib64,share}

  install -D -m644 "${srcdir}/gitahead-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/gitahead.sh" "${pkgdir}/usr/bin/gitahead"
  install -D -m644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"
  install -D -m644 "${srcdir}/gitahead.png" "${pkgdir}/usr/share/pixmaps/gitahead.png"
}
