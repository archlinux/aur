# Maintainer: Martchus <martchus@gmx.net>

_name=filezilla
pkgname=mingw-w64-filezilla-svn
pkgver=r7253
pkgrel=1
pkgdesc="Fast and reliable FTP, FTPS and SFTP client (mingw-w64, svn version)"
arch=('any')
url="https://filezilla-project.org/"
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-libidn' 'mingw-w64-sqlite' 'mingw-w64-gnutls' 'mingw-w64-wxmsw' 'mingw-w64-libfilezilla-svn')
makedepends=('mingw-w64-configure' 'wxgtk' 'subversion')
provides=(${pkgname%-svn})
conflicts=(${pkgname%-svn})
options=(staticlibs !strip !buildflags)
install=
source=("${_name}::svn+https://svn.filezilla-project.org/svn/FileZilla3/trunk")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${_name}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${_name}"
  autoreconf -i
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${_name}/build-${_arch}" && cd "${srcdir}/${_name}/build-${_arch}"
    export PATH="/usr/${_arch}/bin:${PATH}"
    ${_arch}-configure \
      --disable-manualupdatecheck \
      --disable-autoupdatecheck \
      --with-pugixml=builtin \
      --with-wx-config="${_arch}-wx-config --static=no"
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_name}/build-${_arch}"
    export PATH="/usr/${_arch}/bin:${PATH}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-all "${pkgdir}"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    #${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    rm -r "${pkgdir}/usr/${_arch}/share/"{icons,man,appdata,applications,pixmaps}
  done
}
