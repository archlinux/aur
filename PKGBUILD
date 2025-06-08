# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: Raphaël Proust <raphlalou@gmail.com>

_pkgname=opam
pkgname=$_pkgname-git
pkgver=2.4.0.alpha2.r22.g708d62ec2
pkgrel=1
pkgdesc='OCaml package manager'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://opam.ocaml.org/'
license=(GPL)
depends=('bubblewrap' 'ocaml-compiler-libs' 'unzip')
makedepends=('git' 'curl')
optdepends=(
  'darcs: For downloading packages with darcs'
  'git: For downloading packages with git'
  'mercurial: For downloading packages with mercurial'
  'rsync: For downloading packages with rsync'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/ocaml/opam.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  # A clean environment seems mandatory to avoid conflicts with
  # existing installation of Opam packages. This may cause surprises
  # if you have a peculiar customization of your OCaml/Opam setup.
  env -i PATH=/usr/bin LANG=$LANG ./configure --prefix=/usr
  env -i PATH=/usr/bin LANG=$LANG make lib-ext all
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
