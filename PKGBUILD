# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Marcelo Cavalcante / Kalib <kalib@archlinux-br.org>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=planeshift-legacy
pkgver=0.6.3
pkgrel=2
pkgdesc='the legacy version of Planeshift, an Open source and cross-platform 3D Fantasy MMORPG'
url='http://www.planeshift.it/'
arch=('x86_64' 'i686')
license=('GPL' 'custom:PlaneShift Content License')
depends=('libgl' 'libsm' 'libxmu' 'libxpm' 'openal')
makedepends=('gendesk' 'aria2')
conflicts=('planeshift-unreal')
replaces=('planeshift')
options=('emptydirs')
install="$pkgname.install"
source=('planeshift_x86_64.meta4'
        'planeshift_i686.meta4'
        'license.txt'
        'scriptfix.patch')
sha256sums=('c7991a27249c0dafbf53522bff78d4053b6398dbd1164a460147608bc48022b2'
            '5b3f34eb5abbe062f53e6a00c838a1657d391f75be4ba0efceeb17e4990e8272'
            '51ba4271c77c00efe087f2f456ae777853f85b97767cf085d2fb8f9b82c082fc'
            '0ba1b58e5012cd3941cea3a3eeaa6cce2ede0d6e1802156479eee44386b45c51')
prepare() {
  # Generate the .desktop file for the PlaneShift client
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'PlaneShift' --genericname 'MMORPG'

  # Generate the .desktop file for the PlaneShift setup application
  gendesk -f -n --pkgname 'pslaunch' -pkgdesc 'Configure PlaneShift' \
    --name 'PlaneShift Launcher' --exec 'pslaunch' \
    --categories='Application;Game'

# Download the binary (and warn about diskspace, since this seems to be a common problem)
  msg2 "Downloading PlaneShift $pkgver (may seed for up to a minute)..."
  msg2 "Be patient and don't panic!"
  aria2c -M planeshift_$CARCH.meta4 -V -c --allow-overwrite=true \
    --seed-ratio=5.0 --seed-time=1 --no-conf=true
  if [ `find . -maxdepth 1 -name "PlaneShift-*.run" | wc -l` == 0 ]; then
    msg2 'Download failed!'
    echo
    echo 'Make sure you have enough disk space in'
    echo "$srcdir"
    echo
    echo 'You need at least 800-900 MB free for the download,'
    echo 'and quite a bit more for extracting the file.'
    echo
    echo "Here's the currently available disk space:"
    echo
    df -h "$srcdir"
    echo
    return 1
  fi
}

package() {
  msg2 'Extracting...'
  chmod +x PlaneShift-*$pkgver*.run
  ./PlaneShift-*$pkgver*.run \
    --mode unattended \
    --syswide yes \
    --prefix "$pkgdir/opt"

  msg2 'Setting permissions...'
  find "$pkgdir/opt/PlaneShift" -type f -exec chmod 660 {} +
  find "$pkgdir/opt/PlaneShift" -type d -exec chmod 770 {} +
  cd "$pkgdir/opt/PlaneShift"
  chmod 770 psclient.bin pslaunch.bin psclient pslaunch

  msg2 'Packaging scripts...'
  install -Dm755 psclient "$pkgdir/usr/bin/$pkgname"
  install -Dm755 pslaunch "$pkgdir/usr/bin/pslaunch"

  msg2 'Cleaning up...'
  rm -f uninstall unscript.sh planeshift

  msg2 'Patching...'
  cd "$pkgdir/usr/bin/"
  patch -Np0 < "$srcdir/scriptfix.patch"

  msg2 'Packaging shortcuts...'
  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir"/*.desktop "$pkgdir/usr/share/applications/"
  install -Dm644 "$pkgdir/opt/PlaneShift/support/icons/crystal.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgdir/opt/PlaneShift/support/icons/psicon.png" \
    "$pkgdir/usr/share/pixmaps/pslaunch.png"

  msg2 'Packaging license...'
  install -Dm644 "$srcdir/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
