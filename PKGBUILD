# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: kuno <neokuno AT gmail DOT com>
# Contributor: uncoDMX <uncoDMX AT yahoo DOT com>
# Contributor: zw0rk <ostronom AT gmail DOT com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=clojurescript-git
_realname=${pkgname/%-git/}
pkgver=1.11.121.r7.g0c5ecd7b
pkgrel=1
pkgdesc="Clojure to JS compiler, git version"
arch=('any')
url="https://github.com/clojure/clojurescript"
license=('EPL')
depends=('bash' 'java-runtime')
makedepends=('git' 'unzip' 'curl')
provides=('clojurescript')
conflicts=('clojurescript')
install=$pkgname.install
source=(
  "git+https://github.com/clojure/clojurescript.git"  
  'clojurescript.sh')
md5sums=('SKIP'
         '2265f31dcd3e5dad7ddd59a28b998bfb')

pkgver() {
  cd $_realname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'| cut -c2-
}

build() {
  cd $_realname
  ./script/bootstrap
}

package() {
  mkdir -p "$pkgdir"/etc/profile.d
  mkdir -p "$pkgdir"/usr/share/licenses/$_realname
  mkdir -p "$pkgdir"/opt/$_realname/{bin,lib,script}
  mkdir -p "$pkgdir"/usr/bin
  
  cp -r "$srcdir"/$_realname/{src,script} "$pkgdir"/opt/$_realname/
  # Insta1l libraries
  install -Dm644 "$srcdir"/$_realname/lib/* "$pkgdir"/opt/$_realname/lib/
  # Install executables
  install -Dm755 "$srcdir"/$_realname/bin/* "$pkgdir"/opt/$_realname/bin/
  # Install others
  install -Dm644 $_realname.sh "$pkgdir"/etc/profile.d
  install -Dm644 "$srcdir"/$_realname/epl-v10.html "$pkgdir"/usr/share/licenses/$_realname/

  # Synbolic link to cljsc launch script
  ln -s /opt/clojurescript/bin/cljsc "${pkgdir}"/usr/bin/cljsc
}
