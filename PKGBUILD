# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: c4t0

pkgname=sbagen
pkgver=1.4.5
_river_ver=1.4.1
_rhybag_ver=0.1.1
_binauralanalysis_ver=20040521
pkgrel=8
pkgdesc='A binural brainwave generator'
url='http://uazu.net/sbagen'
license=('GPL')
depends=('bash' 'perl' 'lib32-gcc-libs' 'libpulse')
makedepends=('libmad' 'libvorbis' 'gcc-multilib')
arch=('x86_64')
options=('!strip')

source=(
  "$url/$pkgname-$pkgver.tgz"
  "$url/$pkgname-river-$_river_ver.tgz"
  "$url/rhybag-$_rhybag_ver.tgz"
  "$url/binaural-analysis-$_binauralanalysis_ver.tgz"
  "anarange.1"
  "downsample.1"
  "rhybag.1"
  'build-fix.patch'
)

sha512sums=(
  '35a8cdf0ca59cef01200a102c6f718b163006eec6c3450e7ee32bac0454be2db4d9a4df2f1a52d6cc2beda1d45bf9a7816a2c9dfae710eef14dbe5667cec9bf9'
  'f61c9308c671dc9cef9b9e60ba37cc5a9dc6ac45b5ab34d0818e08f6006eeba0ede4756e0c5375b11963e04f4e1e801119af8df8726c867e3be399983b12bc30'
  '19a432b3d465881a113b0aad3f774062952b3f0229ae77e668b0c43d47c94d595cae1b7178c7a30fbc7d7f05da1cc9c0255ad0de7daba8023da2fd7fc6057e2b'
  'ca60751ed67bf87aa75465fc1f70a57f3ae4e704a0ff5f745d955b65dd624394be74bc19470b8d5d25df13c70241efac355b66a49773d0584623157151e0b074'
  'a14924d7b001f2e558b97d32a844dd18b54eb7ae7a1111a25dae1b3c53129cedeb546043301ee15ac33fed03ad4dc5330e534c3ab27d3f1f6a166499319cbaa7'
  'a84e774f1a4c1f57716f3097228baebb8caf5424bd1316ce1d8f596cac44e9a16c1a56814405b48b87557108db1d4cf4fee56875b82d7390ec3c41d4e2a280a8'
  'db30da37feb3c970f1dcc5271aa9350b3694c48fdb5585db2e6f3f178f9cd26af1fd48d238786ccac19d2f65ebcccff9622b358b2a16396696e94448e66648f5'
  'f16fe080432c0ea1ba6e43a0f0fa78121706ad86fc8503509d7289f62459618abc0243e398eab157808c092a5c2e2dc8b1826fc3a22340cdb5896684ed6bacaa'
)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../build-fix.patch

  while read -r file; do
      sed -i -re 's|(river[12]\.ogg)|/usr/share/sbagen/media/\1|g' "$file"
  done < <(grep -ir "river1\.ogg" examples/ | sed 's|:.*$||')
}

build() {
  # Remove compiler flags set by makepkg.conf
  unset CFLAGS

  # Compile sbagen
  cd $pkgname-$pkgver
  rm sbagen
  cc -DOGG_DECODE -DMP3_DECODE -Wa,--noexecstack -DT_LINUX -Wall -m32 -O3 -s -lm -lpthread -Wl,-z,noexecstack sbagen.c libs/linux-libmad.a libs/linux-libvorbisidec.a -o sbagen

  # Compile rhybag
  cd ../rhybag-$_rhybag_ver
  cc -O2 -s -lm main.c -o rhybag 2>&1 1>&0 | ./strip_warnings > mk.err

  cd ../binaural-analysis
  rm anarange downsample
  ./mk
}

package() {
  ### Add /usr/bin to the package
  install -d "$pkgdir/usr/bin"

  ### Install rhybag
  install -Dm755 rhybag-$_rhybag_ver/rhybag "$pkgdir/usr/lib/sbagen/rhybag"

  ### Add rhybag script
  printf '%s\n\n%s' '#!/usr/bin/env bash' 'padsp /usr/lib/sbagen/rhybag "$@"' > "$pkgdir/usr/bin/rhybag"
  chmod 755 "$pkgdir/usr/bin/rhybag"

  ### Install river sounds
  install -Dm644 $pkgname-$_river_ver/river1.ogg "$pkgdir/usr/share/sbagen/media/river1.ogg"
  install -Dm644 $pkgname-$_river_ver/river2.ogg "$pkgdir/usr/share/sbagen/media/river2.ogg"

  ### Install Binaural analysis tools
  install -Dm755 binaural-analysis/anarange "$pkgdir/usr/bin/anarange"
  install -Dm755 binaural-analysis/downsample "$pkgdir/usr/bin/downsample"

  ### Install manpages
  install -Dm644 anarange.1 "$pkgdir/usr/share/man/man1/anarange.1"
  install -Dm644 downsample.1 "$pkgdir/usr/share/man/man1/downsample.1"
  install -Dm644 rhybag.1 "$pkgdir/usr/share/man/man1/rhybag.1"

  ### Install sbagen
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/lib/sbagen/sbagen"

  ### Add sbagen script
  printf '%s\n\n%s' '#!/usr/bin/env bash' 'padsp /usr/lib/sbagen/sbagen "$@"' > "$pkgdir/usr/bin/sbagen"
  chmod 755 "$pkgdir/usr/bin/sbagen"

  # Install supplimentary files
  find . -type f -name '[a-z]*.txt' -exec install -Dm644 '{}' "$pkgdir/usr/share/sbagen/doc/"'{}' \;
  find examples -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/sbagen/"'{}' \;
  find scripts -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/sbagen/"'{}' \;
}
