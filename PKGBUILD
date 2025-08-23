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
pkgrel=14
pkgdesc='Implementation of the sendmail Mail Filter API'
url='https://www.proofpoint.com/us/sendmail-open-source'
arch=('x86_64')
license=('Sendmail-8.23')
provides=('libmilter')
source=(
  "https://ftp.sendmail.org/$_origname.$pkgver.tar.gz"{,.sig}
  "https://ftp.sendmail.org/mfapi.h.p1"{,.sig}
  "libmilter-tests.sh"
  'site.config.m4'
  'Patch01-fd-passing-libmilter.patch'
  'Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch'
  'Patch03-enable-building-shared-library.patch'
  'Patch04-fix-SONAME-and-create-Linux-symlinks.patch'

)
# Signing keys sourced from upstream. Current version is signed with the 2024 keys.
# https://www.proofpoint.com/us/products/email-protection/open-source-email-solution
validpgpkeys=(
    '8AB063D7A4C5939DA9C01E38C4065A87C71F6844'
    '032312C7C0C2B1973D5013180C19D37CB7E6543E'
)
b2sums=('3afa36073fd611c7fdb43ef0ab9f02d5fb8ae388e9471bdc7275c6c9dcee0a654f46ddef505b70e978cb1b818b0da375250678e501676d8bace534d59ee40d90'
        'SKIP'
        '3b0e12a63debe17120145b9230ec67252b74e8baf4d15dbf24473106b68486e92a4d19c9f29bf9f6e3f4eb09c29b6148e9a58c1a0362924108171b7f9e7f03cc'
        'SKIP'
        'b13bf24a3a0c899c6b13c16329be33018e9c22187336636c5d8602fd3ea7338d882f2db10ed37727e7b4bf6191630ffeb50b23d3bc602434770c4e1fae3bf410'
        '73ad813c14a57d09aa764be80d9798ec429399387ea31807d575c22134a5daf3ef16a454ee9e9c5301a544d7a08fa0e33899e538d4b61bee008e2d2a13889707'
        'ea2f1811666ce1b2c7532794845de9ec1f1e72d6c58a02c4c5800e93359c1c1cd4a0353fee572c258c378b0fea776d03ba19d794da7ed3295d9432b47ceb2481'
        '3ce6d5c4cef02596a7a629d560f92f2b63bbf10b7cae02cf2f4801d90af1b0221ab4ad06d31b6fc693159479ad3758860efa28ab3074ff2537de171a66fc5f90'
        '0dabe047d660ea6999e36bd9aaa46f78ff7f500ddebe67f331e34d0c281ad30db601134531b235101f349416a23f6465505ac1a6fbd62fdfdbbaa6e7d75a1f03'
        'c9de64d09e593b315e0539121d75c66bd47d745553f1bfedac58992f8116d7963285c2ee4c66787ef275811fbce771e23c83e024a021965f3bbcd02ee1344848')

prepare() {
  cd "$_origname-$pkgver"
  patch -p1 -i ../Patch01-fd-passing-libmilter.patch # FS#49421

  # Patch for C23+: 'bool' now keyword in C (Patch from Sendmail - License: Sendmail-8.23)
  patch -p1 -i ../mfapi.h.p1

  # Set Arch Linux specific options
  cp ../site.config.m4 devtools/Site

  # Prevent circular reference to CFLAGS when local CFLAGS are set via 'confOPTIMIZE' in site.config.m4
  patch -p1 -i ../Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch

  # Enable the building of a static and shared library
  patch -p1 -i ../Patch03-enable-building-shared-library.patch

  # Extract milter version number from mfapi.h. Create SONAME and all symlinks for Linux
  patch -p1 -i ../Patch04-fix-SONAME-and-create-Linux-symlinks.patch
}

build() {
  cd "$_origname-$pkgver/$_pkgname"
  ./Build
}

check() {
  # TO DO: Break if a test fails
  ./libmilter-tests.sh
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
