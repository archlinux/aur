# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=bento4
pkgver=1.6.0.632
_pkgverstr=1-6-0-632
pkgrel=1
pkgdesc='C++ class library and tools designed to read and write ISO-MP4 files'
arch=('i686' 'x86_64')
url='https://www.bento4.com/'
license=('GPL')
makedepends=('cmake')
optdepends=('python')
source=("http://zebulon.bok.net/Bento4/source/Bento4-SRC-${_pkgverstr}.zip")
sha1sums=('73a98c07a9392a0525d41f09f824c447dca10963')

build() {
  cd "${srcdir}"

  sed -i "s/ STATIC / SHARED /" CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_SKIP_BUILD_RPATH=ON
  make
}

package() {
  cd "${srcdir}"

  # prevent conflict with libmp4v2
  for conflicting_file in mp4extract mp4info; do
    mv $conflicting_file $conflicting_file-bento4
  done

  # install manually (there's no install target)
  mkdir -p "${pkgdir}/usr/"{lib,bin}
  find -iname '*.so' -exec mv --target-directory="${pkgdir}/usr/lib" {} \;
  find -maxdepth 1 -executable -type f -exec mv --target-directory="${pkgdir}/usr/bin" {} \;
}
