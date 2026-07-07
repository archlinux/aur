# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Mathias Anselmann <mathias.anselmann@posteo.de.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=lmod
pkgver=9.2.5
pkgrel=1
pkgdesc='Environment modules system based on Lua that handles MODULEPATH hierarchical problem. Supports also legacy TCL modules'
arch=('x86_64')
url='https://github.com/TACC/Lmod'
license=('MIT')
depends=('bash' 'lua' 'lua-filesystem' 'lua-posix' 'procps-ng' 'tcl' 'bc')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
conflicts=('environment-modules')
provides=('environment-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TACC/Lmod/archive/${pkgver}.tar.gz")
install=lmod.install
sha256sums=('e913f9199a77104cc915a3c1a65e4c700ed048cef15857e93881d79887efc568')

build() {
  cd "Lmod-${pkgver}"

  ./configure --prefix=/usr/share

  make
}

package() {
  cd "Lmod-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/lmod/${pkgver}/share/man/man1/module.1" "${pkgdir}/usr/share/man/man1/module.1"
  rm -r "${pkgdir}/usr/share/lmod/${pkgver}/share"

  install -d "${pkgdir}/etc/profile.d"
  cd "${pkgdir}/etc/profile.d"
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc   modules.csh
}
