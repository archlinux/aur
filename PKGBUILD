pkgname=terminus-cyrillic
_pkgname=terminus-font
_base=4.49
pkgver=${_base}.1
pkgrel=1
pkgdesc='Terminus monospace bitmap font (for X11 and console) with patches dv1 and ij1 applied'
arch=('any')
url='http://sourceforge.net/projects/terminus-font/'
license=('GPL2' 'custom:OFL')
makedepends=('xorg-bdftopcf' 'python' 'xorg-mkfontscale')
provides=('terminus-font')
conflicts=('terminus-font')
install='terminus-cyrillic.install'
source=("http://downloads.sourceforge.net/project/$_pkgname/$_pkgname-${_base}/$_pkgname-$pkgver.tar.gz"
"fix-75-yes-terminus.patch"
)

prepare() {
  cd "terminus-font-$pkgver"
  patch -p1 <"$srcdir"/fix-75-yes-terminus.patch
}

build() {
  cd "$_pkgname-$pkgver"

  # Uncomment patches you need:
  #
  # ao2 - round ('o'-like) cyrillic 'a'
  # dv1 - printing cyrillic 'de' and 've' (default is handwritten)
  # ge2 - handwritten cyrillic 'ge' (default is printing)
  # gq2 - grave accent and apostrophe as opening and closing single quotes
  # hi2 - higher upper case letters, digits etc.
  # ij1 - printing cyrillic 'i' and 'short i' (default is handwritten)
  # ka2 - high cyrillic 'ka' (looks as latin 'k')
  # ll2 - more distinctive latin 'l'
  # td1 - centered ascii tidle
  
  # patch -i alt/ao2.diff
  patch -i alt/dv1.diff
  # patch -i alt/ge2.diff
  # patch -i alt/gq2.diff
  # patch -i alt/hi2.diff
  # patch -i alt/hi2-dv1.diff
  # patch -i alt/hi2-ka2.diff
  patch -i alt/ij1.diff
  # patch -i alt/ka2.diff
  # patch -i alt/ll2.diff
  # patch -i alt/td1.diff

  ./configure --prefix=/usr --x11dir=/usr/share/fonts/misc \
    --psfdir=/usr/share/kbd/consolefonts
  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$_pkgname-$pkgver/75-yes-terminus.conf" \
    "$pkgdir/etc/fonts/conf.avail/75-yes-terminus.conf"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/OFL.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/etc/fonts/conf.d"

  cd "$pkgdir/etc/fonts/conf.d"
  ln -s ../conf.avail/75-yes-terminus.conf .
}

sha256sums=('34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af'
            'ddd86485cf6d54e020e36f1c38c56e8b21b57c23a5d76250e15c1d16fed9caa5')

sha256sums=('d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79'
            'ddd86485cf6d54e020e36f1c38c56e8b21b57c23a5d76250e15c1d16fed9caa5')
