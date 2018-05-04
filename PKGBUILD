# Maintainer: Ramon Binz <binzram@gmail.com>

pkgname=aareguru-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A cli application for aare.guru"
arch=("x86_64" "i686")
url="https://github.com/binzram/arch_aur_aaregurucli"
license=("AGPLv3")
provides=("aareguru")
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://api.github.com/repos/gexclaude/aaregurucli/tarball/master")
md5sums=("SKIP")
_golibs=(
  "github.com/gosuri/uiprogress"
  "github.com/logrusorgru/aurora"
  "gopkg.in/alecthomas/kingpin.v2"
)


build() {
  _untardir=$(ls -d */)
  cd "$_untardir"

  for i in ${_golibs[@]}; do
    go get $i
  done

  go build
}

check() {
  for i in ${_golibs[@]}; do
      # Ignore failing test of kingpin V2
      if [ "$i" != "gopkg.in/alecthomas/kingpin.v2" ]; then
          go test $i
      fi
  done
}

package() {
  _untardir=$(ls -d */)
  cd "$_untardir"

  _buildFilename=${_untardir::-1}

  install -Dm755 "$_buildFilename" "$pkgdir/usr/bin/aareguru"
}
