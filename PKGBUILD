# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Ionut Biru  <ibiru@archlinux.ro>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=geany
pkgname=mingw-w64-geany
pkgver=1.33.0
pkgrel=1
pkgdesc='Fast and lightweight IDE (mingw-w64)'
arch=('any')
url='https://www.geany.org/'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-gtk3')
makedepends=('python-lxml' 'setconf' 'intltool' 'python' 'mingw-w64-gcc' 'mingw-w64-configure')
optdepends=('mingw-w64-geany-plugins: various extra features'
            'mingw-w64-python')
source=("https://download.geany.org/${_name}-${pkgver/.0}.tar.bz2")
sha256sums=('66baaff43f12caebcf0efec9a5533044dc52837f799c73a1fd7312caa86099c2')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${_name}-${pkgver/.0}"

  # Python2 fix
  sed -i '0,/on/s//on2/' data/templates/files/main.py

  # Syntax highlighting for PKGBUILD files
  sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf

  # Can't run ./autogen.sh since it would check for regular libs and not the
  # cross versions
  test -d build-aux || mkdir build-aux
  echo "no" | glib-gettextize --force --copy
  intltoolize --copy --force --automake
  libtoolize --copy --force || glibtoolize --copy --force
  aclocal -I m4
  autoheader
  automake --add-missing --copy --gnu
  autoconf
}

build() {
  cd "${_name}-${pkgver/.0}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    pushd "build-${_arch}"
    ${_arch}-configure \
        --exec-prefix=/usr/${_arch} \
        --enable-gtk3 \
        --sysconfdir=/etc \
        --prefix=/usr/${_arch} \
        --disable-html-docs
    make
    popd
  done
}

package() {
  cd "${_name}-${pkgver/.0}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/geany/"*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/geany/"*.dll
    ${_arch}-strip --strip-all "${pkgdir}/usr/${_arch}/bin/"*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    rm "${pkgdir}/usr/${_arch}/"*.txt
    popd
  done
}

# getver: -u 7 geany.org/Documentation/ReleaseNotes
# vim:set ts=2 sw=2 et:
