# Mainteiner: dieghen89
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-input-synaptics-xswipe-git
pkgver=r1464.8cc57ce
pkgrel=2
pkgdesc="Synaptics driver for notebook touchpads - Forked branch with -m flag forward ported and 4/5 finger detectable"
arch=('i686' 'x86_64')
license=('custom')
url="https://github.com/diegoferigo/xserver-xorg-input-synaptics"
depends=('libxtst' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=22.1' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto' 'git')
conflicts=('xorg-server<1.15.0' 'X-ABI-XINPUT_VERSION<22.1' 'X-ABI-XINPUT_VERSION>=23')
replaces=('synaptics' 'xf86-input-synaptics')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics' 'xf86-input-synaptics')
groups=('xorg-drivers' 'xorg')
backup=('etc/X11/xorg.conf.d/50-synaptics.conf')
source=("${pkgname}::git+https://github.com/dieghen89/xserver-xorg-input-synaptics.git")
#        add_tapbuttons.diff)
sha256sums=('SKIP')
#            '5298d3e871db3768b34cf8516d3f53f9291202e2ea5de3300256e1cd9119a1ec')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  #git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  #git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  #git describe --long | sed -E 's/^foo-//;s/([^-]*-g)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  # * upstream disabled tapping by default if a physical left button is present - see FS#33282
  # * enable MatchDevicePath directive by default - FS#33291
  #patch -Np1 -i ${srcdir}/add_tapbuttons.diff
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 conf/50-synaptics.conf "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/usr/share/X11"
}
