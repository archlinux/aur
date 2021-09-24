# Maintainer: xsmile <>

pkgname=sedutil-ladar
_pkgname=sedutil
pkgver=1.16.0
pkgrel=4
pkgdesc="TCG OPAL 2.00 SED Management Program. ladar's fork, SHA512 variant"
arch=(x86_64)
url=https://github.com/ladar/sedutil
license=(GPL3)
optdepends=('gptfdisk: for creating the pre-boot authentication and rescue images'
            'syslinux: for creating the pre-boot authentication and rescue images')
provides=(sedutil)
conflicts=(sedutil)
backup=(etc/sedutil/sedutil-sleep.conf)
install=sedutil.install
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-SHA512.tar.gz"
        show_asterisk.patch
        sedutil-mkimg.sh
        mkinitcpio-pba.conf
        mkinitcpio-rescue.conf
        sedutil-pba.hook
        sedutil-pba.install
        sedutil-rescue.hook
        sedutil-rescue.install
        syslinux-pba.cfg
        syslinux-rescue.cfg
        sedutil-sleep.conf
        sedutil-sleep.service)
sha256sums=('e31fdfdc9d57f8bc63652bca5abe0468be145b6f5d5a215ce34b666cf9893f84'
            'c192b82c7ce0080e920e805a05b49b0cca4692467b9d716e6c5fcbf8f2a9463c'
            '71335d5f2b9b5b51aa15b0dc90bf421509ee78ac6618418a19f85929716ed343'
            'fa4729c0922f07f6349567bfb11e62f4c25f117da191a4d8caa684dcd1bde502'
            '74bf3b603cd62a571626a6238c48354c9d0448d05039fb02e412cce7829dbf30'
            'd9a7b66d8365e7f4eb0233b30c0ab70b5e978f6554960bf12994a1f0910c1447'
            'c4ac3b9e9572138e3599b953418a246da0f41ec28dc2edd67867abbb011a47ac'
            'eb734a57b48964be9a703250215532c25b33d38510766ef571a1999100095bfc'
            '70edb21d16848027c44c6e80d627f5ef86d40f99c74d0ec7f9e56caa7bebae1e'
            'e2ff1c580f75554b21d8fcfdc5feb4dec4f146b5d0b111143ada4686acaad206'
            '620f28dfb8b226b5bd6361f9aa388a24b498485d37bfa079471ad6e49a14fcdf'
            '377d2ebad2fc21e15980c1efbd06b39fa506d6d33df87df3602bc25b42be1a4e'
            'f3a24271ba964de1db2927f07a9ea2765515d871c481c87cf3dccd5dd5949326')

prepare() {
  cd $_pkgname-$pkgver
  # disable visual feedback
  patch -p1 -i "$srcdir"/show_asterisk.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make
}

package() {
  pushd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  popd

  # pre-boot authentication and rescue image creation
  install -Dm644 sedutil-pba.hook          "$pkgdir"/usr/lib/initcpio/hooks/sedutil-pba
  install -Dm644 sedutil-rescue.hook       "$pkgdir"/usr/lib/initcpio/hooks/sedutil-rescue
  install -Dm644 sedutil-pba.install       "$pkgdir"/usr/lib/initcpio/install/sedutil-pba
  install -Dm644 sedutil-rescue.install    "$pkgdir"/usr/lib/initcpio/install/sedutil-rescue
  install -Dm644 mkinitcpio-pba.conf    -t "$pkgdir"/usr/share/sedutil/
  install -Dm644 mkinitcpio-rescue.conf -t "$pkgdir"/usr/share/sedutil/
  install -Dm644 syslinux-pba.cfg       -t "$pkgdir"/usr/share/sedutil/
  install -Dm644 syslinux-rescue.cfg    -t "$pkgdir"/usr/share/sedutil/
  install -D sedutil-mkimg.sh              "$pkgdir"/usr/bin/sedutil-mkimg

  # sleep support via systemd
  install -Dm644 "$srcdir"/sedutil-sleep.service -t "$pkgdir"/usr/lib/systemd/system
  install -Dm600 "$srcdir"/sedutil-sleep.conf    -t "$pkgdir"/etc/sedutil
}
