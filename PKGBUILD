# Maintainer Joost Bremmer <contact@madeofmagicandowires.online>
pkgbase=shortcut-git
pkgname=('shortcut-pages-git' 'shortcut-pages-extra-git' 'shortcut-c-client-git' 'shortcut-rust-client-git')
pkgver=1.0.3
pkgrel=1
pkgdesc="A commandline client to list shortcuts"
url="https://github.com/mt-empty/shortcut-c-client"
arch=('x86_64')
license=('unknown')
makedepends=('git' 'cargo')
source=("${pkgname[0]%-git}::git+https://github.com/mt-empty/${pkgname[0]%-git}.git"
        "${pkgname[2]%-git}::git+https://github.com/mt-empty/${pkgname[2]%-git}.git"
        "${pkgname[3]%-git}::git+https://github.com/mt-empty/${pkgname[3]%-git}.git"
        "${pkgname[2]%-git}.patch"
        "${pkgname[3]%-git}.patch")

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '412b11f98950f07eb6e3176058db3d458ace791ddbcfceb2ffea2cd6c7d1be82c6d1a7a04d36eb7d92117aa24e809894e8591d33fc313aa68e79d26cf8235e6d'
        '98b96a7f79bde2be6b35db58fb17a62179614325a1cbdcfd7672c266a82316f78ffed9c5f4a7795605d01f830feb5301fd086845b33e97c40b53b4a268a4a907')

pkgver() {
  cd "${srcdir}/shortcut-pages"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | tr -d 'v' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "${pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  pkgname="shortcut-c-client-git"
  patch --verbose -d "${srcdir}/${pkgname%-git}" -Np1 -i "../${pkgname%-git}.patch"

  pkgname="shortcut-rust-client-git"

  cd "${srcdir}/${pkgname%-git}"
  patch --verbose -Np1 -i "../${pkgname%-git}.patch"

  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target host-tuple
}

build() {
  # Building shortcut-c-client
  pkgname="shortcut-c-client-git"
  cd "${srcdir}/${pkgname%-git}"
  make DEST_DIR="/usr/share" shortcut


  # After that build the rust client
  pkgname="shortcut-rust-client-git"
  cd "${srcdir}/${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package_shortcut-pages-git() {
  pkgname=shortcut-pages-git
  pkgdesc="A collections of keyboard shortcuts for Desktop application and websites"
  url="https://github.com/mt-empty/shortcut-pages"
  arch=('any')
  license=('unknown')
  provides=('shortcut-pages')

  cd "$srcdir/shortcut-pages/GUI"

  install -dm755 "${pkgdir}/usr/share/shortcut/pages"
  find -L . -type f -iname "*.md" -not -regex '.*\(c\|git\|r\).md$' -exec \
    install -Dm644 "{}" "${pkgdir}/usr/share/shortcut/pages/{}" \;
}

package_shortcut-pages-extra-git() {
  pkgname=shortcut-pages-extra-git
  pkgdesc="An extra collection of cheatsheets for nonGUI applications and games"
  url="https://github.com/mt-empty/shortcut-pages"
  arch=('any')
  license=('unknown')
  provides=('shortcut-pages-extra' 'shortcut-pages')

  cd "$srcdir/shortcut-pages/misc/nonGUI"

  install -dm755 "${pkgdir}/usr/share/shortcut/pages"
  find -L . -type f -iname "*.md" -not -regex \
    '.*\/\(c\|git\|r\)\(\-\(language\|programming\)\)?.md$' -exec \
    install -Dm644 "{}" "${pkgdir}/usr/share/shortcut/pages/{}" \;
}

package_shortcut-c-client-git() {
  pkgname="shortcut-c-client-git"
  pkgdesc="A command line client for shortcut-pages"
  url="https://github.com/mt-empty/shortcut-c-client"
  arch=('x86_64')
  license=('unknown')
  depends=('shortcut-pages')
  optdepends=('shortcut-pages-extra')
  provides=('shorcut')
  conflicts=('shortcut-rs-client-git')

  cd "$srcdir/shortcut-c-client"

  install -Dm755 shortcut "${pkgdir}/usr/bin/shortcut"
}

package_shortcut-rust-client-git() {
  pkgname="shortcut-rust-client-git"
  pkgdesc="A command line client for shortcut-pages, written in rust"
  url="https://github.com/mt-empty/shortcut-rust-client"
  arch=('x86_64')
  license=('unknown')
  depends=('shortcut-pages')
  optdepends=('shortcut-pages-extra')
  provides=('shorcut')
  conflicts=('shortcut-c-client-git')

  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "./target/release/shortcut" "${pkgdir}/usr/bin/shortcut"
}

# vim: set ts=2 sts=2 sw=2 et:
