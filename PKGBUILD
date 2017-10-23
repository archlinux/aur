# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=zephir
pkgver=0.10.4
pkgrel=1
pkgdesc="Zephir is a compiled high level language aimed to the creation of C-extensions for PHP http://zephir-lang.com/"
url="https://github.com/phalcon/zephir"
arch=('x86_64' 'i686')
license=('MIT')
depends=('re2c' 'json-c' 'php-zephir-parser')
makedepends=('php' 'gcc' 'pcre')
backup=('etc/php/conf.d/zephir.ini')

if [[ $CARCH = "i686" ]]; then
  makedepends+=('lib32-pcre');
fi

source=(
	"https://github.com/phalcon/zephir/archive/$pkgver.tar.gz"
)

sha256sums=('32edf290659a228e1953ccdc3443dcbbe77678f7476c8b45b95a64e1f7d26182')

package() {
  ZEPHIRDIR=/opt/$pkgname
  cd "$srcdir/zephir-$pkgver"
  sed "s#%ZEPHIRDIR%#$ZEPHIRDIR#g" bin/zephir > bin/zephir-cmd

  #init
  install -d $pkgdir/{$ZEPHIRDIR,usr/bin}

  install -Dm777 bin/zephir-cmd "$pkgdir"/opt/zephir/bin/zephir
  install -Dm777 compiler.php "$pkgdir"/opt/zephir/compiler.php
  install -Dm777 bootstrap.php "$pkgdir"/opt/zephir/bootstrap.php
  cp -a kernels "$pkgdir"/opt/zephir/kernels
  cp -a Library "$pkgdir"/opt/zephir/Library
  cp -a prototypes "$pkgdir"/opt/zephir/prototypes
  cp -a runtime "$pkgdir"/opt/zephir/runtime
  cp -a templates "$pkgdir"/opt/zephir/templates

  ln -s /opt/zephir/bin/zephir $pkgdir/usr/bin/zephir

  echo open_basedir=$(php -r "echo ini_get('open_basedir');"):/opt/zephir > zephir.ini
  install -Dm644 zephir.ini "$pkgdir"/etc/php/conf.d/zephir.ini

  if [ -d "/usr/share/bash-completion/completions" ]; then
      install -Dm644 bin/bash_completion "$pkgdir"/usr/share/bash-completion/completions/zephir
  fi

  msg2 "Please add '/opt/zephir' into 'open_basedir' in 'php.ini'"
}
