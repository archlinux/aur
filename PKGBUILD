# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxml2
pkgname=(
  libxml2
  libxml2-docs
)
pkgver=2.13.7
pkgrel=1
pkgdesc="XML C parser and toolkit"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  bash
  glibc
  icu
  readline
  xz
  zlib
)
makedepends=(
  git
  meson
  python
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
  0001-meson-Install-a-xml2-config-script.patch
  0002-meson-Build-fixes.patch
)
b2sums=('fc6186c28db0582fc52a0247e2a333c7030a62005efa6b98eb982acd78a28fc8bf2a542b340f86549cb6ac724d2f9fc94d4d8fdce374847fef61dcadd80132a2'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be'
        '9c9925ea96fc993b6e5dffb68629f0864d6d3445605c0de92bf07156c81f88fbe4efb46f5784ce8dc5c87d8ccd4f8689dce09a91925f53b840887a514a6b2b8d'
        'a42e284cd50e87a6eb4bd66bc02f968fc9f79922e000295d9778c5f2974985251509d58214203e9f542bad365e85136f7f07672bd4b6e338e89b0bd9b14190f1')

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # Meson fixes
  git cherry-pick -n c2e2d76211e27df3c882616a14b4da24df7d3cb3
  git cherry-pick -n 064a02114a0e35ac9d87dd1a0952e6c474273a68
  git apply -3 ../0001-meson-Install-a-xml2-config-script.patch
  git apply -3 ../0002-meson-Build-fixes.patch
}

build() {
  local meson_options=(
    -D history=true
    -D http=true
    -D legacy=true
    -D python=true
  )

  arch-meson libxml2 build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libxml2() {
  optdepends=('python: Python bindings')
  provides=(libxml2.so)

  meson install -C build --destdir "$pkgdir"

  # Split docs
  mkdir -p doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t doc/usr/share

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxml2-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
