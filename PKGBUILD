# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=whatwg-html
pkgver=2017_08
pkgrel=1
pkgdesc="Clone the WHATWG HTML specification with local resources"
arch=('any')
url="https://www.github.com/whatwg/html-build"
license=('GPL')
makedepends=(git perl perl-lwp-protocol-https)

_gitroot=https://www.github.com/whatwg/html-build.git
_gitname='html-build'
_htmlroot=https://github.com/whatwg/html.git
_html='html'

build() {
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

  msg "Cloning HTML..."

  if [[ -d "$_html" ]]; then
    msg "Updating..."
    cd "$_html" && git pull origin
    msg "The local files are updated."
  else
    msg "Cloning..."
    git clone --depth 1 "$_htmlroot" "$_html"
    cd "$_html"
    msg "Clone completed."
  fi

  msg "Starting build..."

  mv source source.orig
  perl $startdir/download-resources.pl source.orig source
  cd ..
  ./build.sh
  mv html/resources output/multipage/
}

package() {
  cd "$srcdir/${_gitname}"

  mkdir -p ${pkgdir}/usr/share/doc/whatwg
  cp -rv output/multipage ${pkgdir}/usr/share/doc/whatwg/html
}

# vim:set ts=2 sw=2 et:
