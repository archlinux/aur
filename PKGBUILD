# Maintainer: Jason Go <jasongo@jasongo.net>

pkgbase='libjpeg6-turbo-bin'
pkgname=(
  'libjpeg6-turbo-bin'
  'libjpeg6-turbo-utils-bin'
  'libjpeg6-turbo-devel-bin'
  'libjpeg6-turbo-doc'

  'lib32-libjpeg6-turbo-bin'
  'lib32-libjpeg6-turbo-devel-bin'
)
pkgver=3.1.2
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/libjpeg-turbo/libjpeg-turbo'
license=('BSD-3-Clause' 'IJG')
makedepends=('cmake' 'glibc' 'pkgconf')
options=(staticlibs !buildflags !makeflags !strip !debug)
source_x86_64=(
  "$url/releases/download/$pkgver/libjpeg-turbo-official_${pkgver}_amd64.deb"
  "$url/releases/download/$pkgver/libjpeg-turbo-official32_${pkgver}_amd64.deb"
)
source_aarch64=("$url/releases/download/$pkgver/libjpeg-turbo-official_${pkgver}_arm64.deb")
sha256sums_x86_64=('e42e8319a632a1e3f13fc394cf06d9bf017b2db1546d0b41d6d6246a8a979078'
                   '79de6043643e86b87967b8c8c148bb602be5db88701d2207d683e16ecd7332ea')
sha256sums_aarch64=('d9c159ac87edcb4a3f56cbb39e3fb4b511bbcd40117775534b72a4b5b6741b8e')
noextract=("libjpeg-turbo-official32_${pkgver}_amd64.deb")

_install() {
  local assets=("$@")
  for path in "${assets[@]}"; do
    bsdtar -C "$pkgdir" -xvf data.tar.xz "$path" 
  done
}

_install_license() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  bsdtar -xvOf data.tar.xz "usr/share/doc/*/LICENSE.md" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  bsdtar -xvOf data.tar.xz "usr/share/doc/*/README.ijg" > "$pkgdir/usr/share/licenses/$pkgname/README.ijg"
}

_install_ldconf() {
  mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  echo "/opt/libjpeg-turbo/lib$1" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"
}

package_libjpeg6-turbo-bin() {
  pkgdesc='Official v6b binaries compiled by the libjpeg-turbo project (libjpeg62, 64-bit)'
  depends=('glibc')
  optdepends=(
    'java-runtime>=8: for TurboJPEG Java wrapper'
    'libjpeg6-turbo-doc: Documentation'
  )
  provides=(
    'libjpeg6'
    'libjpeg62'
    'libjpeg.so=62'
    'libturbojpeg.so=0'
  )
  conflicts=(
    'libjpeg6'
    'libjpeg62'
  )

  _install 'opt/libjpeg-turbo/lib64/*.so.*'
  _install_ldconf 64
  _install_license
}


package_libjpeg6-turbo-utils-bin() {
  pkgdesc='Official v6b binaries compiled by the libjpeg-turbo project (utilities, 64-bit)'
  depends=(
    'glibc'
    'libjpeg6-turbo-bin'
  )
  optdepends=(
    'java-runtime>=8: for TurboJPEG Java wrapper'
    'libjpeg6-turbo-doc: Documentation'
  )
  provides=(
    'libjpeg6-turbo-utils'
    'libjpeg6-turbo-progs'
    'libjpeg6-utils'
    'libjpeg6-progs'
    'libjpeg62-turbo-utils'
    'libjpeg62-turbo-progs'
    'libjpeg62-utils'
    'libjpeg62-progs'
  )
  conflicts=(
    'libjpeg6-turbo-utils'
    'libjpeg6-turbo-progs'
    'libjpeg6-utils'
    'libjpeg6-progs'
    'libjpeg62-turbo-utils'
    'libjpeg62-turbo-progs'
    'libjpeg62-utils'
    'libjpeg62-progs'
  )

  _install 'opt/libjpeg-turbo/bin'
  _install_license
}

