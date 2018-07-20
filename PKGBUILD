# Maintainer: Guillaume Raffin <theelectronwill@gmail.com>
pkgname=bloop
pkgver=1.0.0
pkgrel=1
pkgdesc="Scala build server and command-line tool for faster developer workflows"
arch=(any)
url="https://scalacenter.github.io/bloop/"
license=('Apache')
depends=('scala' 'python')

_bloop_ver="1.0.0"
_coursier_ver="1.1.0-M3"
_nailgun_commit="0c8b937b"

source=("$pkgname-coursier::https://github.com/alexarchambault/coursier/raw/v$_coursier_ver/coursier"
        "$pkgname-nailgun::https://raw.githubusercontent.com/scalacenter/nailgun/$_nailgun_commit/pynailgun/ng.py"
        "$pkgname-zsh::https://raw.githubusercontent.com/scalacenter/bloop/v$_bloop_ver/etc/zsh/_bloop"
        "$pkgname-bash::https://raw.githubusercontent.com/scalacenter/bloop/v$_bloop_ver/etc/bash/bloop"
        "https://raw.githubusercontent.com/scalacenter/bloop/v$_bloop_ver/etc/systemd/bloop.service"
        "https://raw.githubusercontent.com/scalacenter/bloop/v$_bloop_ver/etc/xdg/bloop.desktop"
        "https://raw.githubusercontent.com/scalacenter/bloop/v$_bloop_ver/etc/xdg/bloop.png")

md5sums=('8028c8a28e2aae9e43d22dcfd9d186c9'
         'b4052f86e77f27e6bc073b80ab8d3fe5'
         'f882aec92adcb905881f2c472c95f7e9'
         'b35d784c7c37dba285ac7162db8a7119'
         '272426035e8579c9d45feb13c7e6c86b'
         '63f8a33f8493642037b0c6d0f851bbf8'
         '763e573c631a10759974e7ac8c6c443f')

prepare() {
  cd $srcdir
  sed -i "s|__BLOOP_INSTALLATION_TARGET__|/usr/share/$pkgname|g" bloop.service
  sed -i "s|__BLOOP_INSTALLATION_TARGET__|/usr/share/$pkgname|g" bloop.desktop
  
  # Coursier bootstrap
  artifact="ch.epfl.scala:bloop-frontend_2.12:$_bloop_ver"
  scalameta="bintray:scalameta/maven"
  scalacenter="bintray:scalacenter/releases"
  sonatype="https://oss.sonatype.org/content/repositories/staging"
  jar=$pkgname-coursier
  dest=$pkgname-server
  main="bloop.Server"
  java -jar $jar bootstrap $artifact -r $scalameta -r $scalacenter -r $sonatype -o $dest -f --standalone --main $main
}
package() {
  instdir=$pkgdir/usr/share/$pkgname
  
  # Bloop client and server
  install -Dm755 $srcdir/$pkgname-coursier $instdir/blp-coursier
  install -D $srcdir/$pkgname-server $instdir/blp-server
  install -Dm755 $srcdir/$pkgname-nailgun $instdir/bloop
  mkdir $pkgdir/usr/bin
  ln -s /usr/share/$pkgname/blp-coursier $pkgdir/usr/bin/blp-coursier
  ln -s /usr/share/$pkgname/blp-server $pkgdir/usr/bin/blp-server
  ln -s /usr/share/$pkgname/bloop $pkgdir/usr/bin/bloop
  
  # Zsh and Bash support
  install -Dm755 $srcdir/$pkgname-zsh $instdir/zsh/_bloop
  install -Dm755 $srcdir/$pkgname-bash $instdir/bash/bloop
  
  # Desktop file
  install -Dm644 $srcdir/bloop.desktop $instdir/xdg/bloop.desktop
  install -Dm644 $srcdir/bloop.png $instdir/xdg/bloop.png
  mkdir $pkgdir/usr/share/applications
  ln -s /usr/share/$pkgname/xdg/bloop.desktop $pkgdir/usr/share/applications/bloop.desktop
  
  # Systemd service
  install -Dm644 $srcdir/bloop.service $pkgdir/usr/lib/systemd/user/bloop.service
}
