# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=jack-matchmaker
pkgver=0.11.0
pkgrel=4
pkgdesc='A command line tool to auto-connect JACK ports matching given patterns'
arch=(any)
url='https://github.com/SpotlightKid/jack-matchmaker'
license=(GPL2)
depends=(jack python-cachetools python-pyjacklib)
makedepends=(python-build python-hatchling python-installer)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz")
backup=("etc/conf.d/$pkgname")
sha256sums=('a386c8f8d8f9e0dbbf1b75f2260f8534ed9c7e75875571adbc493b0f6538be1d')

build() {
  cd ${pkgname/-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname/-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # documentation
  install -vDm 644 README.md example_patterns.txt \
    -t "$pkgdir"/usr/share/doc/$pkgname
  # systemd service
  install -vDm 644 systemd/$pkgname.conf \
    "$pkgdir"/etc/conf.d/$pkgname
  install -vDm 644 systemd/$pkgname.service \
    -t "$pkgdir"/usr/lib/systemd/user
}
