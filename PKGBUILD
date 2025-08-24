# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: severach (https://aur.archlinux.org/account/severach) # Did make the `comcom32` `PKGBUILD` which was used to create this one.

## Controls which variants to build.
_build_32=true
_build_64=true

set -u
_pkgbare="comcom"
_pkgbase="${_pkgbare}"
_upstreamname='comcom64'
pkgbase="${_pkgbase}-git"
pkgname=(
  "${_pkgbare}-common-git"
)
pkgver=0.0.0.2+37.r575.20250810.b0aa1e7
pkgrel=1
pkgdesc="32 and 64 bit DOS command interpreters ('command.com'), e.g. for fdpp and dosemu2. Latest git checkout."
arch=('any')
url='https://github.com/dosemu2/comcom64'
license=('GPL-3.0-or-later')
makedepends=(
  'djstub'
  'git'
)
if "${_build_32}"; then
  pkgname+=(
    "${_pkgbare}32-git"
  )
  makedepends+=(
    'djgpp-gcc'
    'djgpp-djcrx'
  )
fi
if "${_build_64}"; then
  pkgname+=(
    "${_pkgbare}64-git"
  )
  makedepends+=(
    'dj64'
    'thunk_gen'
  )
fi
source=(
  "${_upstreamname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_upstreamname}"

  _tag="$(git describe --tags)"
  _ver="$(sed -E -e 's|^[vV]||' -e 's|^([a-zA-Z]*)-|\1_|' -e 's|\-g[0-9a-f]*$||' -e 's|-|+|g' <<<${_tag})"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '0.0.%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


prepare() {
  set -u

  if "${_build_32}"; then
    if pacman -Qi djgpp-djcrx-bootstrap > /dev/null 2>&1; then
      error "Package 'djgpp-djcrx-bootstrap' is installed. You need to replace it with 'djgpp-djcrx' before continuing, and then re-start the build process."
      error "Aborting."
      return 1
    fi
  fi

  cd "${srcdir}/${_upstreamname}"

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Applying patch ${_pt} ..."; set -u
      patch -Nup1 --follow-symlinks -i "${srcdir}/${_pt}"
    fi
  done

  git log > git.log

  #mkdir -p subprojects
  #ln -sv "${srcdir}/thunk_gen" subprojects/thunk_gen

  sed -e 's|i586-pc|i686-pc|g' -i '32/Makefile'

  set +u
}

build() {
  set -u
  cd "${srcdir}/${_upstreamname}"

  if "${_build_32}"; then
    make PREFIX=/usr 32
  fi
  if "${_build_64}"; then
    make PREFIX=/usr
  fi

  set +u
}

package_32() {
  pkgdesc="32 bit DOS command interpreter ('command.com'), e.g. for fdpp and dosemu2. Latest git checkout."
  arch=('any')
  depends=(
    "${_pkgbare}-common"
  )
  optdepends=()
  provides=(
    "${_pkgbare}32=${pkgver}"
    "COMMAND.COM"
  )
  conflicts=(
    "${_pkgbare}32"
  )

  set -u
  cd "${srcdir}/${_upstreamname}/32"

  make -j1 PREFIX=/usr DESTDIR="${pkgdir}" install

  install -d -v -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for _licensefile in 'LICENSE'; do
    ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
  done


  set +u
}

package_64() {
  pkgdesc="64 bit DOS command interpreter ('command.com'), e.g. for fdpp and dosemu2. Latest git checkout."
  arch=('any')
  depends=(
    "${_pkgbare}-common"
  )
  optdepends=()
  provides=(
    "${_pkgbare}64=${pkgver}"
    "COMMAND.COM"
  )
  conflicts=(
    "${_pkgbare}64"
  )
  install='comcom64.install'

  set -u
  cd "${srcdir}/${_upstreamname}"

  make -j1 PREFIX=/usr DESTDIR="${pkgdir}" install

  install -d -v -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for _licensefile in 'LICENSE'; do
    ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
  done

  set +u
}

package_common() {

  pkgdesc="Common files (documentation and license) for ${_pkgbare}32-git."
  arch=('any')
  depends=()
  optdepends=(
    "${_pkgbare}32-git: The software this documentation and license is for."
    "${_pkgbare}64-git: The software this documentation and license is for."
  )
  provides=(
    "${_pkgbare}-common=${pkgver}"
  )
  conflicts=(
    "${_pkgbare}-common"
  )

  set -u
  cd "${srcdir}/${_upstreamname}"

  printf '%s\n' " --> installing documentation ..."
  for _docfile in 'git.log' 'README.md'; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgbare}/$(basename "${_docfile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in 'LICENSE'; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgbase}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgbare}/$(basename "${_licensefile}")"
  done

  set +u
}

package_comcom32-git() {
  package_32 "$@"
}

package_comcom64-git() {
  package_64 "$@"
}

package_comcom-common-git() {
  package_common "$@"
}

set +u
