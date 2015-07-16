# Maintainer: James An <james@jamesan.ca>
# Contributor: tjbp
# Contributor: jalaziz <me jalaziz net>
# Contributor: dryes <joswiseman gmail com>
# Contributor: Corrado Primier <ilbardo gmail com>
# Contributor: Other contributors existed but lost information
# Contributor: dpevp <daniel.plaza.espi gmail com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan tecob com>

_pkgname=pommed
pkgname="$_pkgname-jalaziz"
pkgver=1.40.r7.g243f0f2
pkgrel=1
pkgdesc='Hotkey handler for Apple laptops for LCD/keyboard backlight, sound volume, and disc ejection, with systemd and 2012 model support.'
url="http://$_pkgname.alioth.debian.org"
arch=('i686' 'x86_64')
license=('GPL2')
install="$_pkgname.install"
depends=('alsa-lib' 'audiofile' 'confuse' 'dbus-core' 'pciutils')
optdepends=('eject: to handle ejecting media from optical disc drive')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
makedepends=('git')
source=(
  "$_pkgname"::"git+https://github.com/jamesan/$_pkgname.git"
  "$_pkgname.service"
)
md5sums=('SKIP'
         '2f4742c76b489ddad3897c0199256933')

build() {
  cd "$_pkgname"
  make "$_pkgname"
  gzip --force --best "$_pkgname.1"
}

package() {
  cd "$_pkgname"

  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.conf.mactel" "$pkgdir/etc/$_pkgname.conf"
  install -Dm644 "dbus-policy.conf" "$pkgdir/etc/dbus-1/system.d/$_pkgname.conf"

  # Documentation
  install -Dm644 "$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  for file in AUTHORS ChangeLog README TODO; do
    install -Dm644 $file "$pkgdir/usr/share/doc/$_pkgname/$file"
  done

  # Sounds
  install -Dm644 "$_pkgname/data/goutte.wav" "$pkgdir/usr/share/$_pkgname/goutte.wav"
  install -Dm644 "$_pkgname/data/click.wav" "$pkgdir/usr/share/$_pkgname/click.wav"

  # Systemd
  install -Dm644 "../$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
