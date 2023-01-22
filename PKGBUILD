# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=bento4
pkgver=1.6.0.639
_pkgverstr=1-6-0-639
pkgrel=1
pkgdesc='C++ class library and tools designed to read and write ISO-MP4 files'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.bento4.com/'
license=('GPL')
makedepends=('cmake')
optdepends=('python')
source=("http://zebulon.bok.net/Bento4/source/Bento4-SRC-${_pkgverstr}.zip")
sha1sums=('d3351ffb425aadc698227ba84f5ec3401cad795a')

build() {
  cd "${srcdir}"

  sed -i "s/ STATIC / SHARED /" CMakeLists.txt
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_SKIP_BUILD_RPATH=ON
  cmake --build .
}

package() {
  cd "${srcdir}"

  # install manually (there's no install target)
  mkdir -p "${pkgdir}/usr/"{bin,lib,lib/bento4}
  find -iname '*.so' -exec cp --target-directory="${pkgdir}/usr/lib" {} \;
  find -maxdepth 1 -executable -type f -exec cp --target-directory="${pkgdir}/usr/bin" {} \;
  find Source/Python/utils -iname '*.py' -exec cp --target-directory="${pkgdir}/usr/lib/bento4" {} \;
  for file in mp4dash mp4dashclone mp4hls; do
    sed -e 's!/../utils/!/../lib/bento4/!' "Source/Python/wrappers/$file" > "${pkgdir}/usr/bin/$file"
    chmod 755 "${pkgdir}/usr/bin/$file"
  done

  # prevent conflict with libmp4v2
  suffix=-bento4
  for conflicting_file in mp4extract mp4info; do
    mv "${pkgdir}/usr/bin/$conflicting_file" "${pkgdir}/usr/bin/$conflicting_file$suffix"
    find "${pkgdir}/usr/lib/bento4" -iname '*.py' -exec sed -i -e "s#\(Bento4Command(.*\)\b$conflicting_file\b#\1$conflicting_file$suffix#g" {} \;
  done

}
