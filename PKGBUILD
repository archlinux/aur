pkgname=libxft-bgra
base_ver=2.3.3
pkgver=2.3.3.r7.7808631e
pkgrel=1
pkgdesc="libXft with BGRA glyph (color emoji) rendering & scaling patches by Maxime Coste"
arch=('x86_64')
license=('custom')
group=('modified')
provides=('libxft')
conflicts=('libxft')
url="https://xorg.freedesktop.org/"
depends=('fontconfig' 'libxrender')
makedepends=('git' 'pkgconfig')
source=(${url}/releases/individual/lib/libXft-${base_ver}.tar.bz2{,.sig})
sha512sums=('28fdaf3baa3b156a4a7fdd6e39c4d8026d7d21eaa9be27c9797c8d329dab691a1bc82ea6042f9d4729a9343d93787536fb7e4b606f722f33cbe608b2e79910e8'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

LIBXFT_UPSTREAM_URL="https://gitlab.freedesktop.org/xorg/lib/libxft.git"
GITLAB_REVISION=7
COMMIT_ID=7808631e7a9a605d5fe7a1077129c658d9ec47fc

pkgver() {
  echo "${base_ver}.r${GITLAB_REVISION}.`echo $COMMIT_ID | cut -c1-8`"
}

prepare() {
  set -eo pipefail

  # Create git repository to hold gitlab upstream code and create diff
  if [ -d "libxft_upstream" ]; then
    rm -rf "libxft_upstream";
  fi;

  mkdir libxft_upstream
  pushd libxft_upstream
  git init
  git remote add upstream ${LIBXFT_UPSTREAM_URL}
  git fetch --depth=2 upstream ${COMMIT_ID}
  popd

  pushd libXft-${base_ver}
  git --git-dir ../libxft_upstream/.git diff -u ${COMMIT_ID}~ ${COMMIT_ID} | patch -p1
  popd

  set +eo pipefail
}

build() {
  cd libXft-${base_ver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd libXft-${base_ver}
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

}
