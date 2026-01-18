# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: nightuser <nightuser.android@gmail.com>
# Contributor: Antoine Pierlot-Garcin <antoine@bokbox.com>

pkgname="debsig-verify"
pkgver=0.34
pkgrel=1
pkgdesc="Debian package signature verification tool"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'loong64'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://manpages.debian.org/unstable/debsig-verify/debsig-verify.1"
_url="https://git.dpkg.org/git/dpkg/debsig-verify.git"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'dpkg>=1.22'
  'expat'
  'glibc'
  'gnupg'
  'libmd'
)
makedepends=(
  'git'
)
options=(
  'emptydirs'
)
_pkgsrc="${pkgname}"
source=(
  "${_pkgsrc}::git+${_url}#tag=${pkgver}?signed"
)
sha256sums=('3e0280f9c3f639d083fc00852daeab26a4c745d10cbd845594614170c72574b8')
validpgpkeys=(
  '4F3E74F436050C10F5696574B972BF3EA4AE57A3' # Guillem Jover <guillem@debian.org>
)

build() {
  local configure_options=(
    --prefix='/usr'
    --sysconfdir='/etc'
  )

  cd "${srcdir}/${_pkgsrc}"
  ./autogen
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}/test"
  make check-local
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "doc"
  install -vDm644 "policy-syntax.txt" "${pkgdir}/usr/share/doc/${pkgname}/policy-syntax.txt"
  install -vDm644 "policy.dtd" "${pkgdir}/usr/share/doc/${pkgname}/policy.dtd"
}
