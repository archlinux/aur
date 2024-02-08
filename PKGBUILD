# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: TimeTrap <844177178 at qq dot com>
# Contributor: Levente Polyak <anthraxx at archlinux dot org>
# Contributor: Eric Bélanger <eric at archlinux dot org>

set -u
_pkgname=tiff
pkgname=libtiff
pkgname+='5'
pkgver=4.4.0
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
arch=('x86_64' 'aarch64')
url="http://www.simplesystems.org/libtiff"
license=('libtiff')
depends=('gcc-libs' 'glibc' 'libjpeg-turbo' 'libjpeg.so' 'zlib' 'xz' 'zstd')
depends+=('libglvnd' 'jbigkit' 'libwebp' 'freeglut')
#depends+=('libtiff>=4.6.0')
conflicts=('libtiff<4.6.0')
_libtiff_srcdir="${_pkgname}-${pkgver}"
source=(
  "https://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"
  # fix CVE-2022-2056 / CVE-2022-2057 / CVE-2022-2058: https://bugs.archlinux.org/task/75360
  "${pkgname}-4.4.0-fpe_tiffcrop.patch::https://gitlab.com/libtiff/libtiff/-/commit/dd1bcc7abb26094e93636e85520f0d8f81ab0fab.patch"
  # fix CVE-2022-34526: https://bugs.archlinux.org/task/75608
  "${pkgname}-4.4.0-CVE-2022-34526.patch::https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990.patch"
)
md5sums=('376f17f189e9d02280dfe709b2b2bbea'
         'ba2e14576684f63de72e080e0d59c6e8'
         '3ad0ddf25d519cd3a05a40053c5e5b52')
sha256sums=('917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed'
            '049875c6eddef8d0d653ad069fea7483f7b9b1dc2aad8780784301fb3e34b561'
            '10220d1eecc00f830a1814c0b74388e68c4f0a38ec173038d6e5e8a6ad3cc97f')

if :; then
  conflicts+=("${pkgname}")
  provides+=("${pkgname}=${pkgver}")
  pkgname+='-hylafaxplus'
fi

prepare() {
  set -u
  cd "${_libtiff_srcdir}"
  # apply patch from the source array (should be a pacman feature)
  local _src
  for _src in "${source[@]}"; do
    _src="${_src%%::*}"
    _src="${_src##*/}"
    if [[ "${_src}" = *.patch ]]; then
      echo "Applying patch ${_src}..."
      patch -Np1 -i "../${_src}"
    fi
  done
  set +u
}

_libtiff_incdir='libtiff5'
_libtiff_libdir='libtiff5'

build() {
  set -u
  local _configure_options=(
    --prefix=/usr
    #--sysconfdir=/etc
    #--enable-ld-version-script
    #--mandir=/usr/share/man
    #--with-docdir=/usr/share/doc/${pkgname}
    --includedir="/usr/include/${_libtiff_incdir}"
    #--libdir="/usr/lib/${_libtiff_libdir}"
    #--bindir='/usr/bin/hylafax' # how will all the scripts work if we move the binaries
  )
  cd "${_libtiff_srcdir}"
  if [ ! -s 'Makefile' ]; then
    #CFLAGS+=' -fpic'
    ./configure "${_configure_options[@]}"
  fi
  make -s
  set +u
}

check() {
  set -u
  cd "${_libtiff_srcdir}"
  make check
  set +u
}

package() {
  set -u
  cd "${_libtiff_srcdir}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 'COPYRIGHT' -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}"
  local _f
  for _f in tiffcp; do
    mv "usr/bin/${_f}"{,.hylafax}
    mv "usr/share/man/man1/${_f}"{.1,.hylafax.1}
  done
  for _f in tiffdump tiffinfo tiffset tiffsplit; do
    rm "usr/bin/${_f}"
    rm "usr/share/man/man1/${_f}.1"
  done
  shopt -s failglob
  rm -r usr/share/{doc,man/man3} usr/lib/libtiff*.a
  if :; then
    rm -r 'usr/lib/pkgconfig'
    install -d "usr/lib/${_libtiff_libdir}"
    pushd "usr/lib/${_libtiff_libdir}" > /dev/null
    mv ../libtiff*.so .
    local _f
    for _f in ../*.so*; do
      ln -s "${_f}"
    done
    popd > /dev/null
  fi
  shopt -u failglob
  set +u
}
set +u

# vim: ts=2 sw=2 et:
