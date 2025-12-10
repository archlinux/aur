# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Chris Severance

_pkgname='fdpp'
_gitname='dosemu2'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.10+12.r1789.20251204.932779b
pkgrel=1
pkgdesc='64 bit FreeDOS++ for dosemu2. Latest git checkout.'
arch=(
  'x86_64'
  'aarch64'
)
url="https://github.com/${_gitname}/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'gcc-libs'
  'glibc'
  'libelf'
)
optdepends=(
  'dosemu2: To use this software.'
  'comcom32: For command.com interpreter.'
  'comcom64: For command.com interpreter.'
  'freecom: For command.com interpreter.'
  'COMMAND.COM: For command.com interpreter.'
)
makedepends=(
  'bash'
  'binutils'
  'clang'
  'git'
  'meson'
  'nasm-segelf' # See https://github.com/dosemu2/fdpp/issues/233#issuecomment-1788601563
  'thunk_gen'
)
if [ "${CARCH}" == "x86_64" ]; then
  export CROSS_LD='ld'
else
  makedepends+=("x86_64-elf-binutils")
  export CROSS_LD='x86_64-elf-ld'
fi
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
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
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
  cd "${srcdir}"
  if grep -qe '-- ' "${_pkgname}/configure.meson"; then
    "${_pkgname}"/configure.meson -b 'build' -- --prefix '/usr'
  else
    "${_pkgname}"/configure.meson --prefix '/usr' 'build'
  fi
  meson compile --verbose -C 'build'
}

package() {
  cd "${srcdir}"
  meson install -C 'build' --destdir "${pkgdir}"

  cd "${pkgdir}/usr/share/fdpp"
  _fdppelf="$(ls -1 fdppkrnl.*.elf | sort -V | tail -n1)"
  _fdppmap="$(ls -1 fdppkrnl.*.map | sort -V | tail -n1)"
  ln -sv "${_fdppelf}" fdppkrnl.elf
  ln -sf "${_fdppmap}" fdppkrnl.map

  cd "${srcdir}/${_pkgname}"
  for _docfile in 'git.log' 'NEWS.md' 'README.md'; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in LICENSE; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
