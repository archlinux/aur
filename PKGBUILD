# Maintainer: Arnaud Taffanel <dev@taffanel.org>
# Contributor: Victor Häggqvist <victor@snilius.com>

pkgname=solaar
pkgver=0.9.2
pkgrel=2
pkgdesc="Device manager for Logitech's Unifying receiver peripherals"
url="http://pwr.github.com/Solaar/"
license=('GPL2')
groups=()
arch=('any')
depends=('python' 'python-pyudev' 'python-gobject' 'pygtk')
optdepends=(
	'libappindicator3: better integration into Unity'
	)
makedepends=('python')
provides=('solaar')
conflicts=('solaar')
options=(!emptydirs)
install=solaar.install
source=("https://github.com/pwr/Solaar/archive/${pkgver}.tar.gz" 
        'solaar.install'
        'solaar.patch')
sha512sums=('13f469df753cc8fab55f5259ccc3e62b6e44471d277d240cd56ce0580144d2b1f95d731268176648663dd15e5607bfb512f477362f4f100aa0a653b001dfe04b'
            '707594c923f9840716f7584ed43d5078316f06cb9d9a524ad4973453120a1a44dc551dabac156e50b81d98d5480c43c1874d0372a40e1477e64e635674b7e018'
            'cb91902047862da8a600436262270f02bb9f096f3cffb613d300d88dd7476ae9ab27b6a3d186d4cc0b748a107916f188744b2581276de72fc5b83fb3353af6b9')

package() {
  cd "$srcdir/Solaar-${pkgver}/"
  patch -i $srcdir/solaar.patch lib/solaar/ui/window.py
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 rules.d/42-logitech-unify-permissions.rules \
                   "$pkgdir/etc/udev/rules.d/42-logitech-unify-permissions.rules"
}

post_install() {
  xdg-icon-resource forceupdate --theme hicolor
  update-desktop-database -q
} 
# vim:set ts=2 sw=2 et:
