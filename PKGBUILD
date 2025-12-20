pkgname=jugglinglab-git
pkgver=1.6.7.r183.g3dac62f
pkgrel=1
pkgdesc="A program for animating juggling patterns"
arch=('any')
url="https://jugglinglab.org/"
_giturl="https://github.com/jkboyce/jugglinglab"
makedepends+=('git' 'java-environment>=17' 'java-environment<25')
depends+=('java-runtime>=11')
source+=("git+${_giturl}.git")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("jugglinglab=$pkgver")
conflicts+=("jugglinglab")

pkgver() {
  cd jugglinglab
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -eq 0 ] || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd jugglinglab
  ./gradlew shadowJar
}

package() {
  cd jugglinglab/bin
  install -Dm755 JugglingLab.jar "$pkgdir/usr/share/java/JugglingLab.jar"
  mkdir -p "$pkgdir/usr/bin"
  echo -e '#!/bin/sh
java -jar /usr/share/java/JugglingLab.jar' > "$pkgdir/usr/bin/jugglinglab"
  chmod 755 "$pkgdir/usr/bin/jugglinglab"
}
