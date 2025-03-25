pkgname=gnome-shell-extension-enhanced-osk-git
pkgver=r177.d98b9cf
pkgrel=1
pkgdesc="Enhanced On-Screen Keyboard for Gnome Shell"
arch=("any")
url="https://github.com/honjow/enhanced-osk-gnome-ext.git"
license=("GPL")
source=("git+$url#branch=dev")
md5sums=('SKIP')
makedepends=("git")
_uuid="enhancedosk@cass00.github.io"

pkgver() {
    cd "$srcdir/enhanced-osk-gnome-ext"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

  cd "$srcdir/enhanced-osk-gnome-ext"

  # Compile gnome-shell-osk-layouts.gresource
  cd src/data && ./compile-gresource.sh

  # Compile gschemas.compiled
  cd ../schemas && glib-compile-schemas .

  cd ../.. && mkdir -p dist
  cp LICENSE README.md src/*.js src/metadata.json dist/
  mkdir -p dist/data
  cp src/data/gnome-shell-osk-layouts.gresource dist/data/
  mkdir -p dist/schemas
  cp src/schemas/gschemas.compiled src/schemas/org.gnome.shell.extensions.enhancedosk.gschema.xml dist/schemas/
}

package() {

  source_dir="$srcdir/enhanced-osk-gnome-ext"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm755 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" "${source_dir}"/dist/*.*
  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/data"
  install -Dm755 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/data" "${source_dir}"/dist/data/*.*

  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "${source_dir}/dist/schemas"/*.xml

}
