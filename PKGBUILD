# Maintainer: wangyifan <wangyifan@acoinfo.com>
# Contributor: chengsiyuan <chengsiyuan@acoinfo.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Martí <mvdan@mvdan.cc>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Andres Perera <andres87p gmail>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Christian Himpel <chressie@gmail.com>
# Contributor: Mike Rosset <mike.rosset@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw@gmail.com>
# Contributor: John Luebs <jkluebs@gmail.com>

pkgname=go-sylixos
pkgver=1.23.2.r60492.gb9ec27f7
pkgrel=2
pkgdesc='Core compiler tools for the Go programming language'
arch=(x86_64)
url='https://github.com/go-sylixos'
license=(BSD-3-Clause)
makedepends=(git go)
provides=("${pkgname%-sylixos}")
conflicts=("${pkgname%-sylixos}")
options=(!strip staticlibs)
source=(git+${url}/${pkgname%-sylixos}.git#branch=sylixos-release-branch.go1.23)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-sylixos}"
  printf "%s.r%s.g%s" \
    "$(awk -F'go' '{if(NR==1)print $2}' VERSION)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=8 HEAD)"
}

prepare() {
  cd "${pkgname%-sylixos}"
  # this is only for local builds so there is no need to integrity check. (if needed)
  for p in ../../*.patch; do
    echo "Custom Patching with ${p}"
    patch -p1 -N -i $p || true
  done
}

build() {
  export GOARCH=amd64
  export GOAMD64=v1 # make sure we're building for the right x86-64 version
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go

  cd "${pkgname%-sylixos}/src"
  ./make.bash -v
}

check() {
  export GO_TEST_TIMEOUT_SCALE=3

  cd ${pkgname%-sylixos}/src
  ./run.bash --no-rebuild -v -v -v -k
}

package() {
  cd "${pkgname%-sylixos}"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" "$pkgdir/usr/share/doc/go" \
    "$pkgdir/usr/lib/go/pkg/linux_amd64_"{dynlink,race}

  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go"
  # We can't strip all binaries and libraries,
  # as that also strips some testdata directories and breaks the tests.
  # Just strip the packaged binaries as a compromise.
  strip $STRIP_BINARIES "$pkgdir/usr/lib/go"{/bin/*,/pkg/tool/*/*}

  cp -r doc/* "$pkgdir/usr/share/doc/go"

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap" "$pkgdir/usr/lib/go/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go/pkg/obj/go-build

  # https://github.com/golang/go/issues/57179
  install -Dm644 go.env "$pkgdir/usr/lib/go/go.env"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
