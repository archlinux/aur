# Maintainer: atomicfs

pkgname=mdbook-rss-git
_pkgname=mdbook-rss
pkgver=8.dc948c6
pkgrel=1
pkgdesc="A preprocessor for mdbook to generate an RSS feed from your chapters"
url="https://gitlab.com/albalitz/mdbook-rss"
arch=(x86_64)
license=(MPL)
makedepends=(rust cargo)
source=("git+${url}.git"
        'mdbook-rss.patch')
sha256sums=('SKIP'
            'd81c8b821e17ee91daf5e2e2d33707a815eb01ec1b55c4deb220058589d3b85d')

# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
pkgver() {
  cd "${srcdir}/${_pkgname}"
  version=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")
  echo "${version:1}"
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/mdbook-rss.patch"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

