# Contributor: tectonic-deploy <sasha+tectonic@hackafe.net>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tectonic-git
pkgver=20220302
pkgrel=1
arch=('x86_64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('rust' 'gcc' 'pkg-config' 'git')
conflicts=('tectonic')
provides=('tectonic')
source=("git+https://github.com/tectonic-typesetting/tectonic.git" "git+https://github.com/tectonic-typesetting/tectonic-staging.git")
sha512sums=('SKIP'
            'SKIP')
options=('!lto')

pkgver() {
  cd ${pkgname%-git}
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

prepare() {
  cd ${pkgname%-git}
  git submodule update --init
}

build() {
  cd ${pkgname%-git}
  cargo build --release --features external-harfbuzz
}

package() {
  cd ${pkgname%-git}
  install -Dm755 ${CARGO_TARGET_DIR:-target}/release/tectonic "$pkgdir"/usr/bin/tectonic
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
