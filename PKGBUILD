# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Chris Severance

set -u
_pkgname='fdpp'
_gitname='dosemu2'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.7.r1443.20230921.a940e5f
pkgrel=1
pkgdesc='64 bit FreeDOS++ for dosemu2. Latest git checkout.'
arch=(
  'x86_64'
)
url="https://github.com/${_gitname}/${_pkgname}"
license=(
  'GPL3'
)
depends=(
  'comcom32'
  'gcc-libs'
  'glibc'
  'libelf'
)
makedepends=(
  'bash'
  'clang'
  'git'
  'lld'
  'nasm'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options=('!strip')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  set -u
  cd "${srcdir}/${_pkgname}"

  git log > git.log

  sed -e '/^PREFIX / s:/usr/local:/usr:g' -i 'fdpp/defs.mak'
  set +u
}

pkgver() {
  set -u
  cd "${srcdir}/${_pkgname}"

  # _ver="$(grep -E -m1 '^[[:space:]]*fdpp[[:space:]]*\(' debian/changelog | sed -E -e 's|^[^\(]*\(([^\)]*)\).*$|\1|' -e 's|-.*$||')"
  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')" # git describe --tags give unpredictable result; sometimes it is like '1.6', sometimes like 'API31'. `git describe` seems to work.
  _ver="$(git describe | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]+$||' | tr '-' '+')"
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
  set -u
  cd "${srcdir}/${_pkgname}"
  bash -e -u configure
  make -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_pkgname}"
  make -j1 DESTDIR="${pkgdir}" install

  for _docfile in 'git.log' 'NEWS.md' 'README.md'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in LICENSE; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done

  set +u
}
set +u
