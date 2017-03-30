# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='dualscreen-mouse-utils'
pkgver='0.5'
pkgrel='2'
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
sha256sums=(
   '51c94b382e3b32ea8ccbcb3f2ef8972acc68329aec3c4fcaeaf7f55fda166303'
   '3acd313147ff3a5ef029c570aff11d7f27e804917d7134cb240112981aa929a0'
   'd27feddbb7ff6ad1d4d4bd8bd1a65984d9391c3d85ed0bbab8ce245228a8cf6d'
   'caeab014dbca7d7aa1fcd977d98d552e0510615aa93e3eafe8c0dba29b747d82'
   'b26110eb377dd8ec60b164cdd65f08c7459982d448ae66a7290bfb873c2c0be8'
   '777da0954c757cf978a1a5bc0159032171d3bc186fb586f6f740dbe7c9f03baf'
   '62dd5735d1c0fabef0421232a56645e1f46abbf36e9e398964ff0ffafce04267'
   '9886a34df1babda6728699e9934444f6fb22a3a7f68fa31bcdf578cfb32c173a'
   '7c2f799a89c799b82e888b9916ca0c24b49f24644ea8cf792d4b398819b46848'
   'f343de71ebce7a842ec8ae191fc151e6c881791fe091abcbf46ef49f69819edf'
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

   install -d "$pkgdir"/usr/{bin,share/{{doc/,}dualscreen-mouse-utils,applications}}/

   local _bin="$pkgdir/usr/bin" _shr="$pkgdir/usr/share" _doc="$pkgdir/usr/share/doc"

   install -m 0755 mouse-wrapscreen-tray         "$_bin/mouse-wrapscreen-tray"
   install -m 0644 mouse-wrapscreen-tray.desktop "$_shr/applications/"
   install -m 0644 README.icons                  "$_shr/dualscreen-mouse-utils/"
   install -m 0644 {running,stopped}.svg         "$_shr/dualscreen-mouse-utils/"

   cd "$pkgname-$pkgver"

   install -m 0755 -s mouse-{switch,wrap}screen  "$_bin/"
   install -m 0755    mouse-wrapscreen.sh        "$_shr/dualscreen-mouse-utils/"
   install -m 0644    README                     "$_doc/dualscreen-mouse-utils/"

}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87: