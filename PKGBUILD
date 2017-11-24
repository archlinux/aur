# Maintainer: Reik Keutterling <spielkind@gmail.com>
# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=libs3-git
_gitname=libs3
pkgver=258.fd8b149
pkgrel=2
pkgdesc="C Library and Tools for Amazon S3 Access"
arch=('i686' 'x86_64')
url="https://github.com/bji/libs3"
license=('GPL')
groups=()
depends=('libxml2' 'openssl' 'curl')
makedepends=('make' 'libxml2' 'openssl' 'curl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git://github.com/bji/${_gitname}.git#commit=fd8b149044e429ad30dc4c918f0713cdd40aadd2"
        'added_s3_versioning_support.patch'
        'extension_to_support_curl_multi_socket_action_operation.patch'
        'fixes_segfault_while_putting_large_files_read_from_stdin.patch')
noextract=()
sha256sums=('SKIP'
         '0549154da30ef026b334a83cb69e168f7bb243a17569f54bbc57f0840d76f8c2'
         '1605ff732130f5644d17d70bffe546297214d287c6eeee1db885bd302b8168c0'
         '8e1b9ebbf98c1db023bb0a735d6dfba224c99e2753c28bb0df1444b530641a62')



prepare() {
 cd "$_gitname"
 # https://github.com/bji/libs3/pull/70
 patch -Np1 -i "${srcdir}/added_s3_versioning_support.patch"
 # https://github.com/bji/libs3/pull/69
 patch -Np1 -i "${srcdir}/extension_to_support_curl_multi_socket_action_operation.patch"
 # https://github.com/bji/libs3/pull/68/commits/05deb102556cd8a06da0940f90f7d22e4f61f162
 patch -Np1 -i "${srcdir}/fixes_segfault_while_putting_large_files_read_from_stdin.patch"
}

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  CFLAGS=-Wno-format-truncation DESTDIR=$pkgdir/usr make install || return 1
}
