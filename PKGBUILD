# Maintainer: Shadowbee <shadowbee.contact@proton.me>
# Maintainer: Eldred Habert <arch@(my first name).fr>
pkgname=hister-bin
pkgver=0.20.0
pkgrel=2
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
provides=(hister)
conflicts=(hister hister-git)
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
# makedepends=('go' 'npm')
optdepends=('postgresql: For an alternate database')
install=hister.install
options=(!lto)
source=(hister.override.service
        systemd-user.patch
        hister.sysusers
        "LICENSE-$pkgver::https://raw.githubusercontent.com/asciimoo/hister/refs/tags/v$pkgver/LICENSE"
        "hister-$pkgver.service::https://raw.githubusercontent.com/asciimoo/hister/refs/tags/v$pkgver/contrib/systemd/hister.service")
sha256sums=('f5713114859925e53bd9f99d26072bcf07946011545d1e69fbaf09a7623e7e23'
            '5e9694bb6d48932dba75daa4795c541d8b6c6dbb894d02d9bfe96ae62b1d63e4'
            '5f4f3e82c42ba517d0caaa1deb4d3532c4f26cc60e42861bff1c5c6dacf34e9f'
            '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
            '4752aafdb88d88697e39e19791aba5c71670bd17dc52c8ba2d9a430673430ff4')
sha256sums_x86_64=('28c453cd3fe383dac936f91450c0bd6d3be4944079670aa607f38e01215844fe')
sha256sums_aarch64=('28c453cd3fe383dac936f91450c0bd6d3be4944079670aa607f38e01215844fe')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_amd64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_arm64")
backup=(etc/hister/{hister.env,config.yml})

prepare() {

    # We install in a location suitable for vendor installs.
    sed -i 's,/usr/local/,/usr/,g' hister-$pkgver.service
    # Create a separate user service file (taking in the above modification).
    cp hister{-$pkgver,-user}.service

    patch --force --forward -p3 < "$srcdir/systemd-user.patch"
}

build() {
  chmod +x hister-bin-$pkgver

  for _shell in bash zsh fish; do
    ./hister-bin-$pkgver completion $_shell > hister.$_shell
  done

  ./hister-bin-$pkgver config create >config.yml
}

package() {
  install -Dsm755 hister-bin-$pkgver "$pkgdir/usr/bin/hister"
  install -Dm644 hister-$pkgver.service     "$pkgdir/usr/lib/systemd/system/hister.service"
  install -Dm644 hister.override.service    "$pkgdir/usr/lib/systemd/system/hister.service.d/00-arch.conf"
  install -Dm644 hister-user.service        "$pkgdir/usr/lib/systemd/user/hister.service"
  install -Dm644 hister.override.service    "$pkgdir/usr/lib/systemd/user/hister.service.d/00-arch.conf"
  sed -i 's/DynamicUser=.*/DynamicUser=no/' "$pkgdir/usr/lib/systemd/user/hister.service.d/00-arch.conf"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/null  "$pkgdir/etc/hister/hister.env"
  install -Dm644 config.yml "$pkgdir/etc/hister/config.yml"

  install -Dm644 hister.bash "$pkgdir/usr/share/bash-completion/completions/hister"
  install -Dm644 hister.zsh  "$pkgdir/usr/share/zsh/site-functions/_hister"
  install -Dm644 hister.fish "$pkgdir/usr/share/fish/vendor_completions.d/hister.fish"
}
