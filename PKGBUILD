# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=profilecli-bin
_pkgname=profilecli
pkgver=2.4.3
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

sha256sums_x86_64=('f527ea43702046e029d3f7b82439066632e8aba7b1b3fd0b29876701a106666b')
sha256sums_aarch64=('e2b6dd0a9e7a68a748fe844cf16ca1ac71fb8aecfded91f5cafcb5ce0ab89ef8')

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
