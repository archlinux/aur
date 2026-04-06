# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>
# Contributor: T.J. Townsend <blakkheim AT archlinux.org>
# Contributor: Angel Velasquez <angvp at archlinux.org>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: sekret <sekret at posteo.se>

_pkgname=htop
pkgname=$_pkgname-solarized
pkgver=3.4.1
pkgrel=1
pkgdesc='Interactive process viewer with solarized colorscheme patch'
arch=('i686' 'x86_64' 'armv7h')
url='https://htop.dev/'
license=('GPL')
depends=('libcap' 'libcap.so' 'libnl' 'ncurses' 'libncursesw.so')
makedepends=('git' 'lm_sensors')
optdepends=('lm_sensors: show cpu temperatures'
            'lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
validpgpkeys=('F7ABE8761E6FE68638E6283AFE0842EE36DD8C0C'  # Nathan Scott <nathans@debian.org>
              '0D316B6ABE022C7798D0324BF1D35CB9E8E12EAD') # Benny Baumann <BenBE@geshi.org>
source=("git+https://github.com/htop-dev/htop.git#tag=${pkgver}"
        'htop-solarized.patch')
sha256sums=('3238b122c46571bcf2de6d788d040a665b842020effb45b3e9420346a8608460'
            '30e1703d2662734d4094ea17cbabf029b251287b1d502b75893041debb36e3f3')

_backports=(
)

_reverts=(
)

prepare() {
  cd "${_pkgname}"

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  autoreconf -fi

  # Solarized patch
  patch -p1 -N -i "${srcdir}/htop-solarized.patch"
}

build() {
  cd "${_pkgname}"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-affinity \
      --enable-capabilities \
      --enable-delayacct \
      --enable-openvz \
      --enable-sensors \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