package_libjpeg6-turbo-devel-bin() {
  pkgdesc='Official v6b binaries compiled by the libjpeg-turbo project (header files, 64-bit)'
  depends=('libjpeg6-turbo-bin')
  optdepends=(
    'java-runtime>=8: for TurboJPEG Java wrapper'
    'libjpeg6-turbo-doc: Documentation'
    'cmake: for compilation'
    'pkgconf: for compilation'
  )
  provides=(
    'libjpeg6-turbo-dev'
    'libjpeg6-turbo-devel'
    'libjpeg6-turbo-headers'
    'libjpeg6-turbo-static'
    'libjpeg6-dev'
    'libjpeg6-devel'
    'libjpeg6-headers'
    'libjpeg6-static'
    'libjpeg62-turbo-dev'
    'libjpeg62-turbo-devel'
    'libjpeg62-turbo-headers'
    'libjpeg62-turbo-static'
    'libjpeg62-dev'
    'libjpeg62-devel'
    'libjpeg62-headers'
    'libjpeg62-static'
    'libjpeg.a'
    'libturbojpeg.a'
  )
  
  _install \
    'opt/libjpeg-turbo/include' \
    'opt/libjpeg-turbo/lib64/*.a' \
    'opt/libjpeg-turbo/lib64/*.so' \
    'opt/libjpeg-turbo/lib64/cmake' \
    'opt/libjpeg-turbo/lib64/pkgconfig'

  _install_license
}

package_libjpeg6-turbo-doc() {
  pkgdesc='Official v6b binaries compiled by the libjpeg-turbo project (Documentation)'
  provides=(
    'libjpeg6-turbo-doc'
    'libjpeg6-doc'
    'libjpeg62-turbo-doc'
    'libjpeg62-doc'
  )

  _install \
    'usr/share/doc' \
    'opt/libjpeg-turbo/man' \
    'opt/libjpeg-turbo/doc'

  _install_license
}


package_lib32-libjpeg6-turbo-bin() {
  pkgdesc='Official v6b binaries compiled by the libjpeg-turbo project (libjpeg62, 32-bit)'
  depends=('glibc')
  optdepends=(
    'java-runtime>=8: for TurboJPEG Java wrapper'
    'libjpeg6-turbo-doc: Documentation'
  )
  provides=(
    'lib32-libjpeg6'
    'lib32-libjpeg62'
    'libjpeg.so=62'
    'libturbojpeg.so=0'
  )
  conflicts=(
    'lib32-libjpeg6'
    'lib32-libjpeg62'
  )

  bsdtar -xOf "libjpeg-turbo-official32_${pkgver}_amd64.deb" data.tar.xz > data32.tar.xz
  bsdtar -C "$pkgdir" -xvf data32.tar.xz 'opt/libjpeg-turbo/lib32/*.so.*'

  _install_ldconf 32
  _install_license
}

package_lib32-libjpeg6-turbo-devel-bin() {
  pkgdesc='Official v6b binaries compiled by the libjpeg-turbo project (header files, 32-bit)'
  depends=(
    'lib32-libjpeg6-turbo-bin'
    'libjpeg6-turbo-devel-bin'
  )
  optdepends=(
    'java-runtime>=8: for TurboJPEG Java wrapper'
    'libjpeg6-turbo-doc: Documentation'
    'cmake: for compilation'
    'pkgconf: for compilation'
  )
  provides=(
    'lib32-libjpeg6-turbo-dev'
    'lib32-libjpeg6-turbo-devel'
    'lib32-libjpeg6-turbo-headers'
    'lib32-libjpeg6-turbo-static'
    'lib32-libjpeg6-dev'
    'lib32-libjpeg6-devel'
    'lib32-libjpeg6-headers'
    'lib32-libjpeg6-static'
    'lib32-libjpeg62-turbo-dev'
    'lib32-libjpeg62-turbo-devel'
    'lib32-libjpeg62-turbo-headers'
    'lib32-libjpeg62-turbo-static'
    'lib32-libjpeg62-dev'
    'lib32-libjpeg62-devel'
    'lib32-libjpeg62-headers'
    'lib32-libjpeg62-static'
    'libjpeg.a'
    'libturbojpeg.a'
  )
  
  bsdtar -xOf "libjpeg-turbo-official32_${pkgver}_amd64.deb" data.tar.xz > data32.tar.xz
  bsdtar -C "$pkgdir" -xvf data32.tar.xz 'opt/libjpeg-turbo/lib32/*.a'
  bsdtar -C "$pkgdir" -xvf data32.tar.xz 'opt/libjpeg-turbo/lib32/*.so'
  bsdtar -C "$pkgdir" -xvf data32.tar.xz 'opt/libjpeg-turbo/lib32/cmake'
  bsdtar -C "$pkgdir" -xvf data32.tar.xz 'opt/libjpeg-turbo/lib32/pkgconfig'

  _install_license
}

