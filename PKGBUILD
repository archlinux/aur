# Maintainer: Muflone http://www.muflone.com/#contacts
# Contributor: Nicolas Joseph <nicolas.joseph@valaide.org>
pkgname=valide
pkgver=0.7.2
pkgrel=2
pkgdesc="Val(a)IDE is an Integrated Development Environment for the Vala programming language (Tarnyko branch)."
arch=('i686' 'x86_64')
url="http://www.tarnyko.net/en/?q=node/24"
license=('GPL3')
depends=('gdl2' 'vala' 'vala0.12' 'gtksourceview2' 'intltool' 'libunique' 'python2')
options=(!emptydirs)
source=("http://www.tarnyko.net/valaide/${pkgname}-${pkgver}_(TARNYKO).tgz"
        "define__unused__.patch"
        "${pkgname}-16.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}-64.png")
sha256sums=('e73a072b78c26141f4022e8b7aa8fc8d6ef938b7b10cc3f9380337a3b6042dc6'
            '8fef2f0d25724e0547f891151d1fa26a5558ec78dc493473e3bb48a5578287a4'
            '855b7a88f42ef5ca5ed7726bb46eb82a48f440f82e3959caf7b006a59c053d2c'
            'b745c13ed31329fda4b332115eb8d124ee5e8dcba0661864d8b54b8bca02c5f9'
            '3fa1e9bc456a9e24605eff7328e21d8569bd7d24b153a411c47df889a3537e35'
            '3c6ce8ea8b5b3a7880b1b2437fe528dd1167e5a9a1e2f79f5af97be02b321c51')

prepare() {
  # Add a temporary symlink to valac-0.12
  [ -h valac ] && rm "valac"
  ln -s "/usr/bin/valac-0.12" "valac"
  # Apply patch to avoid compilation errors in __unused__
  patch -p1 < "define__unused__.patch"
}

build() {
  cd "~tarnyko/${pkgname}/trunk"
  # Override the system installed valac to force the use of the valac-0.12
  PATH="${srcdir}:$PATH" python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd "~tarnyko/${pkgname}/trunk"
  python2 ./waf install --destdir="${pkgdir}"
  # Install icons
  for _size in 16 32 48 64
  do
    install -m 644 -D "${srcdir}/${pkgname}-${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  # Fix desktop file icon
  sed -i "s/Icon.*/Icon=${pkgname}/" "${pkgdir}/usr/share/applications/valide.desktop"
}
