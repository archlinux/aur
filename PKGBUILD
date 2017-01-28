# $Id: PKGBUILD 195553 2016-11-14 01:48:18Z anthraxx $
# Maintainer: PhotonX <photon89 [at] gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Athurg <athurg@gooth.cn>
# Contributor: TDY <tdy@gmx.com>

pkgname=shutter
pkgver=0.93.1
pkgrel=5
pkgdesc="a featureful screenshot tool (formerly gscrot)"
arch=('any')
url="http://shutter-project.org/"
license=('GPL3')
depends=(xdg-utils imagemagick procps librsvg gtk2-perl desktop-file-utils
         perl-{gnome2-wnck,gtk2-{imageview,unique},x11-protocol}
         perl-{proc-{simple,processtable},net-dbus}
         perl-{sort-naturally,json,json-xs,xml-simple,www-mechanize,locale-gettext}
         perl-{file-{which,basedir,copy-recursive},path-class,xml-simple})
optdepends=('gnome-web-photo: web screenshot support'
		'perl-image-exiftool: read and write EXIF data'
		'nautilus-sendto: integration in Nautilus'
		'perl-goo-canvas: editing screenshots'
		'perl-gtk2-appindicator: AppIndicators support'
		'perl-net-dropbox-api: Dropbox upload support'
		'perl-path-class: Dropbox upload support'
		'perl-lwp-protocol-https: Dropbox upload support'
		'bc: 3D Rotate and 3D Reflection plugins support')
source=("http://shutter-project.org/wp-content/uploads/releases/tars/$pkgname-$pkgver.tar.gz"
        CVE-2015-0854.patch
        fix-dropbox.patch
        fix-unicode.patch
	  fix-second-instance-crash.patch
	  fix-imgur.patch)
sha512sums=('50a635fdf73454b15351a7e2c4507bf0f9fd816273affbed412f42b1032087304ecf1fb4a4b655bc056820f267b98214ff5104f4fcd9e843f78e70ac4a7a4a04'
            '4307cdfe9409e3ff66c74730caa99932e1b8a2698012e948b974157219f4fc572117dd1968b29f6ea08736c0fa44a62cdb11855456cff8c280f4cd60edbc1ed6'
            '88fe92c33ba2e580328589d0f1f5639aa40580f96fbc92d05903167f87053d02f472d6afcc839ca18029df6fac065c108c440da551d86494c70b1219b0b032dc'
            '52ac381b5b1bd1ac5ba40cb3f6f425fbfcb5f491855af8c19494b64ba5311e6fdc3579e334a38167e1391cd57aae8d4312e389529d594aade53c6f8a49bc66c8'
		'cb6fee947f62d0fdf1f4810136782df8097e764760d6e66fc80945c88af137e4524ab8ec1abd44f9439c1b6c408fe1de779a1c0ff930be0521bedc117c39d4ac'
		'7c7ff590237bb2bd5b54aeec7ad013542d6f64624fa16c0f129875cca908f6d8666328edd2ebf1fa80bdedc683785ba75516d8fdee9ca25b48aca117fb89baf6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix tray icon under many icon themes, from Gentoo
  sed -e "/\$tray->set_from_icon_name/s:set_from_icon_name:set_from_file:" \
      -e "s:shutter-panel:/usr/share/icons/hicolor/scalable/apps/&.svg:" \
      -i bin/shutter
  patch -p0 < "${srcdir}/CVE-2015-0854.patch"
  patch -p0 < "${srcdir}/fix-dropbox.patch"
  patch -p0 < "${srcdir}/fix-unicode.patch"
  patch -p0 < "${srcdir}/fix-second-instance-crash.patch"
  patch -p0 < "${srcdir}/fix-imgur.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  cp -a share "$pkgdir/usr/"
}

