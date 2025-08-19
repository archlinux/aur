# Maintainer:  Edmund Lodewijks <edmund@proteamail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@gmail.com>

_origname=sendmail # libmilter is bundled with the sendmail source
_pkgname=libmilter
pkgname=libmilter-sharedlib
pkgbase="${pkgname}"
pkgver=8.18.1
pkgrel=12
pkgdesc='Implementation of the sendmail Mail Filter API'
url='https://www.proofpoint.com/us/sendmail-open-source'
arch=('x86_64')
license=('Sendmail-8.23')
provides=('libmilter')
source=(
  "https://ftp.sendmail.org/$_origname.$pkgver.tar.gz"{,.sig}
  'site.config.m4'
  'Patch01-fd-passing-libmilter.patch'
  'Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch'
  'Patch03-libmilter-Makefile-m4.patch'
  'Patch04-Bool-type-C23.patch'
)
# Signing keys sourced from upstream. Current version is signed with the 2024 keys.
# https://www.proofpoint.com/us/products/email-protection/open-source-email-solution
validpgpkeys=('8AB063D7A4C5939DA9C01E38C4065A87C71F6844')
b2sums=('3afa36073fd611c7fdb43ef0ab9f02d5fb8ae388e9471bdc7275c6c9dcee0a654f46ddef505b70e978cb1b818b0da375250678e501676d8bace534d59ee40d90'
        'SKIP'
        '42c119ee25de264f3d8e0f82d23cd4a74b65806d5dd4bdf91afe1068ef343b6fabf4da55e21176353bddfc781a6bdcf63df3a64721322e0dd4323c5f4ff2e19d'
        'ea2f1811666ce1b2c7532794845de9ec1f1e72d6c58a02c4c5800e93359c1c1cd4a0353fee572c258c378b0fea776d03ba19d794da7ed3295d9432b47ceb2481'
        '3ce6d5c4cef02596a7a629d560f92f2b63bbf10b7cae02cf2f4801d90af1b0221ab4ad06d31b6fc693159479ad3758860efa28ab3074ff2537de171a66fc5f90'
        '021fa2791591092dff0acb7f0d31ac71c35d6d2aabd84f25d9b754e8cbb5c4960ece87646aee6068edf9fdd733c82d9ef6cf1c7d18c0d581345c811b638b02b4'
        '3b0e12a63debe17120145b9230ec67252b74e8baf4d15dbf24473106b68486e92a4d19c9f29bf9f6e3f4eb09c29b6148e9a58c1a0362924108171b7f9e7f03cc')

prepare() {
  cd "$_origname-$pkgver"
  patch -p1 -i ../Patch01-fd-passing-libmilter.patch # FS#49421

  # Set Arch Linux specific options
  cp ../site.config.m4 devtools/Site

  # Prevent circular reference to CFLAGS when local CFLAGS are set via 'confOPTIMIZE' in site.config.m4
  patch -p1 -i ../Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch

  # Patch for libmilter dynamic shared object by Edmund Lodewijks - Based on libmilter patch by Fedora
  patch -p1 -i ../Patch03-libmilter-Makefile-m4.patch

  # Patch for C23+ 'bool' now keyword in C
  patch -p1 -i ../Patch04-Bool-type-C23.patch
}

build() {
  cd "$_origname-$pkgver/$_pkgname"
  ./Build
}

package() {
  # create install directory
  install -vd "$pkgdir/usr/lib"

  # install library files
  cd "$_origname-$pkgver/$_pkgname"
  ./Build DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" ../LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" ../README
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" docs/*

  # correct permissions
  chown -R root:root "$pkgdir"
}
