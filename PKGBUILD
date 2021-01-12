# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kbd-git
pkgver=2.4.0
pkgrel=1
pkgdesc="Keytable files and keyboard utilities"
arch=('x86_64')
url="http://www.kbd-project.org"
license=('GPL')
depends=('glibc' 'pam')
makedepends=('check' 'git')
source=(git+https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git
        'fix-euro2.patch'
	'vlock.pam')
provides=('vlock' 'kbd')
conflicts=('vlock' 'kbd')
replaces=('vlock')
sha256sums=('SKIP'
            'a5e0167b6a82a9eb4d581d56baab930c2d80f5541dc34630460b73e1115384b8'
            '5c2d377a87121e7c399534fb91e2ffc0cc1e75d44a8f07ee6f55c9c089bc81e4')
#validpgpkeys=('7F2A3D07298149A0793C9A4EA45ABA544CFFD434' #Alexey Gladkov)

prepare() {
  cd kbd
  # rename keymap files with the same names
  # this is needed because when only name of keymap is specified
  # loadkeys loads the first keymap it can find, which is bad (see FS#13837)
  # this should be removed when upstream adopts the change
  mv data/keymaps/i386/qwertz/cz{,-qwertz}.map
  mv data/keymaps/i386/olpc/es{,-olpc}.map
  mv data/keymaps/i386/olpc/pt{,-olpc}.map
  mv data/keymaps/i386/fgGIod/trf{,-fgGIod}.map
  mv data/keymaps/i386/colemak/{en-latin9,colemak}.map
  # fix euro2 #28213
  patch -Np1 -i ../fix-euro2.patch
}

build() {
  cd kbd

  ./autogen.sh
  ./configure --prefix=/usr --datadir=/usr/share/kbd --mandir=/usr/share/man
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
}

#check() {
#  cd kbd

# This test is expected to fail since kbd-fix-loadkmap-compat.patch modifies the binary format
#  sed -e 's|dumpkeys-bkeymap ||' -i tests/Makefile

#  make check
#}

package() {
  cd kbd
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes DESTDIR="${pkgdir}" install
  install -Dm644 ../vlock.pam "${pkgdir}"/etc/pam.d/vlock
}
