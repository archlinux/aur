# Maintainer: McModder <mcmodder@mcmodder.ru>

pkgname=openttd-svn
pkgver=22812.00c160325
pkgrel=2
pkgdesc='An engine for running Transport Tycoon Deluxe (latest GIT build)'
arch=('i686' 'x86_64')
url='http://openttd.org'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset'
            'timidity++: for in-game music')
makedepends=('git')

source=("$pkgname::git+https://github.com/OpenTTD/OpenTTD.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${pkgname}

  # http://site.icu-project.org/download/61#TOC-Migration-Issues
  CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD-latest" \
    --personal-dir=.${pkgname}    

  make
}

package() {
  cd ${pkgname}

  # Makefile.bundle will fail if where will be no readme.txt
  cp README.md readme.txt

  make install
}
