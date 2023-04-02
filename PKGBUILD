# Maintainer: atomicfs

pkgname=mdbook-rss-git
_pkgname=mdbook-rss
pkgver=8.dc948c6
pkgrel=2
pkgdesc="A preprocessor for mdbook to generate an RSS feed from your chapters"
url="https://gitlab.com/albalitz/mdbook-rss"
arch=(x86_64)
license=(MPL)
makedepends=(rust cargo)
source=("git+${url}.git"
        'mdbook-rss.patch')
sha256sums=('SKIP'
            'b644bfb8e6b1efb5f0f2bb314b629d7c2079503b2677a9130ee1a116134077a2')

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

