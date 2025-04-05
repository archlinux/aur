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
pkgrel=5
pkgdesc='Implementation of the sendmail Mail Filter API'
url='https://www.proofpoint.com/us/sendmail-open-source'
arch=('x86_64')
license=('Sendmail')
source=(
  "https://ftp.sendmail.org/$_origname.$pkgver.tar.gz"{,.sig}
  'site.config.m4'
  'Patch01-fd-passing-libmilter.patch'
  'Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch'
  'Patch03-libmilter-Makefile-m4.patch'
)
# Signing keys sourced from upstream. Current version is signed with the 2024 keys.
# https://www.proofpoint.com/us/products/email-protection/open-source-email-solution
validpgpkeys=('8AB063D7A4C5939DA9C01E38C4065A87C71F6844')
sha512sums=('9ce713b44439d4de6faa9e3cdfa2226b44b4fbeb352a5f81584c062570e9472da244158287e489aabe258d28fe54ca4964565c7b0adc7e1763d212be42f98061'
            'SKIP'
            '39bcdd6c1286b7bbdf5899a7516fd97aca35ef9634db46666c833455e2bd8864d24527fd341c7ca97c4af066975686a73a90b60a2ae4af59a5f01247ac5c0c17'
            '438dfb94d4b884a08abbb20849a8b309b251b9d48c098575e67603d9d4d23d8ac799287cedd975b8aae61c550b987a9bf8dd7c9343ed289185b7e2ca72cbc82a'
            '1ec11f97049a7bb19aed75e6a1ab94153732a5699584d221d4e5048da5eedce948cf8885c67ef3d5edb2f14cd68981b46b7e6e7b699745a68c9a95bb3d790da4'
            '91c99f2ebef17af4fe8a4674a9d146406e08d934ac83232ccd45a22c2b07a9818df02eb0fbc2b3c60687b656b47b4200d28d88fe30ba44864be14e5375624df0')
b2sums=('3afa36073fd611c7fdb43ef0ab9f02d5fb8ae388e9471bdc7275c6c9dcee0a654f46ddef505b70e978cb1b818b0da375250678e501676d8bace534d59ee40d90'
        'SKIP'
        '59943663206080a6f8ecd3ab9ce4f1eec1b50090e90a2857ef7ac2b1e87a8b2e67249e303af1c8896c4186b394294efc0e32920123571a14947238271fc04635'
        'ea2f1811666ce1b2c7532794845de9ec1f1e72d6c58a02c4c5800e93359c1c1cd4a0353fee572c258c378b0fea776d03ba19d794da7ed3295d9432b47ceb2481'
        '3ce6d5c4cef02596a7a629d560f92f2b63bbf10b7cae02cf2f4801d90af1b0221ab4ad06d31b6fc693159479ad3758860efa28ab3074ff2537de171a66fc5f90'
        '36c7e81f3ceb6086e6beb777a0592cda231cc05fc7eecf85acc048dcb266a3cd584ed444ab8bbdd469b23104989644bab2c629710b72e1943f84f35b71f4e8a5')

prepare() {
  cd "$_origname-$pkgver"
  patch -p1 -i ../Patch01-fd-passing-libmilter.patch # FS#49421

  # Set Arch Linux specific options
  cp ../site.config.m4 devtools/Site

  # Prevent circular reference to CFLAGS when local CFLAGS are set via 'confOPTIMIZE' in site.config.m4
  patch -p1 -i ../Patch02-Allow-setting-local-CFLAGS-devtools-M4-UNIX-defines.patch

  # Patch for libmilter dynamic shared object by Edmund Lodewijks - Based on libmilter patch by Fedora
  patch -p1 -i ../Patch03-libmilter-Makefile-m4.patch
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
