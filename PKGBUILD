# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='dualscreen-mouse-utils'
pkgver='0.5'
pkgrel='1'
pkgdesc='Utilities for use with old-school dual head setups.'
arch=('i686' 'x86_64')
url='http://de.mcbf.net/david/dualscreenmouseutils/'
license=('GPL2' 'GPL3' 'LGPL3' 'CCPL:by-nc-sa')
depends=('libx11')
optdepends=(
   'python-pyqt5: for mouse-wrapscreen-tray (system tray icon)'
   'python-psutil: for mouse-wrapscreen-tray (system tray icon)'
)
source=(
   "http://dsp.mcbf.net/releases/$pkgname-$pkgver.tar.gz"
   '01-mss-fix-args.diff'
   '02-mws-inline.diff'
   '03-mws-fix-args.diff'
   '04-mws-sleep-arg.diff'
   'mouse-wrapscreen-tray'
   'mouse-wrapscreen-tray.desktop'
   'README.icons'
   'running.svg'
   'stopped.svg'
)
md5sums=(
   'b68a43c9041cbb8dc373553ccef93070'
   'dc203cc98b15bdaf7453c21e76e87a41'
   'eb95a8830324f0d2d3249f6802b7e666'
   '0294b640ae8daf006c209fb14954c282'
   'e5ebb5eef015695ee3d533bd5de24180'
   'b2ba6403fa7dfbe2b1a7f4f945030e7d'
   '5b2ebb17e8bc7c833d0c772d2d986bc3'
   '5f1b6249af6ad454f950d27ff1dcc533'
   '4bca9dc0dcf3fdbbff094b8f83cdee08'
   'a7b6529cdbd3010c40818c204458b734'
)

prepare() {
   cd "$pkgname-$pkgver"
   for diff in ../*.diff ; do
      patch -uN -i "$diff" || return 1
   done
}

build() {
   cd "$pkgname-$pkgver"
   CPPFLAGS="$CFLAGS -O2" make
}

package() {

   install -d "$pkgdir"/usr/{bin,share/{dualscreen-mouse-utils,applications}}/

   install -m 0755 mouse-wrapscreen-tray         "$pkgdir/usr/bin/mouse-wrapscreen-tray"
   install -m 0644 mouse-wrapscreen-tray.desktop "$pkgdir/usr/share/applications/"
   install -m 0644 README.icons                  "$pkgdir/usr/share/dualscreen-mouse-utils/"
   install -m 0644 {running,stopped}.svg         "$pkgdir/usr/share/dualscreen-mouse-utils/"

   cd "$pkgname-$pkgver"

   install -m 0755 -s mouse-{switch,wrap}screen  "$pkgdir/usr/bin/"
   install -m 0755    mouse-wrapscreen.sh        "$pkgdir/usr/share/dualscreen-mouse-utils/"
   install -m 0644    README                     "$pkgdir/usr/share/dualscreen-mouse-utils/"

}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=93: