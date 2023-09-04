# Maintainer: xsmile <>

pkgname=sedutil-ladar
_pkgname=sedutil
pkgver=1.16.0
pkgrel=5
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
        gcc-13.patch
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
            '5a576f2401258fcac3de90dd3a4b3496d0867e1513bc2cbde4263d8a636f6f6c'
            '21350ae1ce66ec44d10931471d6fac7780530742120a8836c6c2826753e4f8b1'
            'd0ba87d38805e3d7c69feaac96a50c1c08d371dc059447569bc0d1fb351cf638'
            '2a8e44163be138a4f6404239dbbd857947af7be1113f30f41ecf7186daf7c6b6'
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
  patch -Np1 -i "$srcdir"/show_asterisk.patch
  # fix compilation with GCC 13
  patch -Np1 -i "$srcdir"/gcc-13.patch
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
