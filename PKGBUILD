# Maintainer: Menci <huanghaorui301@gmail.com>
pkgname=curl-http3-msquic
pkgver=7.85.0
pkgrel=1
pkgdesc="An URL retrieval utility and library - compiled with HTTP/3 support (with msquic) - binary is called curl3"
arch=('x86_64' 'aarch64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'zlib' 'libpsl' 'libnghttp2'
         'libidn2' 'libidn2.so')
makedepends=('git' 'cmake')
conflicts=('curl-http3')
provides=('curl-http3')
source=(
	"https://curl.haxx.se/download/curl-$pkgver.tar.gz"{,.asc}
	00-msh3-static.patch
	01-msquic-openssl-enable-md4.patch
	02-curl-msquic-static.patch
)
sha512sums=(
	'204ce7ac32be94e4262ebda3cde46ae4e1e58b4f2bc4867ca6cce88a5906e0dd633200ccb9928b2a90e5ae4c43715747034a09cb2b810a8638388f2dc40a7941'
	'SKIP'
	'849bfeee56ba53ffa3e8ee73df858688848fe350f91a3e8fca2726e5d0b4050def8b64668d8dbb12052cf81a70542f4a6f5faa89b1b91ea24eb64f88383724f0'
	'7a7f31b53fe1b4e7fd0c905e8078b7859ab0b408e08ea0efdead2cedcf0b64e2e49e82c9723b5cd128f0e564a8e9723bd51154c6489609c63a93a023d6f131c8'
	'544fc1c667f89323f0a071e002770b85ffd441c0dedb782c6e5d3b1348a646f5fb1d2fa2db8db584fe9d508888231d5c481a07282689ef20c857c98edcf58eaa'
)
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg

_msh3_ref=879898706f2e10b9cc2e34de5d30eedbe4186c29

prepare() {
  # Patch curl
  patch -Np1 -d "curl-${pkgver}" -i "${srcdir}"/02-curl-msquic-static.patch

  # Fetch msh3 source code
  mkdir msh3 && cd msh3
  git init
  git remote add origin https://github.com/nibanks/msh3
  git fetch --depth 1 origin ${_msh3_ref}
  git checkout FETCH_HEAD
  git submodule update --init --recursive --recommend-shallow --progress
  cd ..

  # Patch msh3
  patch -Np1 -d msh3 -i "${srcdir}"/00-msh3-static.patch
  patch -Np1 -d msh3/msquic -i "${srcdir}"/01-msquic-openssl-enable-md4.patch
}

build() {
  mkdir "${srcdir}"/build-{msh3,curl}

  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  # Build static msh3
  cd "${srcdir}/build-msh3"
  cmake -G 'Unix Makefiles' -DBUILD_SHARED_LIBS=OFF -DQUIC_BUILD_SHARED=OFF -DCMAKE_INSTALL_PREFIX=./target "${srcdir}/msh3"
  make
  # Install msh3 headers and static libraries
  ## All static libraries including dependencies are installed to prefix "build-msh3/target"
  make install
  find ~+ -regextype posix-extended -regex '^.*\.a$' -exec cp {} ./target/lib/ \;

  # Build curl
  cd "${srcdir}/curl-${pkgver}"
  autoreconf -fi
  cd "${srcdir}/build-curl"
  ## Arch Linux build flags + msh3
  "${srcdir}/curl-${pkgver}"/configure \
    LDFLAGS="-Wl,-rpath,/usr/local/lib" \
    --with-msh3="${srcdir}/build-msh3/target" \
    --with-openssl \
    --enable-alt-svc \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --disable-ldap \
    --disable-ldaps \
    --disable-manual \
    --disable-shared \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --with-random=/dev/urandom \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd "${srcdir}/build-curl"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C scripts

  # License
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/curl-${pkgver}"/COPYING
  cd ..

  # Rename curl to avoid conflicts
  mv "${pkgdir}/usr/bin/curl" "${pkgdir}/usr/bin/curl3"
  mv "${pkgdir}/usr/bin/curl-config" "${pkgdir}/usr/bin/curl-config3"

  # Remove stuff that would conflict with core/curl
  rm -rf "${pkgdir}/usr/lib" "${pkgdir}/usr/share" "${pkgdir}/usr/include"
}
