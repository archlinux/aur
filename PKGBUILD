# $Id: PKGBUILD 195553 2016-11-14 01:48:18Z anthraxx $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Athurg <athurg@gooth.cn>
# Contributor: TDY <tdy@gmx.com>

pkgname=shutter
pkgver=0.93.1
pkgrel=3
pkgdesc="a featureful screenshot tool (formerly gscrot)"
arch=('any')
url="http://shutter-project.org/"
license=('GPL3')
depends=(xdg-utils imagemagick bc procps librsvg gnome-perl desktop-file-utils
         perl-{gnome2-wnck,gtk2-{imageview,unique},x11-protocol,image-exiftool}
         perl-{proc-{simple,processtable},net-{dbus,dropbox-api},goo-canvas}
         perl-{sort-naturally,json,json-xs,xml-simple,www-mechanize,locale-gettext}
         perl-{file-{which,basedir,copy-recursive},path-class,xml-simple})
optdepends=('nautilus-sendto: "Send To" functionality in right-click and main menu'
            'gnome-web-photo: Support for capturing websites')
           #'perl-gtk2-appindicator: AppIndicator support')
source=("http://shutter-project.org/wp-content/uploads/releases/tars/$pkgname-$pkgver.tar.gz"
        CVE-2015-0854.patch
        fix-dropbox.patch
        fix-unicode.patch)
sha512sums=('50a635fdf73454b15351a7e2c4507bf0f9fd816273affbed412f42b1032087304ecf1fb4a4b655bc056820f267b98214ff5104f4fcd9e843f78e70ac4a7a4a04'
            '4307cdfe9409e3ff66c74730caa99932e1b8a2698012e948b974157219f4fc572117dd1968b29f6ea08736c0fa44a62cdb11855456cff8c280f4cd60edbc1ed6'
            '88fe92c33ba2e580328589d0f1f5639aa40580f96fbc92d05903167f87053d02f472d6afcc839ca18029df6fac065c108c440da551d86494c70b1219b0b032dc'
            '52ac381b5b1bd1ac5ba40cb3f6f425fbfcb5f491855af8c19494b64ba5311e6fdc3579e334a38167e1391cd57aae8d4312e389529d594aade53c6f8a49bc66c8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix tray icon under many icon themes, from Gentoo
  sed -e "/\$tray->set_from_icon_name/s:set_from_icon_name:set_from_file:" \
      -e "s:shutter-panel:/usr/share/icons/hicolor/scalable/apps/&.svg:" \
      -i bin/shutter
  patch -p0 < "${srcdir}/CVE-2015-0854.patch"
  patch -p0 < "${srcdir}/fix-dropbox.patch"
  patch -p0 < "${srcdir}/fix-unicode.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  cp -a share "$pkgdir/usr/"
}

