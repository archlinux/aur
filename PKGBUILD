# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: DetMittens
# Contributer: uth 2.0.0 update
#
# Supported Platforms	Features
# Haswell       (HSW)	vp8enc
# Bay Trail M   (BYT)	vp8enc
# Broadwell     (BRW)	vp9dec vp9enc
# Braswell      (BSW)	vp8enc vp9dec
#
#
# The libva-intel-driver package isn't compiled with support for loading this driver
# so in order to use this driver's features with non hybrid codecs either
# recompile libva-intel-driver with the --enable-hybrid-codec or install
# the libva-intel-driver-hybrid package from the AUR

_pkgname=intel-hybrid-codec-driver
pkgname="${_pkgname}-git"
_gitname=intel-hybrid-driver
_gitroot="git+https://github.com/kcning/${_gitname}.git"
epoch=1
_pkgver=2.0.0 # According to upstream, we are at version 2.0.0, but git tags say 1.0.2.
pkgver=2.0.0.r170.20220515.cfb3b71
pkgrel=1
pkgdesc='Libva support for partially hardware accelerated encode and decode on Haswell and newer'
arch=(
  'x86_64'
)
# url='https://01.org/linuxmedia/vaapi'
url='https://github.com/kcning/intel-hybrid-driver'
license=(
  'MIT'
)
depends=(
  'libva'
  'libcmrt'
)
optdepends=(
  'libva-intel-driver-hybrid: To be able to use the full hw codecs with hybrid codecs'
)
makedepends=(
  'autoconf'
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "${_pkgname}<=2.0.0.r170.7961945" # Because this package was wrongly named 'intel-hybrid-codec-driver' before.
)
install="${_pkgname}.install"
source=(
  "$_gitname::$_gitroot"
  'gcc10-fix.patch'
  'vadriverinit-fix.patch'
  "${install}"
)
sha256sums=(
  'SKIP'
  '90c01a1771f90007b001057edd4ada66751e54ccc380b3d87672694ab7ea92cb'
  '5359cfa322403bad1a20dc55de290c5f5c2f8d56afeba9c4a84dfc35cc89ec8b'
  '0465f0f9a29b5168ecb51a07bcca6db85637f847e0ac5bffdea4152ba329f3f2'
)

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -N -p1 --follow-symlinks -i "${srcdir}/gcc10-fix.patch"
  patch -N -p1 --follow-symlinks -i "${srcdir}/vadriverinit-fix.patch"
  autoreconf -v --install

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
  _ver="${_pkgver}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_gitname}"
  ./configure --prefix=/usr \
    --enable-drm \
    --enable-x11 \
    --enable-wayland \
    --disable-static \
    --enable-shared
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make install DESTDIR="${pkgdir}"

  install -D -v -m644    "${srcdir}/git.log"                               "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  for _docfile in AUTHORS NEWS README; do
    install -D -v -m644  "${_docfile}"                                     "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644    "COPYING"                                         "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr                "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
