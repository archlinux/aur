# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: vogelchr (https://aur.archlinux.org/account/vogelchr) (by https://aur.archlinux.org/packages/gpib-utils-git#comment-998986)
# Contributor: Grey Christoforo <first name [at] last name [dot] net> (https://aur.archlinux.org/account/greyltc) (original author)

_gitname=gpib-utils
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=1.5+62.r254.20160626.720b17d
pkgrel=3
pkgdesc="GPIB instrument support utilities. Latest git checkout from master branch."
url="https://github.com/garlick/gpib-utils"
arch=('x86_64' 'i686' 'aarcxh64')
license=('GPL-2.0-only')
depends=(
  'glibc'
  'libtirpc'
)
makedepends=(
  'git'
  'rpcsvc-proto'
)
optdepends=(
  'linux-gpib:  For kernel drivers and userspace utilities.'
  "sh:          For 'test/thello' (in documentation directory)."
)
provides=(
  "${_pkgname}=${pkgver}"
  "libvxi11=${pkgver}"
  "libvxi11.so"
)
conflicts=(
  "${_pkgname}"
  "libvxi11"
  "libvxi11.so"
)
backup=("etc/gpib-utils.conf")
replaces=()
source=(
  "${_gitname}::git+https://github.com/garlick/gpib-utils.git"
  "0001-Fix-multiple-things-creating-warnings-also-remove-We.patch" # Taken from https://github.com/vogelchr/aur-gpib-utils-git on 2025-04-29.
)
sha256sums=(
  'SKIP'  # Main upstream source
  '2ef8f0a943563277737a5cb4322ba4749a64d3e58c8506e4e368033d8829cd60'  # 0001-Fix-multiple-things-creating-warnings-also-remove-We.patch
)

prepare() {
  cd "${srcdir}/${_gitname}"

  git log > git.log

  for _patch in "${srcdir}/0001-Fix-multiple-things-creating-warnings-also-remove-We.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  CPPFLAGS+=" -I/usr/include/tirpc"
  export CPPFLAGS
  LDFLAGS+=" -ltirpc"
  export LDFLAGS

  ./autogen.sh
  ./configure --prefix="/usr"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

check() {
  cd "${srcdir}/${_gitname}"

  make -j1 check
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" install
  mv -v "${pkgdir}/usr"/etc "${pkgdir}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      'git.log' README README.md NEWS INSTALL AUTHORS
  install -Dvm755 -t "${pkgdir}/usr/share/doc/${_pkgname}/test" test/thello
  cp -rv test/.libs  "${pkgdir}/usr/share/doc/${_pkgname}/test"/
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  'COPYING'
}

# vim:set ts=2 sw=2 et:
