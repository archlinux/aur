# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: ultraviolet (https://aur.archlinux.org/account/ultraviolet)

_pkgname="libst2205"
pkgname="${_pkgname}-git"
pkgver=r1.20120825.a1d9a6b
pkgrel=1
pkgdesc="Library for interacting with hacked st2205 and similar digital photo frames"
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/neophob/libst2205"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gd'
)
makedepends=(
  'git'
)
optdepends=(
  "bash: For some helper scripts in the 'doc/' directory."
)
provides=(
  "${_pkgname}"
  "libst2205.so"
  "libst2205.a"
)
conflicts=(
  "${_pkgname}"
  "libst2205.so"
  "libst2205.a"
)
options=('staticlibs')
source=(
  "${_pkgname}::git+https://github.com/neophob/libst2205.git"
  "0001-add-missing-fcntl-argument.patch"
  'Makefile.honour-preset-CFLAGS.patch'
)
sha256sums=(
  'SKIP'
  '0872af394cf58b6404e1bab2b6d597454b49ca32b7cce700a6bc82cf3b2df5f6'
  '99a68081a6f6b9768b4906fc2579d2547489c368f8280a02375e5bb71c022dec'
)

prepare() {
  cd "$srcdir/$_pkgname"

  local _patch
  for _patch in "${srcdir}"/0001-add-missing-fcntl-argument.patch; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np0 --follow-symlinks -i "${_patch}"
  done
  for _patch in "${srcdir}"/Makefile.honour-preset-CFLAGS.patch; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "$srcdir/$_pkgname"

  _rev="$(git rev-list --count HEAD -- "${_sourcefiles[@]}")"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" -- "${_sourcefiles[@]}")"
  _hash="$(git log -n1 --oneline --abbrev-commit -- "${_sourcefiles[@]}" | awk '{print $1}')"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$srcdir/$_pkgname"

  CFLAGS+=" -Wno-implicit-function-declaration -Wno-error=implicit-function-declaration -fPIC"
  export CFLAGS

  make -j1 all # -j1 is needed, otherwise parallel build is tried but it does not synchronise dependencies.
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dvm0755 "libst2205/libst2205.so"  "${pkgdir}/usr/lib/libst2205.so.1"
  ln -svr "${pkgdir}/usr/lib/libst2205.so.1" "${pkgdir}/usr/lib/libst2205.so"
  install -Dvm0644 -t "${pkgdir}/usr/lib"      "libst2205/libst2205.a"
  install -Dvm0644 -t "${pkgdir}/usr/include"  "libst2205/st2205.h"
  install -Dvm0755 -t "${pkgdir}/usr/bin"      "phack"

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}"         git.log README test.png
  install -Dvm0755 -t "${pkgdir}/usr/share/doc/${_pkgname}"         bgrep splice hackfw.sh
  cp -rv hack   "${pkgdir}/usr/share/doc/${_pkgname}"/
  cp -rv output "${pkgdir}/usr/share/doc/${_pkgname}"/mplayer-and-lcd4linux
  install -Dvm0755 -t "${pkgdir}/usr/share/doc/${_pkgname}/setpic"  setpic/setpic
  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}/setpic"  setpic/test.png

  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}"     LICENSE
}
