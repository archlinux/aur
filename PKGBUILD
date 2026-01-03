# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='oddmu'
pkgname="$_pkgname-git"
pkgver=1.19.r14.gecfee31
pkgrel=1
pkgdesc='Oddμ helps you run a minimal wiki, blog, digital garden, memex or Zettelkasten (development version)'
arch=('aarch64' 'x86_64')
url='https://alexschroeder.ch/view/oddmu/index'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
source=('git+https://src.alexschroeder.ch/oddmu.git')
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  git clean -dfx
  mkdir -p build
  go mod tidy
}

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  case "Z$CARCH" in
    'Zaarch64' | 'Zx86_64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  _opts=(
    '-buildmode=pie'
    '-ldflags=-linkmode=external'
    '-mod=readonly'
    '-modcacherw'
    '-trimpath'
  )
  go build "${_opts[@]}" -o build/oddmu .

  cd man
  make realclean
  make man
}

check() {
  cd "$_pkgname"

  build/oddmu version
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" build/oddmu
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/systemd" \
    ./*.{service,socket}
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/themes/default" \
    ./*.html
  cp -vfa themes/* "$pkgdir/usr/share/doc/$pkgname/themes/"

  for _sect in 1 5 7; do
    install -vDm0644 -t "$pkgdir/usr/share/man/man$_sect" man/*".$_sect"
  done

  cd "$pkgdir/usr/share/doc" && ln -vsrf "$pkgname" "$_pkgname"
}

# eof
