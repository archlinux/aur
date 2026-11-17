# Maintainer: Gianluca Boiano <morf3089@gmail.com>
pkgname=openartifact-bin
pkgver=0.25.0 # renovate: datasource=github-releases depName=openartifact/openartifact extractVersion=^v(?<version>\d.+)$
pkgrel=1
pkgdesc="Free-as-in-freedom artifact repository manager (Maven, npm, PyPI, OCI, Helm, ...) - prebuilt binaries"
arch=('x86_64' 'aarch64')
url='https://github.com/openartifact/openartifact'
license=('AGPL-3.0-or-later')
provides=("openartifact=$pkgver" "oa-cli=$pkgver")
conflicts=('openartifact')
backup=('etc/openartifact/openartifact.yaml')
source=("openartifact.service")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/openartifact_${pkgver}_linux_amd64.tar.gz"
               "oa-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/oa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/openartifact_${pkgver}_linux_arm64.tar.gz"
                "oa-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/oa_${pkgver}_linux_arm64.tar.gz")
noextract=("$pkgname-$pkgver-$CARCH.tar.gz" "oa-$pkgver-$CARCH.tar.gz")
sha256sums=('bc1ec1cb88982f5c3bfc5a86505bcc8b87e6e83541609526b90b298ea2c473cb')
sha256sums_x86_64=('719b4e07c741a92086004c07a873b0019b087ffb2c5ce465746acfe304c61ecb'
                   '30e561fc763756121246e8167365c28c08b129e21dfec1e54fc78b13779af97b')
sha256sums_aarch64=('5f421f9b9af8c7be268972bbb46320b77f163d09b21c3d0242ce18d86d6c8cc2'
                    '1ecda026ec16f08eea3db563508d0a107204c010ae458f4bf1606806bed52e7d')

prepare() {
  mkdir -p server cli
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C server
  bsdtar -xf "oa-$pkgver-$CARCH.tar.gz" -C cli
}

package() {
  install -Dm755 server/openartifact "$pkgdir/usr/bin/openartifact"
  install -Dm755 server/resetpw "$pkgdir/usr/bin/openartifact-resetpw"
  install -Dm755 cli/oa "$pkgdir/usr/bin/oa"
  install -Dm644 cli/completions/oa.bash "$pkgdir/usr/share/bash-completion/completions/oa"
  install -Dm644 cli/completions/_oa "$pkgdir/usr/share/zsh/site-functions/_oa"
  install -Dm644 cli/completions/oa.fish "$pkgdir/usr/share/fish/vendor_completions.d/oa.fish"
  install -Dm644 server/openartifact.example.yaml "$pkgdir/etc/openartifact/openartifact.yaml"
  install -Dm644 server/.env.example "$pkgdir/usr/share/doc/$pkgname/env.example"
  install -Dm644 server/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 openartifact.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 server/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
