# Maintainer:  Hildigerr Vergaray <Maintainer@YmirSystems.com>
# Contributer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pipewalker
pkgver=0.9.5
pkgrel=3
pkgdesc="Pieces of a computer network are to be turned, to make all computers connected to the same network"
arch=('i686' 'x86_64')
url="http://pipewalker.sourceforge.net/"
license=('GPL')
depends=('mesa' 'sdl' 'desktop-file-utils' 'libpng')
install=$pkgname.install
source=(
  https://github.com/artemsen/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  xdg_settings.patch)
sha256sums=(
  'f74f3224ddd7abcbbb72fe7ed4f1cd74cd4fe1ad64ab472d491afb3e18b73c42'
  '5d04552d97e24de56391ebb37af5bded48c5a27410b701a9f6a258c943f7692e')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np1 -i "${srcdir}/xdg_settings.patch"

  # Update manpage to reference scheme.png install location
  #  not creating an 'examples' directory for a single file.
  sed -i 's|examples/||' "extra/${pkgname}.6"
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  autoreconf -f -i
  ./configure --prefix=/usr
  make
  gzip -c "extra/${pkgname}.6" > ${pkgname}.6.gz
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 ChangeLog "${pkgdir}"/usr/share/doc/$pkgname/ChangeLog
  install -Dm644 extra/scheme.png "${pkgdir}"/usr/share/doc/$pkgname/scheme.png
  install -Dm644 "${pkgname}.6.gz" "${pkgdir}/usr/share/man/man6/${pkgname}.6.gz"
}
