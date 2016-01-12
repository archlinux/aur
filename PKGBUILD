##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=pstate-frequency-git
_gitname=pstate-frequency
pkgdesc="Easily control Intel p-state driver (git version)"
pkgver=2.0.3.r555.a1d140f
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('coreutils' 'grep')
optdepends=('x86_energy_perf_policy: For the x86_energy_perf_policy-sleep.service')
provides=('pstate-frequency')
conflicts=('pstate-frequency')
license=('GPLv2')
url="https://github.com/pyamsoft/pstate-frequency.git"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
source=(
        "${_gitname}::git+${url}#branch=dev"
        "00-fix-prefix.patch")
sha256sums=(
        'SKIP'
        'e5423df20c03ef19448a78a1ae39e630d90f63c6c4e0962296ad292665575f0d')

pkgver() {
  cd "${srcdir}/${_gitname}"

  printf "%s.r%s.%s" "$(awk -F '=' '{if (/^VERSION:=/) {print $2}}' 'config.mk')" \
                "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Apply patches
  patch -p1 -i "${srcdir}/00-fix-prefix.patch"

  # Disabled by default to conform to AUR packaging
  # best practices. It is highly recommended that you
  # enable the line to allow for editing the config.mk file
  #
  # make DESTDIR="${pkgdir}" PREFIX="/usr" edit

  make DESTDIR="${pkgdir}" PREFIX="/usr" options
}

build() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" clean
  make DESTDIR="${pkgdir}" PREFIX="/usr" bin
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
