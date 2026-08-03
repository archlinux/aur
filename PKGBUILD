# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=profilecli-bin
_pkgname=profilecli
pkgver=2.2.0
pkgrel=1
pkgdesc='CLI for Grafana Pyroscope, the continuous profiling aggregation system (static binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/pyroscope'
license=('AGPL-3.0-only')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip !debug)

_url_base="https://github.com/grafana/pyroscope/releases/download/v$pkgver"

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$_url_base/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$_url_base/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('b26424d2084e748d854db308a6f601c8dedf02761ba69b65ae62f141ffd43c69')
sha256sums_aarch64=('c501feeba9b02de1dc4eca7ee6f33612a62967d6fae1fb3e4d9353e52aa6ddab')

build() {
  cd "$srcdir"

  # kingpin derives the completion function and `complete` target names from
  # basename($0). The tarball already unpacks the binary as `profilecli`, so
  # these must be generated from it in place — do not rename it first.
  ./"$_pkgname" --completion-script-bash >"$_pkgname.bash"
  ./"$_pkgname" --completion-script-zsh >"_$_pkgname"
}

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
