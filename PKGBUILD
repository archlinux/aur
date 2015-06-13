# Maintainer: Muflone http://www.muflone.com/#contacts
# Contributor: Nicolas Joseph <nicolas.joseph@valaide.org>
pkgname=valide
pkgver=0.7.2
pkgrel=1
pkgdesc="Val(a)IDE is an Integrated Development Environment for the Vala programming language (Tarnyko branch)."
arch=('i686' 'x86_64')
url="http://www.tarnyko.net/en/?q=node/24"
license=('GPL3')
depends=('gdl2' 'vala' 'vala0.12' 'gtksourceview2' 'intltool' 'libunique' 'python' 'desktop-file-utils')
options=(!emptydirs)
source=("http://www.tarnyko.net/valaide/${pkgname}-${pkgver}_(TARNYKO).tgz"
        "define__unused__.patch"
        "${pkgname}-16.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}-64.png")
md5sums=('ff490ddd4fd6a0ea66799936a546ec89'
         'd06532619522fca4509e5bf053f785d0'
         'aac4e39f03d8009c156243b1a6d6f985'
         '014678cfc8101cfe558d7ec72d9feaa2'
         '71ca8aedf3cea5b0086f36885f5f9902'
         '1399e82ad864f32b9b50eece09a54b90')
install="${pkgname}.install"

prepare() {
  cd "${srcdir}"
  # Add a temporary symlink to valac-0.12
  [ -h valac ] && rm valac
  ln -s /usr/bin/valac-0.12 valac
  # Apply patch to avoid compilation errors in __unused__
  patch -p1 < define__unused__.patch
}

build() {
  cd "${srcdir}/~tarnyko/${pkgname}/trunk"
  # Override the system installed valac to force the use of the valac-0.12
  PATH="${srcdir}:$PATH" python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd "${srcdir}/~tarnyko/${pkgname}/trunk"
  python2 ./waf install --destdir="${pkgdir}"
  # Install icons
  for size in 16 32 48 64
  do
    install -m 644 -D "${srcdir}/${pkgname}-${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
  # Fix desktop file icon
  sed -i "s/Icon.*/Icon=${pkgname}/" "${pkgdir}/usr/share/applications/valide.desktop"
}
