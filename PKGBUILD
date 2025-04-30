# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=whatwg-html
pkgver=2025.4
pkgrel=2
pkgdesc="Clone the WHATWG HTML specification with local resources"
arch=('any')
url="https://www.github.com/whatwg/html-build"
license=('GPL')
makedepends=(git perl perl-lwp-protocol-https)

_gitroot=https://www.github.com/whatwg/html-build.git/
_gitname='html-build'
_htmlroot=https://github.com/whatwg/html.git/
_html='html'

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [[ -d "$_gitname" ]]; then
    msg "Updating..."
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    msg "Cloning..."
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
    msg "Clone completed."
  fi

  msg "Cloning ${_gitname}"

  if [[ -d "$_html" ]]; then
    msg "Updating..."
    cd "$_html" && git pull origin
    msg "The local files are updated."
  else
    msg "Cloning..."
    git clone --depth 5 "$_htmlroot" "$_html"
    cd "$_html"
    msg "Clone completed."
  fi
}

build() {
  cd "${srcdir}/${_gitname}"
  msg "Starting build..."

  cd html
  mv source source.orig

  msg "Downloading Resources and Patching source"
  perl ../../../download-resources.pl source.orig source
  cd ..
  ./build.sh --remote
  mv html/resources output/
}

package() {
  cd "$srcdir/${_gitname}"

  mkdir -p ${pkgdir}/usr/share/doc/whatwg/
  cp -rv output/* ${pkgdir}/usr/share/doc/whatwg/
}
