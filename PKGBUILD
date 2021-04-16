# Maintainer: Tristan Webb <olafthefrog@gmail.com>
# template start; name=git; version=1;
# template start; name=git-source; version=1;
pkgname=skylobby-git
pkgver=0.3.2.r0.g8a42ba6
pkgdesc="A Spring RTS lobby and replay viewer written in Clojure"
pkgrel=1
arch=('any')
makedepends+=('git' 'clojure')
depends+=('java-runtime>=14')
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
  clojure -M:uberjar
  cat <<-'EOF' > ./dist/skylobby
	#!/bin/sh
	exec /usr/bin/java -Dglass.gtk.uiScale=1.1 -jar '/usr/share/java/skylobby/skylobby.jar' "$@"
	EOF
  chmod a+x dist/skylobby 
}

package() {
  cd ${_gitname:-$pkgname}
  install -Dm0755 dist/skylobby "$pkgdir/usr/bin/skylobby"
  install -Dm0644 dist/skylobby.jar "$pkgdir/usr/share/java/$_gitname/skylobby.jar"
  install -Dm0644 resources/icon256.png "$pkgdir/usr/share/pixmaps/skylobby.png"
  install -Dm0644 resources/skylobby.desktop "$pkgdir/usr/share/applications/skylobby.desktop"
}
# vim: filetype=sh
# template end;
# template end;
