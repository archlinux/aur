# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Callum Parsey
# Contributor: Sefa Eyeoglu
# Contributor: Kazutoshi Noguchi
# Contributor: Marco Kundt

_pkgname="gtk3-nocsd"
_gitname="${_pkgname}"
_gituser='fredldotme'
pkgname="${_pkgname}-git"
pkgver=3.0.8+2.r84.20221015.a356bf7
pkgrel=1
pkgdesc="A LD_PRELOAD library to disable gtk+ 3 client side decoration."
arch=(
  "i686"
  "x86_64"
)
url="https://github.com/${_gituser}/${_gitname}"
license=("LGPL2.1")
provides=("gtk3-nocsd=${pkgver}")
conflicts=("gtk3-nocsd")
depends=(
  "bash"
  "glibc"
  "gtk3"
)
makedepends=(
  "git"
  "gobject-introspection"
)
install="${_pkgname}.install"
source=(
  "${_gitname}::git+${url}.git"
  "30-gtk3-nocsd.xinit.sh"
  "${install}"
)
sha256sums=(
  'SKIP'
  'b6a314bb7482f1de024805d669750957c41e350a82f87dd16ca72760d7d8f9f4'
  '9827e52fb9d7385c4ec155411f8d2b1c2225878c107a1e2768f77f73589e99e4'
)

prepare() {
  cd "${srcdir}/${_gitname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')"
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

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" prefix='/usr' install

  for _docfile in 'git.log' 'README.md' 'gedit-with-csd.png' 'gedit-without-csd.png' 'TODO'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in COPYING; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done

  cd "${srcdir}"
  install -Dvm0755 '30-gtk3-nocsd.xinit.sh' "${pkgdir}/etc/X11/xinit/xinitrc.d/30-gtk3-nocsd.sh"
}
