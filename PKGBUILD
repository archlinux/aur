# Maintainer: Fabio Zanini <fabio.zanini@tuebingen.mpg.de>
pkgname=python-fastaq-git
pkgver=v1.7.0.r0.g360153c
pkgrel=2
pkgdesc="Manipulate FASTA and FASTQ files."
arch=('any')
url="https://github.com/sanger-pathogens/Fastaq"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('python-fastaq')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/sanger-pathogens/Fastaq.git"
_gitname="Fastaq"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
