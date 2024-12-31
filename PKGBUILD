# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: éclairevoyant (https://aur.archlinux.org/account/eclairevoyant)
# Contributor: keenord (https://aur.archlinux.org/account/keenerd)

_pkgname="nasm-segelf"
pkgname="${_pkgname}-git"
pkgver=2.16.01+2+17.r4913.20231207.g13292aec
pkgrel=2
epoch=1
pkgdesc="80x86 assembler designed for portability and modularity. 'elf16' branch."
arch=(
  'i686'
  'x86_64'
)
url='https://github.com/stsp/nasm/tree/elf16'
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  adobe-source-sans-pro-fonts
  asciidoc
  diffutils
  fontconfig
  ghostscript
  git
  perl
  perl-font-ttf
  perl-sort-versions
  ttf-liberation
  xmlto
)
license=(
  'BSD'
)
provides=(
  "${_pkgname}=${pkgver%%.r*}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+https://github.com/stsp/nasm.git#branch=elf16"
)
b2sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  NOCONFIGURE=1 ./autogen.sh

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E  -e 's|^nasm\-||' -e 's|^segelf\-||' -e 's|^[vV]||' | sed -E 's|\-g[0-9a-f]+$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _hash="$(git rev-parse --short HEAD)"

  printf '%s\n' "${_ver}.r${_rev}.${_date}.g${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # --enable-sanitizer makes tests fail and makes compiling other projects (fdpp-git) fail with `==10946==ERROR: LeakSanitizer: detected memory leaks`.

  ./configure \
    --prefix=/usr \
    --docdir="/usr/share/doc/${_pkgname}/doc" \
    --disable-gdb \
    --enable-optimization \
    --disable-profiling \
    --enable-largefile \
    --enable-pdf-compression \
    --enable-section \
    --disable-sanitizer \
    --disable-werror \
    --disable-suggestions

  make everything
}

check() {
  cd "${srcdir}/${_pkgname}"

  make -j1 -C test golden test diff
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install install_doc

  for _docfile in git.log AUTHORS ChangeLog CHANGES INSTALL README.md *.txt; do
    install -vDm644 "${_docfile}" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  done

  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
