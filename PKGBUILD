# Maintainer: Edmund Lodewijks <e.lodewijks @ gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@gmail.com>

# This `libmilter` package differs from the one in Arch Linux repos
# in that is is built with local CFLAGS and LDFLAGS;
# it builds a shared library (libmilter.so) instead of a static archive;
# and it installs the documentation.

_origname=sendmail # libmilter is bundled with the sendmail source
_pkgname=libmilter
pkgname=libmilter-sharedlib
pkgbase="${pkgname}"
pkgver=8.18.1
pkgrel=3
pkgdesc='Implementation of the sendmail Mail Filter API'
url='https://www.proofpoint.com/us/sendmail-open-source'
arch=('x86_64')
license=('Sendmail')
provides=('libmilter')
conflicts=('libmilter')
# Signing keys sourced from upstream. Current version is signed with the 2024 keys.
# https://www.proofpoint.com/us/products/email-protection/open-source-email-solution
validpgpkeys=('8AB063D7A4C5939DA9C01E38C4065A87C71F6844')
source=(
  "https://ftp.sendmail.org/$_origname.$pkgver.tar.gz"{,.sig}
  'site.config.m4'
  'Patch00-fd-passing-libmilter.patch'
  'Patch01-Build-shared-object.patch'
)
sha512sums=('9ce713b44439d4de6faa9e3cdfa2226b44b4fbeb352a5f81584c062570e9472da244158287e489aabe258d28fe54ca4964565c7b0adc7e1763d212be42f98061'
            'SKIP'
            'f99db7981cf17d8a4a6476ffe03b8c8bccc568eb7a613a5a9e96fd8d10be425842a97b3f4188d80a03cc9738836fdbb4ca6ff0eea3decd9e191b3c775b1bb175'
            '438dfb94d4b884a08abbb20849a8b309b251b9d48c098575e67603d9d4d23d8ac799287cedd975b8aae61c550b987a9bf8dd7c9343ed289185b7e2ca72cbc82a'
            '664ada72a19333dc20aad4e5cc42f957f3c3704782157520e558be917c591278a271c2b35824e8313cfca501af65add3a722380e233314e94dfcb8aafcae53a3')
b2sums=('3afa36073fd611c7fdb43ef0ab9f02d5fb8ae388e9471bdc7275c6c9dcee0a654f46ddef505b70e978cb1b818b0da375250678e501676d8bace534d59ee40d90'
        'SKIP'
        'f1361c914d6436e7dbda20bacfde5cb37ce25bd257e7dc63167a152fca2b7aa7f7e05ccc2c0a920ee81e75443b6342efb3eada9640023c44e52ac2f7fc5c3465'
        'ea2f1811666ce1b2c7532794845de9ec1f1e72d6c58a02c4c5800e93359c1c1cd4a0353fee572c258c378b0fea776d03ba19d794da7ed3295d9432b47ceb2481'
        '43805a11aa522abc0a5d250231b4c0a25e389fa747292c24333ec6891b7c82214fba0c865943c51bdba32d15bfb9518da7b38d2784a3c2100eecf569e1e7a760')

prepare() {
  cd "$_origname-$pkgver"
  patch -p1 -i ../Patch00-fd-passing-libmilter.patch # FS#49421

  # Enable local Archlinux CFLAGS and LDFLAGS.
  cp ../site.config.m4 devtools/Site
  sed -i "s/-O2/${CFLAGS}/g" devtools/OS/Linux
  sed -i "s/@@LDOPTS@@/${LDFLAGS}/g" devtools/Site/site.config.m4

  # Files for libmilter shared object (.so)
  patch -p1 -i ../Patch01-Build-shared-object.patch
  chmod +x libsharedmilter/Build
}

build() {
# This builds `libmilter.so', not `libmilter.a'.
# If you want to (also) build `libmilter.a', (also) use the following
# directory in the "./Build" functions in build() and package():
#
#   "$_origname-$pkgver/$_pkgname"
#
  cd "$_origname-$pkgver/libsharedmilter"
  ./Build
}

package() {
  cd "$_origname-$pkgver/libsharedmilter"

  # create install directory
  install -vd "$pkgdir/usr/lib"
  ./Build DESTDIR="$pkgdir" install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" ../LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" ../README
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" docs/*

  # correct permissions
  chown -R root:root "$pkgdir"
}
