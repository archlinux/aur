# Maintainer: willemw <willemw12@gmail.com>

pkgname=xmltv-druid
pkgver=0.4.0
pkgrel=1
pkgdesc="XMLTV configurator (for gShowTV)"
arch=('i686' 'x86_64')
url="http://gshowtv.sourceforge.net/xmltv-druid.html"
license=('GPL')
makedepends=('gnome-doc-utils')
# 'gtk2-perl' depends on 'libgnome'
depends=('glade-perl' 'gnome-perl' 'gnome-terminal' 'gtk2-perl' 'xmltv')
source=(http://downloads.sourceforge.net/project/gshowtv/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('625391aa24138a395b64273020bc1396')

prepare() {
  cd $pkgname-$pkgver

  # Fix: Add '=back' before '=head1 AUTHOR'
  sed -i 's|\(^=head1 AUTHOR\)|=back\n\n\1|' xmltv-druid

  # Fix: Add program search paths
  #next unless (-x "/usr/bin/$g" || -x "/usr/local/bin/$g");
  #-->
  #next unless (-x "/usr/bin/$g" || -x "/usr/local/bin/$g" || "/usr/bin/vendor_perl/$g"  || -x $ENV{"HOME"} . "/bin/$g");
  sed -i 's|\(next unless (-x "/usr/bin/$g" \|\| -x "/usr/local/bin/$g"\)|\1 \|\| "/usr/bin/vendor_perl/$g"  \|\| -x $ENV{"HOME"} . "/bin/$g"|' xmltv-druid

  # Fix: Add program search paths
  #foreach my $gi (sort </usr/bin/tv_grab_* /usr/local/bin/tv_grab_*>) {
  #-->
  #foreach my $gi (sort </usr/bin/tv_grab_* /usr/local/bin/tv_grab_* /usr/bin/vendor_perl/tv_grab_* $ENV{"HOME"}/bin/tv_grab_*>) {
  sed -i 's|\(foreach my $gi (sort </usr/bin/tv_grab_\* /usr/local/bin/tv_grab_\*\)|\1 /usr/bin/vendor_perl/tv_grab_\* $ENV{"HOME"}/bin/tv_grab_\*|' xmltv-druid

  # Fix: 
  #system("gnome-terminal --hide-menubar -title='TV Grabber configuration' -e \"$grabber --configure\"");
  #-->
  #system("gnome-terminal --hide-menubar --title='TV Grabber configuration' -e \"$grabber --configure\"");
  sed -i 's|\(gnome-terminal.* \)-title|\1--title|' xmltv-druid
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir/usr/" 
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
}

