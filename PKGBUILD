# Original Core Repo
# ======================
# Maintainer: Eric Bélanger <eric@archlinux.org>

# Modifications to work for QEMU and Virtualbox
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=gpm-vm
_pkgname=gpm
pkgver=1.20.7.r27.g1fd1941
_commit='1fd19417b8a4dd9945347e98dfa97e4cfd798d77'
pkgrel=1
pkgdesc='A mouse server for the console and xterm (for QEMU/VirtualBox)'
arch=('x86_64')
url='https://www.nico.schottelius.org/software/gpm/'
license=('GPL')
depends=('bash' 'procps-ng')
makedepends=('git')
options=('!makeflags')
source=("git+https://github.com/telmich/gpm.git#commit=${_commit}"
        '0001-glibc-sigemptyset.patch'
        'gpm.sh'
        'gpm.service'
        'gpm-23.patch'
        'gpm-vm'
        'gpm-vm.conf')
sha256sums=('SKIP'
            '61f901aae46ff79679a058758151dc93901dcd9ea938fabb0765554993b8cb09'
            'f41e90dcf6c0c6c4b8eff1c69039a20eb6b38ea851ffd1fa47ba311bf83d6ed8'
            '4d1e92a82006a7d361deeb8760514bbf1b33b40264bb57a4f4087239009d0485'
            'f9f228a17701afcf383396861cfe798067505b4dbfddbb4fa91ee3e4c5088175'
            '4bad510d05315ed02defe3abd6f41660cb384290a8d93e9f5c6f23269c24c21d'
            '8992300b9636b26864a2930a70ef78e52300432c614865c36885c53f1f7e546f')
provides=('gpm')
conflicts=('gpm')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.g%s' \
    "${GITTAG}" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -Np1 < ../0001-glibc-sigemptyset.patch
  patch -Np1 < ../gpm-23.patch

  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m0755 ../gpm.sh "${pkgdir}/etc/profile.d/gpm.sh"
  install -D -m0644 ../gpm.service "${pkgdir}/usr/lib/systemd/system/gpm.service"
  install -D -m0755 ../gpm-vm "${pkgdir}/usr/bin/gpm-vm"
  install -D -m0644 ../gpm-vm.conf "${pkgdir}/etc/gpm-vm.conf"

# library fixes
  cd "${pkgdir}/usr/lib/"
  ln -s libgpm.so.2.* libgpm.so
  chmod 0755 "${pkgdir}"/usr/lib/libgpm.so.*
}
