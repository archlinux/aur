# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=4.4.2
pkgrel=4
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
conflicts=($_pkgname)
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
depends=(python-gobject)
makedepends=(auth-tarball-from-git)
source=($_pkgname-$pkgver.tar.gz::https://github.com/bleachbit/bleachbit/archive/refs/tags/v$pkgver.tar.gz
        az0.pgp) # Andrew Ziem <ahz001@gmail.com>
sha256sums=('6001c864688e36bd8f950c1341923c9347c2373149a9ce98dc26c39023b51997'
            '1924b4efdb5d74f33b9bc2459dd66a7f1e1e48fef107352fd88ae2b033c04f5a')

prepare() {
  cd $_pkgname-$pkgver
  auth-tarball-from-git --keyring ../az0.pgp \
    --prefix "$_pkgname-$pkgver" --tag v$pkgver \
    https://github.com/bleachbit/bleachbit ../$_pkgname-$pkgver.tar.gz
}

package() {
  cd $_pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install

  # suggestion by Meow to force script to operate in cli mode
  sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit

  rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
  rm -rf "$pkgdir"/usr/share/polkit-1
}
