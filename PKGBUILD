#Maintainer: Yury Bobylev <bobilev_yury@mail.ru>
pkgname="stirlitz"
pkgver="1.1"
pkgrel="1"
pkgdesc="Text and files encryption program"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/stirlitz"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'doxygen')
depends=('qt6-base' 'libgcrypt')
sha256sums=('43894a06b179c199bd5a8349911aa867d7bba8f10a279902919bb46526bfdd3d')

build() {   
   local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CREATE_HTML_DOCS=ON
  )

  echo "Attention! This version of Stirlitz profiles and files are not compatible with files and profiles of version 1.0. Decrypt all files and remove all profiles created by previous version before installation!"

    while true; do
        read -p "Do you wish to continue installation? (y/n): " yn
        case $yn in
            [Yy]* ) echo "Continuing..."; break;;
            [Nn]* ) echo "Exiting..."; exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done

  cmake "${cmake_options[@]}"
  cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR=$pkgdir cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
