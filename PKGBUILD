# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# -*- mode: sh -*-

pkgname='mlmmj'
pkgver=1.3.0
pkgrel=8
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
depends=('smtp-server')
arch=('i686' 'x86_64' 'armv7h')
url='http://mlmmj.org/'
license=('MIT')
source=(
  "http://mlmmj.org/releases/$pkgname-$pkgver.tar.gz"
  "$pkgname-$pkgver.diff"
  "$pkgname-$pkgver-bash.diff"
  'sysuser.conf'
  'tmpfile.conf'
)
md5sums=(
  '365eff26063ddb87097bf2d93311f8a5'
  '2c01b8fefee3efc87cac391d3060c861'
  '18277bc799488973c5316055cf299af6'
  '2226137319dc972f0ab10c14e6b951dd'
  '0eaa5ec4f143945629577e8abd6b229a'
)
sha1sums=(
  '1c67bc9514f3d69c90bcdc0c42c2e9cba9123d3a'
  '31b661992a0f48ece92cc91a1611da9847b5e041'
  '70a383a8bf5a798aabd0e4bb390b53fef324592b'
  'aeb9f5625407873419eba15d8a414346caf3fabd'
  '1ec89e15977c3617cc5395b10d3ebe1ce4aba9ce'
)
sha256sums=(
  '7609d0dd804f0c084c2e483eb58c60012b698bc76464537852a1ee1ff9c6f0e9'
  '18dd3c663c0c5cc4a713b70b7eb03c2a2b9d6af316e1e080febda1ef61be399c'
  '3a853e7288cb7a077374e3a79890ec47dbbab208611600ee3d2726e5f17889be'
  '4bbc24fc73ecb2d8f509c47eacff290921bb70a24b2a87b19704336cb4c466f1'
  '1836f8ddb013f3762e79b2bbd9e81f850d976c984fa2e24bcc8f39072eeb0d37'
)
sha512sums=(
  'ea40cae02a7ca5949af6ae01adcdc97536f63f9336f1e4081cf875312bb121a285405353a5863aa6d5f09834b2b6dd328650ed212a30f4940b5fbf82d20184cf'
  'a8d74b9f32858be4fb648ba26d85cfc5c1eaedce6f9aec764812164f85f9182207a736df0e0d4710210f7d4ac44cef6342b7dbe566012492cddbcf4c01c3c8f2'
  '2dd3ebd263467d8fb6c14f4acb138b5fc38735bfd9c9bb676acb8b2bb1504897ca27a008ef9409903ba911b1c1f763392e8fe3cd6d2d73ce026aa9751c2a744a'
  'c0d96b8d9b1866892be4d14967390cdff2d74a5e4d099bce3c5dadbeef93b6bf69020042c4f986081dc9de62b5707b7f49ce4514999d7a35ceab6e0621a6bf6d'
  '5be7399233f1d2f4b806d2049801cd2f84061de5abcc3565b75e10e6ed197d33370e5d4cf6f8c6fc2e17ff7b984e036b7e4ab69a929ac045fa2f202f29229e1f'
)
b2sums=(
  '6b56ead8fb5840964835b139be7566a14df53266a7d83323176f73430c76702f0dc50f5b255e5881887ad8618abe3ace6cd710128821654709b6135b53adbfe4'
  'c0beb31414df706e3ce2fc62f8d23f893c8ce199adc2a81a48d3e3df6ddcbd131588d0ad12a4cfcd1d0e3db799ed95101a40d9b88d7ee758413310e2dfe205ab'
  '8dd8291af4a6b04565df816f0fb193e749824fc05c4226f748b272346d9077ae5bc9904ecc245e5161e267e9d57cb9202db6b8d8a29c9724f563677798534fcd'
  '946ee7047c127ce3a7a5d784b97002f2373231acad4c1c7cfd65b1fbc4e49761deaf19d74ad8764943736897f03afb814bd92d81e58767f5af3cb87a4a7fa826'
  '6fc6d4bde198896dc706652cd0e32fde43ac47b40c4d3cd2d130aa5e0b3b7cdb1d97c0124d43f9240c143f3f6641fc626a62f2350b8b43c8cfdfb8fcca33391d'
)

prepare() {
  cd "$pkgname-$pkgver" || exit 1

  patch -Np1 -i "$srcdir/$pkgname-$pkgver.diff"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-bash.diff"
}

build() {
  cd "$pkgname-$pkgver" || exit 1

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  make DESTDIR="$pkgdir" install

  for fname in AUTHORS COPYING LICENSE; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/licenses/$pkgname/$fname"
  done

  for fname in ChangeLog FAQ README README.* TODO TUNABLES UPGRADE; do
    install -Dm0644 "$fname" "$pkgdir/usr/share/doc/$pkgname/$fname"
  done

  cd "$srcdir" || exit 1

  install -Dm0644 sysuser.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm0644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# eof
