pkgname=topinambour-git
pkgver=1.0.11.r35.g28d83dc
pkgrel=2
pkgdesc="vte terminal based on the ruby-gtk3 bindings"
arch=('i686' 'x86_64')
url="https://github.com/cedlemo/topinambour"
license=('GPL')
depends=('fish' 'ruby' 'ruby-gtk3' 'ruby-vte3')
makedepends=('git')
source=('git://github.com/cedlemo/topinambour' 'topinambour-git.desktop')
md5sums=('SKIP'
         '22c3f5dacc5d3d9d657b29b6fcb6fcef')

pkgver() {
  cd "topinambour"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/topinambour"
  gem build topinambour.gemspec

}
package() {
  cd "${srcdir}/topinambour"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    topinambour-*.gem
install -Dm644 "data/topinambour.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/topinambour.gschema.xml"
install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
