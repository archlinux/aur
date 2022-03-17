# Maintainer: dreieck
# Contributor: Benjamin Hedrich <code at pagenotfound.de>

_pkgname=gerbera
_pkgvariant=nosystemd
_pkgsource=git
pkgname="${_pkgname}-${_pkgvariant}-${_pkgsource}"
pkgver=1.9.2.129+r4767.20211104.c7aa6316
pkgrel=2
pkgdesc="UPnP Media Server (Based on MediaTomb). Build without systemd dependencies."
url="https://gerbera.io/"
license=('GPL2')
arch=(
  'i686'
  'x86_64'
  'armv7h'
)
depends=(
  'curl'
  'duktape'
  'exiv2'
  'expat'
  'ffmpeg'
  'ffmpegthumbnailer'
  'file'
  'fmt'
  'gcc-libs'
  'libebml'
  'libexif'
  'libmatroska'
  'libnpupnp' # Alternative to `libupnp` -- Usage of this is set in a cmake config variable.
  # 'libupnp' # Needs to be compiled with special options to make gerbera work reliably (`cmake` issues warnings saying so).
  'pugixml'
  'spdlog' 
  'sqlite'
  'taglib'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  "${_pkgname}-openrc: For OpenRC startup script."
)
install="gerbera.install"
options=('emptydirs')
source=(
  "${_pkgname}::git+https://github.com/gerbera/gerbera.git"
  "gerbera.sysusers"
  "gerbera.tmpfiles"
  "${install}"
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-${_pkgvariant}=${pkgver}"
  "${_pkgname}-${_pkgsource}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
sha256sums=(
  'SKIP' # main source (git checkout)
  'b3f956a6eaee8753cff7a04b51091b8b283dd0da054190ced13362a5b050d73f' # gerbera.sysusers
  '452f5d4b5661e0262cb4a48d62a54f5f26d53c6d3aebf502cde072214a8b30d8' # gerbera.tmpfiles
  '5e573183e36cea20319f1b5398f7b0decfb6dd17cdccd1856163f7f9bedbba74' # $install
)

# makedepends+=('ccache')
# options+=('ccache')
# options+=('debug' '!strip')
# provides+=(
#   "${_pkgname}-debug=${pkgver}"
#   "${_pkgname}-${_pkgvariant}-debug=${pkgver}"
#   "${_pkgname}-${_pkgsource}-debug=${pkgver}"
#   "${_pkgname}-${_pkgvariant}-debug-${_pkgsource}=${pkgver}"
# )

# prepare() {
#   cd "${srcdir}/${_pkgname}"
#   for _patch in ; do
#     msg2 "Applying patch '${_patch}' ..."
#     patch -N -p1 -i "${srcdir}/${_patch}"
#   done
# }

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '.')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}/${_pkgname}"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCXX_FILESYSTEM_HAVE_FS=ON \
    -DEXIF_ROOT_DIR=/usr \
    -DSTATIC_LIBUPNP=OFF \
    -DWITH_AVCODEC=ON \
    -DWITH_CURL=ON \
    -DWITH_DEBUG=ON \
    -DWITH_EXIF=ON \
    -DWITH_EXIV2=ON \
    -DWITH_FFMPEGTHUMBNAILER=ON \
    -DWITH_INOTIFY=ON \
    -DWITH_JS=ON \
    -DWITH_LASTFM=OFF \
    -DWITH_MAGIC=ON \
    -DWITH_MATROSKA=ON \
    -DWITH_MYSQL=OFF \
    -DWITH_NPUPNP=ON \
    -DWITH_SYSTEMD=OFF \
    -DWITH_TAGLIB=ON \
    -DWITH_TESTS=ON
  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  make test
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  install -dm0755 "${pkgdir}/var/lib/gerbera"
  install -dm0755 "${pkgdir}/etc/gerbera"
  install -Dm0644 "${srcdir}/gerbera.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm0644 "${srcdir}/gerbera.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
