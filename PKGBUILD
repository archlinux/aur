# Maintainer: Kai Zoku <kaizoku@test.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=htop-minimal
pkgver=3.2.2
pkgrel=1
pkgdesc='Interactive process viewer'
arch=('x86_64')
url='https://htop.dev/'
license=('GPL')
depends=('libcap' 'libcap.so' 'libnl' 'ncurses' 'libncursesw.so')
makedepends=('git' 'lm_sensors')
optdepends=('lm_sensors: show cpu temperatures'
            'lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs')
validpgpkeys=('F7ABE8761E6FE68638E6283AFE0842EE36DD8C0C'  # Nathan Scott <nathans@debian.org>
              '0D316B6ABE022C7798D0324BF1D35CB9E8E12EAD') # Benny Baumann <BenBE@geshi.org>
source=(
  "git+https://github.com/htop-dev/htop.git#tag=${pkgver}?signed"
  "disable-process-list.patch"
)
sha256sums=(
  'SKIP'
  '1a2f2ba92076a313a572dc3b151b3f2bb1649c5647613235f092750e99a12352'
)

prepare() {
  cd htop

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  autoreconf -fi
}

build() {
  cd htop

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
  cd htop

  make DESTDIR="${pkgdir}" install
}
