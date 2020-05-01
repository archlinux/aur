# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Kevin Sullivan <ksullivan@archlinux.us>

pkgname=easystroke
pkgver=0.6.0
pkgrel=22
pkgdesc='Use mouse gestures to initiate commands and hotkeys.'
arch=('x86_64')
url='http://easystroke.sourceforge.net/'
license=('custom:ISC')
depends=('gtkmm3' 'boost-libs' 'libxtst' 'dbus-glib' 'xorg-server')
makedepends=('boost' 'xorgproto' 'intltool' 'gettext' 'xorg-server-devel' 'help2man')
source=("https://downloads.sourceforge.net/easystroke/${pkgname}-${pkgver}.tar.gz"
        'easystroke-0.6.0-gcc7-build-fix.patch'
        'replace-sigc-group-with-lambda.patch')
sha512sums=('a74cbdfd2b56e6b20d895297e80fb63f3d8ac938235ecf7067f984d087004af22a5ea0116ae20b948e238b02a06b14044a7025d65840f0c8d00542332387c921'
            'ab243cd570a4878767bfc64f39dbf6cc938bf050b50e4ac3bfe5036f5fbdd21eeeedc5cf89784a4f73f78233132b981d00087482835430d240f0b55e16d1acb4'
            '30b3a50b3434b22d3aed75f8c023eafb78f6980a23c506e9ed70e8787fd2786a1a882468b5c8334e3161c241c1878f8b4f9ba0178e07aad0388d44522e70c245')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix compilation with GCC 7.
  patch -Np1 -i ../easystroke-0.6.0-gcc7-build-fix.patch

  # fix build with libsigc++ 2.6; also build in C++11 mode
  # (not sure if the lambda is correct, but seems to work)
  patch -Np1 -i ../replace-sigc-group-with-lambda.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  make
  make man
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm0644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
