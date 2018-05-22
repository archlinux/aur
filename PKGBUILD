# Maintainer: Benjamin den Hartog <ben@sudoforge.com>
# Contributor: Joshua Marsh <joshua@themarshians.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Richard Hoffman <coverslide@gmail.com>
# Contributor: Max <fuzymonkey@gmail.com>

pkgname=google-appengine-go
pkgver=1.9.48
pkgrel=1
pkgdesc='Google App Engine SDK for Go'
arch=('x86_64' 'i686')
depends=('python2')
url='http://code.google.com/appengine/downloads.html#Google_App_Engine_SDK_for_Go'
license=('APACHE')
options=('!strip' 'staticlibs')
makedepends=('unzip')
optdepends=('mysql-python: MySQL support for Python 2'
            'python2-imaging: Image processing capabilities for Python')
source_i686=("https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_386-$pkgver.zip")
source_x86_64=("https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-$pkgver.zip")
sha1sums_x86_64=('d8f94d4f8c03dec058b3235b3f0248b90475cdf9')
sha1sums_i686=('3b725827b577fb58ca535f328b519b32ce2af7aa')

# Get the name of the zip file
_source=$(echo source_$CARCH)
noextract=("$(basename ${!_source})")

prepare() {
  unzip -q "$noextract"
}

build() {
  cd 'go_appengine'

  # This is to avoid name conflicts in /usr/bin with other appengine packages
  for f in *.py
  do
    msg2 "Generating wrapper script for $f named `basename $f .py`-go"
    echo -e "#!/bin/sh\npython2 /opt/google-appengine-go/$f \$*" \
      > "$srcdir/`basename $f .py`-go"
    # Modifying script to use Python 2
	  sed -i '0,/on/s//on2/' $f
  done
}

package() {
  cd 'go_appengine'

  install -d "$pkgdir/opt"
  cp -R "./" "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/lib/python2.7/site-packages"

  cp -r "$pkgdir/opt/$pkgname/google" "$pkgdir/usr/lib/python2.7/site-packages/google" 
  
  install -d "$pkgdir/usr/bin"
  install -Dm755 $srcdir/*-go "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s "/opt/$pkgname/goapp" "$pkgdir/usr/bin/goapp"
}

# vim:set ts=2 sw=2 et:
