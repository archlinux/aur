# Maintainer: Michael Taboada <michael@2mb.solutions>
# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
                                                                                                                                                                
pkgname="mumbledj-git"
pkgver=3.2.2.r2.ea0e037
pkgrel=4
pkgdesc="a mumble dj that can play music from soundcloud, youtube, and mixcloud -- git version"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/lilmike/mumbledj"
license=('MIT')
depends=('aria2' 'ffmpeg' 'openal' 'opus' 'youtube-dl')
makedepends=('git' 'go')
source=("mumbledj::git+https://github.com/lilmike/mumbledj.git")
sha512sums=('SKIP')

  prepare(){
      mkdir -p gopath/src/github.com/lilmike
        ln -rTsf mumbledj gopath/src/github.com/lilmike/mumbledj
              }

pkgver() {
    cd "${srcdir}/mumbledj"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${srcdir}/gopath/src/github.com/lilmike/mumbledj"
  go install \
    -buildmode=pie \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" -v
}
                                                                                                                                                                
package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/mumbledj"
  install -p -m755 "$srcdir/gopath/bin/mumbledj" "$pkgdir/usr/bin"
  install -p -m644 "$srcdir/mumbledj/README.md" "$pkgdir/usr/share/doc/mumbledj"
  install -p -m644 "$srcdir/mumbledj/config.yaml" "$pkgdir/usr/share/doc/mumbledj/config.yaml.example"
                                                                                                                                                                
  #mkdir -p "$pkgdir/$GOPATH"
  #cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"
                                                                                                                                                                
}
                                                                                                                                                                
# vim:set ts=2 sw=2 et:
