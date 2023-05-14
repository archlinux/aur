# Maintainer: Francesco Cherchi <francesco.cherchi@protonmail.com>
# Contributor: Francesco Cherchi <francesco.cherchi@protonmail.com>

_srcname=vertical-workspaces
pkgname=gnome-shell-extension-${_srcname}-git
pkgver=r542.e1fa64f
pkgrel=1
pkgdesc="Changes the horizontal layout of workspaces to vertical and adds customization of Activities Overview layout"
url="https://github.com/G-dH/${_srcname}"
arch=('any')
license=("GPL3")
depends=( "gnome-shell" )
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_srcname}"
  glib-compile-schemas schemas
  for infile in po/*.po; do
    outdir=locale/${infile:3:-3}/LC_MESSAGES
    mkdir --parents "${outdir}"
    msgfmt --check --output "${outdir}/${_srcname}.mo" "$infile"
  done
  mkdir build
  mv --target-directory=build schemas lib locale metadata.json stylesheet.css *.js
}

package() {
  cd "${_srcname}"
  mkdir --parents "${pkgdir}/usr/share/gnome-shell/extensions"
  while read; do
    if [[ $REPLY =~ ^[[:space:]]+\"uuid\":[[:space:]]\"(.*)\",$ ]]; then
      uuid="${BASH_REMATCH[1]}"
      break
    fi
  done < build/metadata.json
  cp --recursive build "${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
}
