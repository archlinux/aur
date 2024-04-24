# Maintainer: Furai <lucasgrzegroczyk+archlinux at gmail dot com>

pkgname=valkey
pkgver=7.2.5
pkgrel=1
pkgdesc='A new project to resume development on the formerly open-source Redis project'
arch=('x86_64')
url='https://valkey.io/'
license=('BSD-3-Clause')
depends=('jemalloc' 'systemd-libs')
makedepends=('systemd' 'openssl')
backup=('etc/valkey/valkey.conf'
  'etc/valkey/sentinel.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}-io/${pkgname}/archive/${pkgver}.tar.gz"
  valkey.service
  valkey-sentinel.service
  valkey.sysusers
  valkey.tmpfiles
  valkey.dir-jemalloc.patch
  valkey.symlinks.patch)
b2sums=('ae0c66411ed438d458d86eeb9124ef6f3288b2c1acc9a1b420c15212c5476b3ab2ce9a7212c33b258de673fdac636fb7696202b12e41f6184e92ca07dc338e1e'
  'd04ddea27e56af9ef6b42a0adf9772079f754632b5bf5f150826f488272d3870c3cd877953f36503c511411025daf78f630a49986a9d5ed8288d868673bff72b'
  '98655ce2bb511fcda5aa656d7393bc44c3647a03b1bcc7d86fd18525212eee2cc8766c9aeb2f91dd2c665ae48b091ed6f7144d6481455cb115d64ca67b01adf6'
  '3080be28343535008db179fb6b1c11f508e2f6cfa39d83f21388f19deb01503a76d2e1ac9b1057110fa331ec9bb6f863b1c0897782bf304e792f9808d361ceb0'
  '6222a87edab159f85e96fa7e4db13dc5144eb9e523dd65324f7bd579bf5c331a71cf8148ab2e23a9fcd5879bedc72121585e0df45aa1d77979d444975694ae76'
  '24db5f9fd3e23d88684601b1abd68ba1a72711ef8a4d87c2cfc4153a6fd9788f1acfc8d895fb324f6c78ba9e1c89a8db50715e87f99c4ae5b073c337aa0773ee'
  '62ad9b719f665e8a81a1b4a3d862cf0666be0574392ee288ca1d71a15b4b49c6008fe3445d81370fdfce3c759c1f6a436f09acda3c6278d6ce03dd051629ba4a')

prepare() {
  cd $pkgname-$pkgver || exit 1
  patch -Np1 <../valkey.dir-jemalloc.patch
  # Since USE_REDIS_SYMLINKS=no doesn't work we need to patch the Makefile
  patch -Np1 <../valkey.symlinks.patch
}

build() {
  make BUILD_TLS=yes \
    USE_SYSTEMD=yes \
    -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/valkey/LICENSE
  install -Dm644 -t "$pkgdir"/etc/valkey valkey.conf sentinel.conf
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ../valkey.service ../valkey-sentinel.service
  install -Dm644 "$srcdir"/valkey.sysusers "$pkgdir"/usr/lib/sysusers.d/valkey.conf
  install -Dm644 "$srcdir"/valkey.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/valkey.conf
}
