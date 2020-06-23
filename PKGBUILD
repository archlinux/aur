# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=libertinus
pkgname="otf-$_pkgname-git"
pkgver=6.11.r75.gbbc3717
pkgrel=1
pkgdesc='The Libertinus font family, a fork of Linux Libertine and Biolinum with OpenType math'
arch=('any')
url="https://github.com/alif-type/$_pkgname"
license=('OFL')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_py_deps=('cffsubr'
          'fonttools'
          'fs'
          'lxml'
          'pcpp'
          'skia-pathops'
          'ufo2ft'
          'ufolib2>=0.7.1')
makedepends=('mupdf-tools'
             'psautohint'
             'python'
             "${_py_deps[@]/#/python-}"
             'sfd2ufo>=1.0.4'
             'texlive-core')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  sed -i -e '/^DIST/s/=/?=/;/zip -rq/d' Makefile
}

build() {
  cd "$pkgname"
  make -j$(nproc)
  make dist DIST=dist
}

package() {
  cd "$pkgname/dist"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" "${_pkgname^}"*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt AUTHORS.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md FONTLOG.txt documentation/*
}
