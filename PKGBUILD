# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Andrew Sun
# Contributor: Marius Nestor

_pkgname=gnome-directory-thumbnailer
pkgname="${_pkgname}-git"
pkgver=0.1.11+21.r109.20250604.9326253
pkgrel=1
pkgdesc="GNOME thumbnailer to generate thumbnails for directories. Latest git checkout."
arch=(
  i686
  x86_64
  armv7h
  aarch64
)
url="https://gitlab.gnome.org/GNOME/gnome-directory-thumbnailer"
license=('LGPL2.1')
depends=(
  'gnome-desktop'
)
makedepends=(
  'autoconf'
  'automake'
  'git'
  'intltool'
  'libtool'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
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
  cd "${srcdir}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --enable-nls \
    --disable-Werror

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  for _docfile in AUTHORS ChangeLog HACKING INSTALL MAINTAINERS NEWS README; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"

  for _licensefile in COPYING; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
