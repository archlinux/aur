# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-gnome-clipboard-history
pkgver=1.2.0
pkgrel=1
pkgdesc="Gnome Clipboard History is a Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=('any')
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
install="${pkgname}.install"
license=('MIT')
depends=('gnome-shell>=40')
makedepends=('git'
             'glib2')
provides=("${pkgname}")
conflicts=('gnome-shell-extension-gnome-clipboard-history'
           'gnome-shell-extension-clipboard-indicator')
options=('!strip')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('dcdb267def1dd929930779abac20e4fec091f0bc325356d16193e8d4a63ba1e9')


package() {
  local _pkgname=gnome-clipboard-history
  cd $srcdir/$_pkgname-$pkgver
  make compile-locales
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.clipboard-indicator.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

