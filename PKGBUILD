# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Mathias Anselmann <mathias.anselmann@posteo.de.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=lmod
pkgver=9.1.2
pkgrel=2
pkgdesc='Environment modules system based on Lua that handles MODULEPATH hierarchical problem. Supports also legacy TCL modules'
arch=('x86_64')
url='https://github.com/TACC/Lmod'
license=('MIT')
depends=('bash' 'lua54' 'lua54-filesystem' 'lua54-posix' 'procps-ng' 'tcl' 'bc')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
conflicts=('env-modules')
provides=('env-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TACC/Lmod/archive/${pkgver}.tar.gz"
        "lmod.install")
install=lmod.install
sha256sums=('b7277482677a22c3396b88a1290406ca20bb2564c59632403ca98373f132e65a'
            '8053609022861417d7f98200e42067910ec810024759f5e596940df5fcfec206')

build() {
  cd "Lmod-${pkgver}"

  ./configure                  \
    --prefix=/usr/share        \
    --with-lua=/usr/bin/lua5.4 \
    --with-luac=/usr/bin/luac5.4

  make
}

package() {
  cd "Lmod-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${pkgdir}/usr/share/lmod/${pkgver}/share/man/man1/module.1" "${pkgdir}/usr/share/man/man1/module.1"
  rm -r "${pkgdir}/usr/share/lmod/${pkgver}/share"

  install -d "${pkgdir}/etc/profile.d"
  cd "${pkgdir}/etc/profile.d"
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc   modules.csh
}
