# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien.flament at gmx dot com>

pkgname=libdxfrw
pkgver=2.2.0
pkgrel=3
pkgdesc="C++ library to read/write DXF files in binary and ASCII form and to read DWG files from r14 to v2015"
url="https://github.com/LibreCAD/libdxfrw"
license=('GPL-2.0-only')

arch=('x86_64')
makedepends=('cmake')
depends=('libgcc' 'libstdc++')

conflicts=('libdxfrw-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LibreCAD/libdxfrw/archive/refs/tags/LC${pkgver}.tar.gz")
sha256sums=('b56535f8c234bb119b94e11b2436651531869ba0171bb10166b007588e97d69f')

function prepare
{
  # Le dossier extrait de l'archive ne prend pas en compte le renommage de cette
  # dernière. Il est donc renommé à son tour.
  #
  # Lors d'une reconstruction, l'ancien dossier doit être supprimé de manière
  # sécurisée.
  rm -Rf "$srcdir/$pkgname-$pkgver"
  mv "$pkgname-LC$pkgver" "$pkgname-$pkgver"
}

function build
{
  cd "$pkgname-$pkgver" || return

  # La constrution est configurée dans un dossier *build*.
  #
  # HACK: La version de CMake minimale demandée n'est pas en adéquation avec
  # celle du système. Elle est donc forcée.
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_LIBDIR="lib" \
      -S . \
      -B build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5

 # Le logiciel est contruit dans le dossier *build*.
  cd build || return

  make all
}

function package
{
  cd "$pkgname-$pkgver/build" || return

 # Le logiciel est installé selon les spécifications du développeur.
  make install DESTDIR="$pkgdir"
}
