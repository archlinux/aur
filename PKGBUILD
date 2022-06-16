# Maintainer: Tristan Webb <olafthefrog@gmail.com>
# template start; name=git; version=1;
# template start; name=git-source; version=1;
pkgname=skylobby-git
pkgver=0.9.4.r0.ga13598b
pkgdesc="Spring RTS games client lobby"
pkgrel=1
arch=('any')
makedepends+=('git' 'clojure' 'java-environment=17' 'java17-openjfx')
depends+=('sh' 'java-runtime=17' 'java17-openjfx')
license=('MIT')
url="https://github.com/skynet-gh/skylobby"
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

# vim: filetype=sh
# template end;
# template start; name=git-pkgver; version=1;
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
# template start; name=git-revcount; version=1;
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# template end;
}

build() {
  cd ${_gitname:-$pkgname}
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
  export JAVA_CMD="$JAVA_HOME/bin/java"
  export PATH="$JAVA_HOME/bin:$PATH"
  clojure -M:uberjar
}

package() {
  cd ${_gitname:-$pkgname}
  install -Dm0755 dist/arch/skylobby "$pkgdir/usr/bin/skylobby"
  install -Dm0644 target/skylobby.jar "$pkgdir/usr/share/java/$_gitname/skylobby.jar"
  install -Dm0644 resources/icon256.png "$pkgdir/usr/share/pixmaps/skylobby.png"
  install -Dm0644 dist/arch/skylobby.desktop "$pkgdir/usr/share/applications/skylobby.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: filetype=sh
# template end;
# template end;
