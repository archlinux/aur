# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Timo Sarawinski <timo@it-kraut.net>

pkgname=php74-imagick
_name=imagick
pkgver=3.4.4
pkgrel=1
_commit=c5b8086b5d96c7030e6d4e6ea9a5ef49055d8273
pkgdesc="PHP 7.4 extension to create and modify images using the ImageMagick library"
arch=('x86_64')
url="https://github.com/mkoppanen/imagick"
license=('PHP')
depends=('php74' 'imagemagick' 'ttf-font')
checkdepends=('librsvg' 'ttf-dejavu')
backup=("etc/php74/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkoppanen/${_name}/archive/${_commit}.tar.gz"
        "${pkgname}-3.4.4-imagemagick_threading.patch::https://github.com/Imagick/imagick/pull/296.patch")
sha512sums=('bd62bc51de3e330f63b29fc5f259893356e0aa205f6643266432f465fcca4d893931bc5822aef04643d6d27e9be906e3602126ee3f58fbed7804de691d0cb6d2'
            'd11a08b6a6a4a5e6d9b9cf9e87a6c0bb29ba632d6318ac237fe59910d70b07ef8df5af775451c89c5a81d45e609b9aa69611ecb562bfcbda832d5f0ae1207d55')

prepare() {
  mv -v "${_name}-$_commit" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # fix imagemagick threading issues when building against php >= 7.4
  patch -Np1 -i "../${pkgname}-3.4.4-imagemagick_threading.patch"
  # setting package version: https://bugs.archlinux.org/task/64185
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" \
      -i php_imagick.h package.xml
  echo ";extension=${_name}" > "${_name}.ini"
  phpize74
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config74
  make
}

check() {
  cd "$pkgname-$pkgver"
  export NO_INTERACTION="true"
  export TEST_PHPDBG_EXECUTABLE="/usr/bin/phpdbg74"
  make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php74/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 examples/*.php \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
