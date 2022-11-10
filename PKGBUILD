# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-gnome-clipboard-history
pkgver=1.3.0
pkgrel=1
pkgdesc="Gnome Clipboard History is a Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=('any')
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
install="${pkgname}.install"
license=('MIT')
depends=('gnome-shell>=40')
makedepends=('git'
             'glib2'
             'curl'
             'jq')
provides=("${pkgname}")
conflicts=('gnome-shell-extension-gnome-clipboard-history'
           'gnome-shell-extension-clipboard-indicator')
options=('!strip')
source=("git+${url}.git")
sha256sums=('SKIP')

# fetch the latest release
# thanks goes to Martin Dünkelmann <nc-duenkekl3 at netcologne.de>
_github_api_uri=https://api.github.com/repos/SUPERCILEX/gnome-clipboard-history/releases/latest

pkgver() {
  curl --silent ${_github_api_uri} | jq -r '.tag_name'
}

prepare() {
  cd "${srcdir}"/gnome-clipboard-history
  git checkout tags/$(curl --silent ${_github_api_uri} | jq -r '.tag_name')
}

package() {
  local _pkgname=gnome-clipboard-history
  cd $srcdir/$_pkgname
  make compile-locales
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.clipboard-indicator.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  find . -regextype posix-egrep -regex ".*\.(js|json|xml|css|mo|compiled)$" -exec\
     install -Dm 644 {} ${destdir}/{} \;
  install -Dm644 "${srcdir}/${_pkgname}/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
# rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}

