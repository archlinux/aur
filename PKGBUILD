# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=intermodal-bin
_pkgname=intermodal
pkgver=0.1.14
pkgrel=2
pkgdesc="User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust"
arch=('x86_64')
url="https://github.com/casey/intermodal"
license=('custom:CC0')
provides=('intermodal')
conflicts=('intermodal')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/imdl-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('3e527fbd43957282d52f9544868809e968874efa2222ea8f3cfd04db3907fcf1'
            'e9f9c8331a4287ef96d9cf13a3471bad059ca92a9e3ba61f1b60764a16d87ae8'
            '80382a0c049ef6cdf3cbe197d60072d65dde383c1f43ae1923e0d5eae4b42726'
            '18a8da7e8225b2f51db72047eb9ef3184abf10bea9b5994edabd948a417b7a5a'
            '44e7edeea41f3a31097861102a6bc28cf829b7456e488e53e2070cac24190d7e'
            'a00fcc80501f17ebcdaf7d9d613d4fa40b760e82cb02964932559298da98f1d9'
            'a658f0ad6bd644e0f2cab8186f869143d2428bf1094318b22092e8752eeff693'
            '4bc05261d1c1bdd3be4cdacfc6ed4a375bc5629828bcc2ff41038cba5868b11f')

# Here goes the hackery
_commit=020086f39a70a445eb01e9be26521b0cba966706
_book=(
  bittorrent/bep-support
  bittorrent/distributing-large-data-sets
  bittorrent/metainfo-utilities
  bittorrent/piece-length-selection
  bittorrent/piece-length
  bittorrent/references
  bittorrent/udp-tracker-protocol
)

for md in "${_book[@]}"; do
  source+=("$url/raw/$_commit/book/src/${md}.md")
done

package() {
  install -Dm 755 "imdl" -t "$pkgdir/usr/bin"

  # shell completions
  install -Dm 644 "completions/_imdl" "$pkgdir/usr/share/zsh/site-functions/_imdl"
  install -Dm 644 "completions/imdl.bash" "$pkgdir/usr/share/bash-completion/completions/imdl"
  install -Dm 644 "completions/imdl.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imdl.fish"

  # docs
  install -Dm 644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

  # book (not complete, but I can only do so much)
  find . -name '*.md' -not -name 'README.md' -exec \
    install -Dm 644 "{}" "$pkgdir/usr/share/doc/$_pkgname/book/{}" \;

  # license
  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
